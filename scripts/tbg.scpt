on run tbg
    tell application "Terminal"
        tell selected tab of front window
            if (item 1 of tbg = "default") then
                set background color to {9766, 12850, 14392, 85}
            else if (item 1 of tbg = "staging") then
                set background color to {10280, 10280, 6425, 85}
            else if (item 1 of tbg = "production") then
                set background color to {10794, 6682, 5911, 85}
            end if
        end tell
    end tell
end run
