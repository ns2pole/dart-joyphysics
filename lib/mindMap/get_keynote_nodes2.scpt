-- debug_get_keynote_nodes.scpt
set keynotePath to POSIX file "/Users/nakamurashunsuke/Documents/Youtube/joyphysics/lib/mindMap/dynamics.key"

tell application "Keynote"
    open keynotePath
    tell front document
        set slide1 to slide 1
        set nodeList to {}

        repeat with i from 1 to count of (every shape of slide1)
            set o to item i of (every shape of slide1)
            try
                set nm to name of o
            on error
                set nm to ""
            end try
            try
                set cls to class of o as string
            on error
                set cls to ""
            end try
            try
                set pos to position of o
                set xPos to item 1 of pos
                set yPos to item 2 of pos
            on error
                set xPos to 0
                set yPos to 0
            end try
            try
                set b to bounds of o
            on error
                set b to {0,0,0,0}
            end try
            try
                set rot to rotation of o
            on error
                set rot to 0
            end try

            set end of nodeList to {index:i, name:nm, class:cls, x:xPos, y:yPos, bounds:b, rotation:rot}
        end repeat

        -- JSON 出力（簡易）
        set jsonString to "["
        repeat with i from 1 to count of nodeList
            set n to item i of nodeList
            set jsonString to jsonString & "{\"index\":" & (index of n) & ",\"name\":\"" & (name of n) & "\",\"class\":\"" & (class of n) & "\",\"x\":" & (x of n) & ",\"y\":" & (y of n) & ",\"rotation\":" & (rotation of n) & "}"
            if i < count of nodeList then set jsonString to jsonString & ","
        end repeat
        set jsonString to jsonString & "]"
        return jsonString
    end tell
end tell

