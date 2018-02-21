#!/bin/sh
set -e

echo "Auto detected script"

DETECTED_METEOR_VERSION=$(bash /home/deploy/script/getMeteorVersion.sh)
echo "Detected Meteor version \"$DETECTED_METEOR_VERSION\""

sh /home/deploy/script/prepare.sh

# Go to app folder
cd app
cd $APP_LOCATION

# Install NPM Deps
echo ""
echo "====> Installing app npm dependencies..."
echo ""
export PYTHON="/usr/bin/python2.7"
meteor npm install > /dev/null

# Build app
# export METEOR_PROFILE=100
# export METEOR_DEBUG_BUILD=1
echo ""
echo "====> Building app..."
echo ""
meteor build --architecture=os.linux.x86_64 /home/deploy/bundle --server-only --allow-superuser
echo ""
echo "====> App built"
echo ""

sh /home/deploy/script/start.sh
