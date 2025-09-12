import subprocess
import json
from PIL import Image, ImageDraw
import os
import math

# 1. AppleScript 実行してノード情報取得
result = subprocess.run(
    ["osascript", "get_keynote_nodes.scpt"],
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

# 2. 背景画像読み込み
img_path = os.path.join(os.path.dirname(__file__), "test.png")
if not os.path.exists(img_path):
    print(f"{img_path} が存在しません")
    exit(1)

img = Image.open(img_path).convert("RGBA")

# 3. 各ノードを順番にハイライト
for idx, node in enumerate(nodes):
    # ハイライト用レイヤー作成
    highlight = Image.new("RGBA", img.size, (0, 0, 0, 0))
    draw = ImageDraw.Draw(highlight)

    # 中心座標とサイズ
    cx = node["x"] + node["w"] / 2
    cy = node["y"] + node["h"] / 2
    w = node["w"]
    h = node["h"]
    angle = node.get("rotation", 0)

    # 四隅を中心基準で定義
    corners = [(-w/2, -h/2), (w/2, -h/2), (w/2, h/2), (-w/2, h/2)]

    # 回転（Keynoteと整合）
    rad = math.radians(-angle)
    cos_a = math.cos(rad)
    sin_a = math.sin(rad)
    rotated = [(cx + x * cos_a - y * sin_a, cy + x * sin_a + y * cos_a) for x, y in corners]

    # 多角形描画
    draw.polygon(rotated, fill=(255, 255, 0, 180))  # 半透明黄色

    # 背景と合成
    result_img = Image.alpha_composite(img, highlight)

    # 保存
    output_path = os.path.join(os.path.dirname(__file__), f"highlighted_node_{idx+1}.png")
    result_img.save(output_path)
    print(f"{output_path} が生成されました")

