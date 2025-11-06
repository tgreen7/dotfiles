tell application "iTerm2"
    activate
    
    -- Create a new window (if none exist) or use the current one to create a new tab
    set currentWindow to current window
    if currentWindow is missing value then
        set currentWindow to (create window with default profile)
    end if
    
    tell currentWindow
        -- Create a new tab and assign it to a variable
        set newTab to (create tab with default profile)
        
        tell newTab
            -- Session 1 (Initial Session) - Pane 1
            set session1 to current session
            tell session1
                set name to "Server"
                write text "npm run server" -- Replace with your first command
            end tell
            
            -- Split Pane 1 vertically to create Pane 2
            -- The new pane is created *next* to the active one and becomes the new "current session"
            set session2 to (split vertically with default profile command "npm run client") -- Replace with your second command
            tell session2
                set name to "Client"
            end tell
            
            -- Split Pane 2 vertically to create Pane 3
            set session3 to (split vertically with default profile command "npm run monitor") -- Replace with your third command
            tell session3
                set name to "Monitor"
            end tell
            
            -- Optional: Re-focus on the first session (Server)
            select session1
            
        end tell
    end tell
end tell