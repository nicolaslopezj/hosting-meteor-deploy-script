#!/bin/sh
set -e

echo "Starting check deploy"

DEPLOY_CHECK_PORT=80
DEPLOY_CHECK_WAIT_TIME=60
elaspsed=0

while true; do
  echo "Check deploy $elaspsed"
  sleep 1
  elaspsed=$((elaspsed+1))
  curl --fail -L localhost:$DEPLOY_CHECK_PORT && exit 0

  if [ $elaspsed -ge $DEPLOY_CHECK_WAIT_TIME ]; then
    echo "Error starting app"
    sudo docker logs meteor
    exit 1
  fi
done
