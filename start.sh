#!/bin/sh
set -e

sh /home/deploy/script/prepare.sh
sh /home/deploy/script/build.sh

# Go to compiled app
# cd /home/deploy/compiled/bundle
# Set port
# export PORT=80
# Run app
# nohup sudo -E meteor node main.js > /home/deploy/app.log 2>&1&

echo ""
echo "====> Starting Meteor Docker Image..."
echo ""

sudo docker run -d \
  --restart=always \
  --env-file /home/deploy/.env \
  -v /home/deploy/bundle:/bundle \
  -p 80:80 \
  --name=meteor \
  abernix/meteord:base

echo ""
echo "====> Started abernix/meteord:base"
echo ""

echo ""
echo "====> Starting app..."
echo ""

sleep 20s

sudo docker logs meteor --tail=30

echo ""
echo "====> App started"
echo ""

sleep 5s

nohup sh /home/deploy/script/pipeLogs.sh > /dev/null 2>&1 &
nohup sh /home/deploy/loggerDaemon.sh > /dev/null 2>&1 &

echo ""
echo "====> Logs started"
echo ""
