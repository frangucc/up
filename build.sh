#!/bin/sh
echo "ios, android, blackberry, kindle and the mobile web"

cordova build ios
cordova emulate ios
cordova build android
cordova emulate android

python -m SimpleHTTPServer 8331
open ~/Desktop/UP/Francke/www/