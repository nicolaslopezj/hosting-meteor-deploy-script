#!/bin/bash

# DOCKER_IMAGE="user set docker image"

# Go to app folder
cd /home/deploy/app
# cd $APP_LOCATION

if [[ "$APP_LOCATION" != "" ]]; then
  cd $APP_LOCATION
fi

METEOR_VERSION=$(cat ./.meteor/release)
# METEOR_VERSION="METEOR@1.5"

METEOR_DOCKER_1_6="abernix/meteord:node-8.9.1-base"
METEOR_DOCKER_1_5="abernix/meteord:base"
METEOR_DOCKER_1_4="abernix/meteord:base"

FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_6

if [[ "$METEOR_VERSION" == "METEOR@1.6"* ]]; then
  FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_6
fi

if [[ "$METEOR_VERSION" == "METEOR@1.5"* ]]; then
  FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_5
fi

if [[ "$METEOR_VERSION" == "METEOR@1.4"* ]]; then
  FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_4
fi

if [[ "$DOCKER_IMAGE" != "" ]]; then
  FINAL_DOCKER_IMAGE=$DOCKER_IMAGE
fi

echo $FINAL_DOCKER_IMAGE
