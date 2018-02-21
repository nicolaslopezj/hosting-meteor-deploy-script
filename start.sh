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

# export $(cat /home/deploy/.env | xargs)

echo "Varibales not exported"

forever start \
-c "meteor node" \
-o /home/deploy/app.log \
-e /home/deploy/appe.log \
main.js

forever list

forever logs 0

sleep 20s

forever logs 0

cat /home/deploy/app.log

echo "Checking deploy..."
sh /home/deploy/script/check.sh

cat /home/deploy/app.log

echo ""
echo "====> App started"
echo ""
