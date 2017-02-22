#!/bin/sh

# Go to compiled app
cd ~/compiled/bundle
# Set port
export PORT=80
# Run app
sudo -E meteor node main.js
