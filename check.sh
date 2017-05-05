#!/bin/sh
set -e

DEPLOY_CHECK_PORT=80
DEPLOY_CHECK_WAIT_TIME=60
elaspsed=0
while [[ true ]]; do
  sleep 1
  elaspsed=$((elaspsed+1))
  curl --fail -L localhost:$DEPLOY_CHECK_PORT && sudo docker logs meteor --tail=300 && exit 0

  if [ "$elaspsed" == "$DEPLOY_CHECK_WAIT_TIME" ]; then
    revert_app
    exit 1
  fi
done
