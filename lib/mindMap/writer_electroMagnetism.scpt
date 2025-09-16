-- export_keynote_png.scpt
-- Keynote を開き、全スライドを PNG として出力する最短スクリプト
-- 必要なら slides:{1} のようにして特定スライドだけ出力できます。

-- === 設定（環境に合わせて書き換えてください） ===
set keynotePOSIXPath to "/Users/nakamurashunsuke/Documents/Youtube/joyphysics/lib/mindMap/electroMagnetism.key"
set outputFolderPOSIX to "/Users/nakamurashunsuke/Documents/Youtube/joyphysics/lib/mindMap/electroMagnetism/"

-- === 実行 ===
try
    -- 出力フォルダを確実に作る（Keynote に渡す前に）
    do shell script "mkdir -p " & quoted form of outputFolderPOSIX

    -- POSIX -> AppleScript ファイルオブジェクト（Keynote のコンテキスト外で）
    set keynotePath to POSIX file keynotePOSIXPath
    set outputFolderAlias to POSIX file outputFolderPOSIX as alias

    tell application "Keynote"
        -- Keynote を開いてファイルを読み込む
        set theDoc to open keynotePath
        save theDoc

        -- 全スライドを PNG（image format:PNG）
        -- 特定スライドのみなら with properties {image format:PNG, slides:{1}} のようにする
        export theDoc to outputFolderAlias as slide images with properties {image format:PNG}

        -- 必要ならドキュメントを閉じる（保存済みなので保存しない）
        close theDoc saving no
    end tell

    return "OK: exported to " & outputFolderPOSIX
on error errMsg number errNum
    return "ERROR: " & errMsg & " (" & errNum & ")"
end try
