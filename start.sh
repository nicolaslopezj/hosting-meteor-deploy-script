#!/bin/sh
set -e

echo ""
echo "====> Starting Meteor Docker Image..."
echo ""

sudo docker run -d \
  --restart=always \
  --env-file /home/deploy/.env \
  -v /home/deploy/bundle:/bundle \
  -p 80:80 \
  --name=meteor \
  $DOCKER_IMAGE

echo ""
echo "====> Started $DOCKER_IMAGE"
echo ""

echo ""
echo "====> Starting app..."
echo ""

echo "Getting logs..."
sudo docker logs meteor --tail=30

echo "Checking deploy..."
sh /home/deploy/script/check.sh
sudo docker logs meteor

echo ""
echo "====> App started"
echo ""

sleep 5s

nohup sh /home/deploy/script/pipeLogs.sh > /dev/null 2>&1 &

echo ""
echo "====> Logs started"
echo ""
