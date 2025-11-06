tell application "iTerm2"
    activate
    
    -- Use the current window or create a new one
    set currentWindow to current window
    if currentWindow is missing value then
        set currentWindow to (create window with default profile)
    end if
    
    tell currentWindow
        -- Create a new tab and assign it to a variable
        set newTab to (create tab with default profile)
        
        tell newTab
            
            -- PANE 1: SERVER (Initial Session)
            set session1 to current session
            tell session1
                set name to "Server"
                write text "cd ~/Sites/tg-betteromics/root && yarn dev:server"
            end tell
            
            -- **PANE 2: CLIENT (Simulate Split)**
            tell application "System Events" to keystroke "d" using {command down, shift down}
            
            -- Pause to allow the split to register
            delay 0.5
            
            -- Session 2 is now the active session
            set session2 to current session
            tell session2
                set name to "Client"
                -- Run the command, then open a persistent shell (/bin/zsh)
                write text "cd ~/Sites/tg-betteromics/root && yarn dev:ui; /bin/zsh"
            end tell
            
            -- **PANE 3: MONITOR (Simulate Split)**
            -- We just created Session 2, so it is the active one, ready to be split again.
            tell application "System Events" to keystroke "d" using {command down, shift down}
            
            -- Pause to allow the split to register
            delay 0.5
            
            -- Session 3 is now the active session
            set session3 to current session
            tell session3
                set name to "Monitor"
                -- Run the command, then open a persistent shell (/bin/zsh)
                write text "cd ~/Sites/tg-betteromics/root && yarn dev:auth; /bin/zsh"
            end tell
            
            -- Optional: Re-focus on the first session (Server)
            select session1
            
        end tell
    end tell
end tell