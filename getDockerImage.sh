#!/bin/sh

# DOCKER_IMAGE="user set docker image"

pwd
ls

# Go to app folder
cd /home/deploy/app
pwd
ls
if [[ "$APP_LOCATION" != "" ]]; then
  cd $APP_LOCATION
fi

pwd
ls

METEOR_VERSION=$(cat ./.meteor/release)

echo "Meteor version found $METEOR_VERSION"

METEOR_DOCKER_1_6="mrauhu/meteord:node-8.4.0-base"
METEOR_DOCKER_1_5="abernix/meteord:base"
METEOR_DOCKER_1_4="abernix/meteord:base"

FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_6

if [[ "$METEOR_VERSION" == "METEOR@1.6"* ]]; then
  echo "found meteor 1.6"
  FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_6
fi

if [[ "$METEOR_VERSION" == "METEOR@1.5"* ]]; then
  echo "found meteor 1.5"
  FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_5
fi

if [[ "$METEOR_VERSION" == "METEOR@1.4"* ]]; then
  echo "found meteor 1.4"
  FINAL_DOCKER_IMAGE=$METEOR_DOCKER_1_4
fi

if [[ "$DOCKER_IMAGE" != "" ]]; then
  echo "meteor version not found"
  FINAL_DOCKER_IMAGE=$DOCKER_IMAGE
fi

echo $FINAL_DOCKER_IMAGE
