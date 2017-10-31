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

# Install Yarn
echo ""
echo "====> Installing Yarn..."
echo ""
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

# Install docker
echo ""
echo "====> Installing Docker..."
echo ""
sh /home/deploy/script/installDocker.sh > /dev/null
