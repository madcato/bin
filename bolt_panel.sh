#!/bin/sh

osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {4810, 860}
        set size to {1260, 840}
    end tell
end tell'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt watch sensors"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {4810, 400}
        set size to {530, 330}
    end tell
end tell'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt watch nvidia-smi"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {5340, 400}
        set size to {680, 470}
    end tell
end tell'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt htop"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {4810, 0}
        set size to {1260, 420}
    end tell
end tell'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt watch sudo liquidctl status"'
osascript -e 'tell application "System Events" to tell process "Terminal"
    tell window 1
        set position to {4810, 720}
        set size to {530, 160}
    end tell
end tell'
ssh bolt



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