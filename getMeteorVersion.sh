#!/bin/sh

# DOCKER_IMAGE="user set docker image"

# Go to app folder
cd /home/deploy/app
cd $APP_LOCATION

METEOR_VERSION=$(cat ./.meteor/release)

echo $METEOR_VERSION
