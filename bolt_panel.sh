#!/bin/sh

osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt watch sensors"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {1800, 400}
        set size to {500, 580}
    end tell
end tell'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt watch nvidia-smi"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {2300, 400}
        set size to {640, 400}
    end tell
end tell'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt htop"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {1800, 0}
        set size to {1140, 380}
    end tell
end tell'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt watch sudo /home/danielvela/.local/bin/liquidctl status"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {2300, 810}
        set size to {640, 170}
    end tell
end tell'




# osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt watch sensors" set bounds of front window to {0, 22, 730, 531}'
#
# tell application "System Events" to tell process "Terminal"
#     tell window 1
#         set position to {50, 50}
#         set size to {1150, 850}
#     end tell
# end tell
#
# https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html#//apple_ref/doc/uid/TP40000983-CH216-SW54