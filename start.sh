#!/bin/sh

# Go to compiled app
cd ~/compiled/bundle
# Set port
export PORT=80
# Run app
nohup sudo -E meteor node main.js > ~/app.log 2>&1&
