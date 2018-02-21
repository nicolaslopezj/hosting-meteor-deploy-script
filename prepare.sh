#!/bin/sh
set -e

# Install things
echo ""
echo "====> Updating apt registry..."
echo ""
sudo apt-get update > /dev/null

# Install python
echo ""
echo "====> Installing python2.7..."
echo ""
sudo apt-get install build-essential -y > /dev/null
sudo apt-get install python2.7 -y > /dev/null

# Install Meteor
echo ""
echo "====> Installing Meteor..."
echo ""
export HOME=/home/ubuntu
curl https://install.meteor.com/ 2>/dev/null | sh

# Install node
echo ""
echo "====> Installing Npm and node..."
echo ""
sudo apt-get install nodejs -y > /dev/null
ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install npm -y > /dev/null

echo "NPM version:"
npm -v
echo "Node version:"
node -v

# Install node
echo ""
echo "====> Installing forever..."
echo ""
npm install -g forever
echo "Forever installed"
