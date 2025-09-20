import subprocess
import json
import os
from PIL import Image, ImageDraw
from collections import defaultdict
import re

# ---------- helper ----------
def sanitize_filename(name: str, max_len=200):
    name = name.strip()
    name = re.sub(r'[\\/:"*?<>|]+', '_', name)
    if not name:
        name = "untitled"
    return name[:max_len]

def unique_path(path):
    base, ext = os.path.splitext(path)
    i = 1
    candidate = path
    while os.path.exists(candidate):
        candidate = f"{base}_{i}{ext}"
        i += 1
    return candidate

# ---------- Config（ここを調整） ----------
# 固定の線幅（整数）
DEFAULT_STROKE_WIDTH = 4   # 1〜4 程度が目安

# 塗りの透明度（0: 完全透明, 255: 不透明）
DEFAULT_FILL_ALPHA = 80    # かなり薄め。必要なら 20〜80 を試してください。

# 角丸半径の比率（元の挙動を参照しつつ上限をクリップ）
RADIUS_RATIO = 0.12

# ノードレイヤに入れる余白（回転で切れないようにする）
LAYER_PADDING = 8

# ---------- 0. writer.scpt 実行（元のまま） ----------
result_writer = subprocess.run(
    ["osascript", "writer_dynamics.scpt"],
    capture_output=True,
    text=True
)
# (任意) writer のエラーを無視する場合はここで処理を変えてください

# ---------- 1. AppleScript 実行してノード情報取得 ----------
result = subprocess.run(
    ["osascript", "get_keynote_nodes_dynamics.scpt"],
    capture_output=True,
    text=True
)

if result.returncode != 0:
    print("AppleScript 実行エラー")
    print("stdout:", repr(result.stdout))
    print("stderr:", repr(result.stderr))
    exit(1)

nodes = json.loads(result.stdout)
print("取得ノード数:", len(nodes))

# ---------- 2. 背景画像読み込み（元の挙動を保つ） ----------
base = os.path.dirname(__file__)

# Keynote の出力フォルダ（絶対パスを優先）
dynamics_dir = "/Users/nakamurashunsuke/Documents/Youtube/joyphysics/lib/mindMap/dynamics"
# 互換のために dynamics_folder も定義（元コードが使っていた変数名）
dynamics_folder = dynamics_dir

# フォルダ内の最初のファイルを dynamics.png にリネーム（元処理）
if os.path.isdir(dynamics_dir):
    for f in os.listdir(dynamics_dir):
        f_path = os.path.join(dynamics_dir, f)
        if os.path.isfile(f_path):
            new_path = os.path.join(dynamics_dir, "dynamics.png")
            if os.path.exists(new_path):
                os.remove(new_path)
            try:
                os.rename(f_path, new_path)
                print(f"Renamed {f} -> dynamics.png")
            except Exception as e:
                print("ファイルリネームに失敗:", e)
            break
else:
    print("dynamics_dir が存在しません:", dynamics_dir)
    exit(1)

img_path = os.path.join(dynamics_folder, "dynamics.png")
if not os.path.exists(img_path):
    print(f"{img_path} が存在しません")
    exit(1)

img = Image.open(img_path).convert("RGBA")

# ---------- 3. nodes をラベルごとにグルーピング ----------
groups = defaultdict(list)
for idx, node in enumerate(nodes):
    label_raw = node.get("objectText", "") or ""
    label = label_raw.strip()
    if label.lower() == "ignore":
        print(f"スキップ: index {idx+1}")
        continue
    if not label:
        label = f"highlighted_node_{idx+1}"
    groups[label].append((idx, node))

# 保存先
asset_dir = os.path.join(os.path.dirname(__file__), "../../assets/mindMap/forTopics")
os.makedirs(asset_dir, exist_ok=True)

# ---------- 4. 各ラベルごとに全ノードを赤枠で描画して1つのPNGを出力 ----------
for label, items in groups.items():
    safe_label = sanitize_filename(label)
    filename = f"{safe_label}.png"
    output_path = os.path.join(asset_dir, filename)
    output_path = unique_path(output_path)

    # 全体用ハイライトレイヤ（元画像と同じサイズ）
    highlight = Image.new("RGBA", img.size, (0, 0, 0, 0))

    for idx, node in items:
        # 数値は float にしておく
        cx = float(node["x"]) + float(node["w"]) / 2.0
        cy = float(node["y"]) + float(node["h"]) / 2.0
        w = float(node["w"])
        h = float(node["h"])
        angle = float(node.get("rotation", 0))

        # 固定線幅と塗りの透明度（config 値を使う）
        stroke_width = int(DEFAULT_STROKE_WIDTH)
        fill_alpha = int(DEFAULT_FILL_ALPHA)

        # ローカルレイヤ（ノード周りだけ）を作る — 回転を安定させるため
        w_i = max(1, int(round(w)))
        h_i = max(1, int(round(h)))
        pad = int(LAYER_PADDING + stroke_width * 2)
        layer_w = w_i + pad * 2
        layer_h = h_i + pad * 2

        shape_layer = Image.new("RGBA", (layer_w, layer_h), (0, 0, 0, 0))
        shape_draw = ImageDraw.Draw(shape_layer)

        # ローカル座標での矩形（pad を考慮）
        local_bbox = [pad, pad, pad + w_i, pad + h_i]

        # 角丸半径は元の方式に準拠しつつ、local bbox に合うようにクリップ
        calculated_radius = max(6, int(min(w, h) * RADIUS_RATIO))
        max_allowed_radius = min(w_i, h_i) // 2
        radius = min(calculated_radius, max_allowed_radius)

        # 塗りつぶし（薄い赤）と枠（不透明な赤）を同時に描く
        shape_draw.rounded_rectangle(
            local_bbox,
            radius=radius,
            fill=(255, 180, 180, fill_alpha),
            outline=(255, 0, 0, 255),
            width=stroke_width
        )

        # 回転（ローカルレイヤを回転：expand=True で回転後のサイズを自動調整）
        try:
            rotated_layer = shape_layer.rotate(-angle, resample=Image.BICUBIC, expand=True)
            # 注: Keynote などの角度の符号規約によって +/- を変更してください
        except Exception as e:
            print("回転中にエラー:", e)
            rotated_layer = shape_layer

        # rotated_layer を highlight（フルサイズ）に上書きペースト
        # ローカルレイヤ中心がノード中心 (cx,cy) に来るように位置を計算
        top_left_x = int(round(cx - (rotated_layer.width / 2.0)))
        top_left_y = int(round(cy - (rotated_layer.height / 2.0)))

        # paste の第三引数にマスクを渡すことでアルファを尊重して上書き
        highlight.paste(rotated_layer, (top_left_x, top_left_y), rotated_layer)

    # 元画像と合成して出力
    result_img = Image.alpha_composite(img, highlight)
    result_img.save(output_path)
    print(f"{output_path} を生成しました")
