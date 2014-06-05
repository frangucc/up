#!/bin/sh
echo Press any key to install \#UP!
read
#STEP 1 -- @@@@@@  CHECK FOR XCODE & INSTALL IF NEEDED @@@@@@ 
echo "Preparing #UP! shell scripts, this may take a sec..."
	#TODO 1: download a copy of xcode from my mirror. 
echo "STOP! this script if you haven't downloaded XCODE 5.0.2 and installed the DMG file - get XCODE running - future builds of UP will include XCODE"
	#TODO 2: launch bash installation visualization in chrome window. Visualize local machine receving various componenents.
	#TODO 3: use curl to try and visualize the time it's going to take from the terminal window. 
	#TODO 4: create some recovery process or wrap this in a check to see if this package is installed - would not want to try and download this twice.
	#TODO 5: decide what to do for existing xcode havers.
	#TODO 6: try and open xcode in a background window or out of focus.
	#TODO 7: If Xcode exists version x > above
	#TODO 8: Install Ruby so I can install gems. Later I use the SASS gem.
open -a "xcode"
echo "I just tried to open xcode, did anything happen? If Xcode 5.0.2 or later is infact installed, hit any key, else, abort"
#STEP 2 -- @@@@@@  INSTALL HOMEBREW @@@@@@ 
echo "Installing Homebrew - TODO:test on a new MAC"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update
cd /Library/
#STEP 3 -- @@@@@@  INSTALL NODE.JS @@@@@@ 
	#TODO 8: If Xcode exists version x > above
brew install node
#STEP 4 -- @@@@@@  INSTALL GIT @@@@@@ 
	#TODO 9: Install GIT - brew install git or make a thinner start.sh program that will fetch the latest source.
#STEP 5 -- @@@@@@  INSTALL CORDOVA PHONE GAP @@@@@@ 
	#TODO 10: 
echo "Installing cordova. Information on what I am doing now can be found in your browser"
echo "You will need to Sudo from here out - enter password"
cd ~/Desktop/getup
echo "ready to install Cordova?"
read
sudo npm install -g cordova
	#TODO 11: need to escape out of here manually
echo "No Errors? Groovy. Move on."
read
#STEP 6 -- @@@@@@  MAKE SOME DIRECTORIES & COMPILE STUFF @@@@@@ 
mkdir ~/Desktop/UP
cd ~/Desktop/UP
echo "What is the name of the multi-platform stack or product you are creating?"
read MY_PRODUCT
#STEP 6.25
cordova create $MY_PRODUCT com.example.$MY_PRODUCT $MY_PRODUCT
cd $MY_PRODUCT

#STEP 6.25 -- @@@@@@  Use YO to create another folder for generated cont @@@@@@ 
npm install -g yo generator-generator
mkdir ~/Desktop/$MY_PRODUCT/generator-$MY_PRODUCT && cd $_
yo generator
npm link
npm generator-$MY_PRODUCT

#STEP 6.75 - continue with cordova
cordova platform add ios
cordova prepare
	#TODO 12: open http://stackoverflow.com/questions/10379622/how-to-run-iphone-emulator-without-starting-xcode
cd ~/Desktop/UP/$MY_PRODUCT/platforms/ios/
echo "You may now run project $MY_PRODUCT via the Xcode iOS emulator in your other window"
open $MY_PRODUCT.xcodeproj
echo "OK, we got all the Xcode and ios crap installed, lets move onto android"
echo "Is that cool? You will need to confgire Androids SDK manager manually to install a bunch of crap, cool? Hit any key to proceed"
read
#STEP 7 -- @@@@@@  INSTALL ANDROID SDK & COMPILING @@@@@@ 
brew rm android-sdk
brew install android-sdk
echo "When the Android ADT manager opens, check and approve sdk tools, build tools, platform tools and select at least one Android version"
	#TODO 13: Wrap this android in some sort of if. It hangs here. For now, opening a new tab prior
	#TODO 14: this other process needs to be givin time or we need to kick this off after the android SDKs are installed - now we get Error: Missing platform-tools because it fires too early.
echo "Once the SDK tools and Android version 4.3 or above ar installed, press any key"
read
echo "Moving some files around and getting ready to launch the Android Developer Tools Environment - chill dude and let it happen"
cd /Library/
	#TODO 15: Check if this area exists
sudo mkdir Android
cd ~/Downloads
open adt-bundle-mac-x86_64-20131030.zip
echo "wait for package to unzip - when finished, hit any key"
read
sudo mv -f -v adt-bundle-mac-x86_64-20131030 /Library/Android/
cd /Library/Android/adt-bundle-mac-x86_64-20131030/eclipse/
open eclipse.app
cd ~/Desktop/UP/$MY_PRODUCT/
cordova platform add android
cordova build
echo "For more info on where you are at, check out your browser"
open http://docs.phonegap.com/en/edge/guide_platforms_android_index.md.html#Android%20Platform%20Guide
#STEP 8 -- @@@@@@  INSTALLING IONIC @@@@@@ 
open http://ionicframework.com/docs/
echo "Ready to continue? Press any key"
read
echo "Let's install IONIC now ontop of Cordova for a better UI experience"
git clone https://github.com/driftyco/ionic.git
cd ionic 
ionic start myproject
npm install
echo "ionic should be installed now - press enter and we'll fire up the local services"
read
cd ~/Desktop/UP/$MY_PRODUCT/ionic
bash run_ionic.sh
echo "Let's see Ionic in the browser for the first time"
#NOTE: this copies ionic over to corodva
# open http://ionicframework.com/docs/guide/installation.html
cd ~/Desktop/UP/$MY_PRODUCt/ionic
cp -R dist/* www/
cd ~/Desktop/UP/$MY_PRODUCT/
cordova plugin add org.apache.cordova.device
cordova plugin add org.apache.cordova.console
cordova plugin add org.apache.cordova.statusbar
# cordova plugin add org.apache.cordova.splashscreen
# cordova plugin add org.apache.cordova.camera
# cordova plugin add org.apache.cordova.contacts
# cordova plugin add org.apache.cordova.device-motion
# cordova plugin add org.apache.cordova.device-orientation
# cordova plugin add org.apache.cordova.dialogs
# cordova plugin add org.apache.cordova.file
# cordova plugin add org.apache.cordova.geolocation
# cordova plugin add org.apache.cordova.media-capture
# cordova plugin add org.apache.cordova.vibration


echo "Just installed two cordova plugins, device and console"
echo "building android project with Cordova and Ionic. Sec..."
#STEP 9 -- @@@@@@  SETTING UP SIMULATORS @@@@@@ 
	#TODO 1: Move the files correctly and write the new index.html file inside the cordova www folder - 
	#TODO 2: run the local emulators and build process for both android and ios in a seperate tab
	#TODO 3: npm install -g ios-sim find out what thats about. 
echo "installing something that will allow you to simulate in ios from the cmd line :)"
npm install -g ios-sim
npm install -g ios-deploy
echo "cool, installing ionic seed and injecting seed into cordova www root, press any key"
read
cd ~/Desktop/UP/$MY_PRODUCT/
gem install sass
#TIP: use sass --watch scss/app.scss:css/app.css if you want to customize the core SCSS @ionic
read
#ONLY update the repo below to driftyco if doing a major version migration from ionic - laste updated: Jan 15, 2014 - got it working smooth
#git clone git@github.com:driftyco/ionic-angular-cordova-seed.git
git clone git@github.com:frangucc/ionic-angular-cordova-seed.git
#TODO 2.2: Merge the ionic todo list into app and then remove all inspiration repos such as the one below: eventaully these will all be merged into Frank Pintos seed.
# OPTIONAL STARTER REPOS
# git clone https://github.com/nitrous-examples/ionic-todo
# git clone https://github.com/driftyco/chatroom-cordova-ionic-angularjs-firebase
# git clone https://github.com/driftyco/ionic-weather
# git clone https://github.com/driftyco/ionic-tutorial-status-fade
# git clone https://github.com/driftyco/ionic-intro
# git clone https://github.com/driftyco/ionic-contrib-swipe-cards
cd ~/Desktop/UP/$MY_PRODUCT/
rm -r -f www
	#TODO 4: You should probably rename the cordova ionic seed on my fork, it's decieving, it's much more than that, it has more crap init, the kichen sink app is larger with the tutorial below integrated
open http://www.thinkster.io/pick/eHPCs7s87O/angularjs-tutorial-learn-to-rapidly-build-real-time-web-apps-with-firebase
cd ionic-angular-cordova-seed
echo "awesome, we shold be able to get a sweet ionic seed running in the browser first. If this works, then we'll emulate in android, ios and blackberry next."
mv -f ~/Desktop/UP/$MY_PRODUCT/ionic-angular-cordova-seed/* ~/Desktop/UP/$MY_PRODUCT/
#STEP 9 -- @@@@@@  FIRE UP WEB SERVER FOR WEB PREVIEWS @@@@@@ 
echo "firing up webserver"
cd ~/Desktop/UP/$MY_PRODUCT/www
python -m SimpleHTTPServer 8001
open http://localhost:8001
#STEP 10 -- @@@@@@  SETTING UP GRUNT @@@@@@ 
cd ~/DesktopUP/$MY_PRODUCT/www
npm install -g grunt-cli
npm install grunt --save-dev
npm install grunt-contrib-uglify
npm install grunt-contrib-watch --save-dev
npm install grunt-contrib-jshint
npm install grunt-contrib-nodeunit
npm install grunt-contrib-internal

#STEP 11 -- @@@@@@  OPENING EMULATORES @@@@@@ 
echo "Opening your new android app in the emulator. Yes?"
read
#TODO: when all goes well, start emulating in as many devices as possible.
cordova build android
cordova emulate android
cordova build ios
cordova emulate ios
###############################################################################
###### now we install yeoman bower, etc. and start injections #################
###############################################################################
# cd ~/Desktop/UP/$MY_PRODUCT/www
# bash yeoman.sh
# need to git init now in the project that I started so that work can be saved and isn't torn down with teardown.sh
#STEP 11 -- @@@@@@  MAKE A COMMIT @@@@@@ 
cd ~/Desktop/UP/$MY_PRODUCT
git init
git remote add origin .
git add .
git commit -m "your first commit"
git push origin master
echo "your first commit to git was made with all nested versions of ionic and cordova - nice going."
	#TODO: makea an update script that will carefully update the project with the latest version of each dependency. This entire project should be tagged and versioned somehow so that there are no conflicts when you want to try and upgrade. Perhaps a snapshot of the current directory with a rolllback features - need to bash automate some git genius here a little bit.
	#TODO: upload xcodes 2gig dmg file and androids SDK on an FTP mirrior and curl that bitch so that the person installing this script dont need to do hardly nothing.
	#TODO: this is where i should make sure the directory /Volumes/Xcode/Xcode.app/Contents/Developer exists else create it and make sure the xcode file exists there. cannot run 'phonegap build ios' cmduntil this location exists with the file.