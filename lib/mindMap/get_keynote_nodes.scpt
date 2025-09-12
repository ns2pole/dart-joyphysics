-- Keynote ファイルのパスを POSIX パスで指定
set keynotePath to POSIX file "/Users/nakamurashunsuke/Documents/Youtube/joyphysics/lib/mindMap/dynamics.key"

tell application "Keynote"
    open keynotePath
    tell front document
        set slide1 to slide 1
        set nodeList to {}

        -- slide1 のすべての shape を取得
        repeat with o in (every shape of slide1)
            try
                set nodeId to name of o
                if nodeId = "" then set nodeId to "node" & (count of nodeList) -- 名前がない場合の代替名
            on error
                set nodeId to "node" & (count of nodeList)
            end try

            set pos to position of o
            set xPos to item 1 of pos
            set yPos to item 2 of pos
            set rot to 0
            try
                set rot to rotation of o
            end try

            set nodeInfo to {id:nodeId, x:xPos, y:yPos, w:width of o, h:height of o, rotation:rot}
            set end of nodeList to nodeInfo
        end repeat

        -- JSON 化
        set jsonString to "["
        repeat with i from 1 to count of nodeList
            set n to item i of nodeList
            set jsonString to jsonString & "{\"id\":\"" & (id of n) & "\",\"x\":" & (x of n) & ",\"y\":" & (y of n) & ",\"w\":" & (w of n) & ",\"h\":" & (h of n) & ",\"rotation\":" & (rotation of n) & "}"
            if i < count of nodeList then set jsonString to jsonString & ","
        end repeat
        set jsonString to jsonString & "]"

        return jsonString
    end tell
end tell

