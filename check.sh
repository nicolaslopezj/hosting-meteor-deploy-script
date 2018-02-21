#!/bin/sh
set -e

sleep 20s

echo "Starting check deploy"

DEPLOY_CHECK_PORT=80
DEPLOY_CHECK_WAIT_TRIES=50
elaspsed=1

while true; do
  echo "Check deploy #$elaspsed..."
  sleep 5
  elaspsed=$((elaspsed+1))
  curl --fail --head --insecure --max-time 1 "localhost:$DEPLOY_CHECK_PORT" && exit 0

  if [ $elaspsed -ge $DEPLOY_CHECK_WAIT_TRIES ]; then
    echo "Error starting app"
    sudo docker logs meteor
    exit 1
  fi
done
