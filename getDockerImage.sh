#!/bin/sh

METEOR_VERSION=$(cat ./.meteor/release)
# DOCKER_IMAGE="user set docker image"

# Go to app folder
cd /home/deploy/code/app
if [[ "$APP_LOCATION" != "" ]]; then
  cd $APP_LOCATION
fi


METEOR_DOCKER_1_6="mrauhu/meteord:node-8.4.0-base"
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