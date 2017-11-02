#!/bin/sh
set -e

FINAL_DOCKER_IMAGE=$(sh /home/deploy/script/getDockerImage.sh)
echo "Using docker image \"$FINAL_DOCKER_IMAGE\""

sh /home/deploy/script/prepare.sh


# Go to app folder
cd app
if [[ "$APP_LOCATION" != "" ]]; then
  cd $APP_LOCATION
fi

# Install NPM Deps
echo ""
echo "====> Installing app npm dependencies..."
echo ""
export PYTHON="/usr/bin/python2.7"
meteor npm install > /dev/null

# Build app
# export METEOR_PROFILE=100
# export METEOR_DEBUG_BUILD=1
echo ""
echo "====> Building app..."
echo ""
meteor build --architecture=os.linux.x86_64 /home/deploy/bundle --server-only --allow-superuser
echo ""
echo "====> App built"
echo ""
