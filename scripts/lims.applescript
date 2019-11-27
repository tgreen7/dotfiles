local topTab
local bottomLeft

tell application "iTerm2"
    set current_path to POSIX path of ((path to me as text) & "::")
    tell current window
        -- create tab with default profile
        set topTab to (create tab with default profile)
    end tell
    tell current session of topTab
        set bottomLeft to (split horizontally with same profile)
        write text "cd ~/Sites/lims"
        write text "TG_CLIENTS=b@host yarn start-app-proxy"
    end tell
    tell bottomLeft
        write text "cd ~/Sites/lims"
        write text "TG_CLIENTS=1 yarn start-build-client"
    end tell
end tell

tell application "Chrome"
    open location "http://localhost:3000/"
end tell
