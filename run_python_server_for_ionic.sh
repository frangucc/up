#!/bin/sh

# Make a new OS X Terminal tab with the current working directory.

if [ $# -ne 1 ]; then
    PATHDIR=`pwd`
else
    PATHDIR=$1
fi

/usr/bin/osascript <<EOF
activate application "Terminal"
tell application "System Events"
    keystroke "t" using {command down}
end tell
tell application "Terminal"
    repeat with win in windows
        try
            if get frontmost of win is true then
                do script "cd $PATHDIR; clear" in (selected tab of win)
            end if
        end try
    end repeat
end tell
EOF
clear
python -m SimpleHTTPServer 8001