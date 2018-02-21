#!/bin/sh
set -e

echo "Node version"
meteor node -v

sh /home/deploy/script/createSwapMemory.sh

cd /home/deploy/bundle

ls

tar xf server.tar.gz

cd bundle/programs/server

meteor npm install --production

cd /home/deploy/bundle/bundle

export $(cat /home/deploy/.env | xargs)

echo "Varibales exported"

meteor node main.js


echo ""
echo "====> App started"
echo ""
