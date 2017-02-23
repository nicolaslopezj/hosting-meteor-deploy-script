#!/bin/sh
set -e

# Go to compiled app
# cd ~/compiled/bundle
# Set port
# export PORT=80
# Run app
# nohup sudo -E meteor node main.js > ~/app.log 2>&1&

echo ""
echo "====> Starting Meteor Docker Image..."
echo ""

sudo docker run -d \
  --restart=always \
  --env-file ~/env \
  -v ~/bundle:/bundle \
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

sudo docker logs meteor

echo ""
echo "====> App started"
echo ""
