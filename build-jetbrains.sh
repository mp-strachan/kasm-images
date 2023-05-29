#!/bin/bash

WEBSTORM_VERSION=2023.2.1

# Webstorm
echo "Building Webstorm $WEBSTORM_VERSION..."
sudo docker build -t webstorm:$WEBSTORM_VERSION --build-arg version=$WEBSTORM_VERSION -f dockerfile-webstorm .
