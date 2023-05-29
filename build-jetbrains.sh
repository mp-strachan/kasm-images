#!/bin/bash

clear

BUILD_ALL=false
BUILD_WEBSTORM=false

WEBSTORM_VERSION=2023.1.2

read -p "Build all images? (y/n)?" choice
case "$choice" in 
  y|Y ) BUILD_ALL=true;;
  n|N ) BUILD_ALL=false;;
  * ) echo "Invalid input";;
esac

if [ "$BUILD_ALL" != true ]; then
	read -p "Build Webstorm $WEBSTORM_VERSION? (y/n)?" choice
	case "$choice" in 
	  y|Y ) BUILD_WEBSTORM=true;;
	  n|N ) BUILD_WEBSTORM=false;;
	  * ) echo "Invalid input";;
	esac
fi

clear

if [ "$BUILD_ALL" != true ]; then
	echo "The following images will be built:"
	if [ "$BUILD_WEBSTORM" == true ]; then
		echo "[x] Webstorm $WEBSTORM_VERSION"
	else
		echo "[ ] Webstorm $WEBSTORM_VERSION"
	fi
fi

# Webstorm
echo "Building Webstorm $WEBSTORM_VERSION..."
sudo docker build -t webstorm:$WEBSTORM_VERSION --build-arg WEBSTORM_VERSION=$WEBSTORM_VERSION -f dockerfile-webstorm .
