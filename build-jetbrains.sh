#!/bin/bash

WEBSTORM_VERSION=2023.1.2

# Webstorm
echo "Building Webstorm $WEBSTORM_VERSION..."
sudo docker build -t webstorm:$WEBSTORM_VERSION --build-arg WEBSTORM_VERSION=$WEBSTORM_VERSION -f dockerfile-webstorm .
