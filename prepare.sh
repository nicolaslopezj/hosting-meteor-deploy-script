#!/bin/sh
set -e

echo ""
echo "====> Creating Swap memory de compile..."
echo ""
sh ~/script/createSwapMemory.sh

# Install things
echo ""
echo "====> Updating apt registry..."
echo ""
sudo apt-get update

# Install python
echo ""
echo "====> Installing python2.7..."
echo ""
sudo apt-get install build-essential -y
sudo apt-get install python2.7 -y

# Install Meteor
echo ""
echo "====> Installing Meteor..."
echo ""
curl https://install.meteor.com/ | sh

# Install docker
echo ""
echo "====> Installing Docker..."
echo ""
sh ~/script/installDocker.sh
