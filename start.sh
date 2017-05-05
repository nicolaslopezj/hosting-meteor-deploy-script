#!/bin/sh
set -e

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
  $DOCKER_IMAGE

echo ""
echo "====> Started $DOCKER_IMAGE"
echo ""

echo ""
echo "====> Starting app..."
echo ""

<<<<<<< HEAD
sh /home/deploy/script/check.sh
=======
sleep 30s
sudo docker logs meteor --since 60s
>>>>>>> 64d443ea19791023a53c8f6a84642313bc1d8e62

echo ""
echo "====> App started"
echo ""

sleep 5s

nohup sh /home/deploy/script/pipeLogs.sh > /dev/null 2>&1 &

echo ""
echo "====> Logs started"
echo ""
