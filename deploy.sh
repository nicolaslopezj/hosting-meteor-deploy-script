#!/bin/sh

sh -x ~/script/createSwapMemory.sh

# Install things
sudo apt-get update
sudo apt-get install build-essential -y
sudo apt-get install python2.7 -y
export PYTHON="/usr/bin/python2.7"

# Install Meteor
curl https://install.meteor.com/ | sh

# Go to app folder
cd app
cd $APP_LOCATION # Add an if here

# Install NPM Deps
meteor npm install

# Build app
export METEOR_PROFILE=100
export METEOR_DEBUG_BUILD=1
meteor build --directory ~/compiled --server-only

# Go to compiled app
cd ~/compiled/bundle/programs/server
# Install production modules
meteor npm install --production
