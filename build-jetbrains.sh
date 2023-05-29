#!/bin/bash

clear

BUILD_ALL=false
BUILD_DATAGRIP=false
BUILD_WEBSTORM=false

DATAGRIP_VERSION=2023.1.2
WEBSTORM_VERSION=2023.1.2

read -p "Build all images? (y/n)?  " choice
case "$choice" in 
  y|Y ) BUILD_ALL=true;;
  n|N ) BUILD_ALL=false;;
  * ) echo "Invalid input - aborting!"; exit 1;;
esac

if [ "$BUILD_ALL" != true ]; then
	clear
	read -p "Build Datagrip $DATAGRIP_VERSION? (y/n)?  " choice
	case "$choice" in 
	  y|Y ) BUILD_DATAGRIP=true;;
	  n|N ) BUILD_DATAGRIP=false;;
	  * ) echo "Invalid input - aborting!"; exit 1;;
	esac

	clear
	read -p "Build Webstorm $WEBSTORM_VERSION? (y/n)?  " choice
	case "$choice" in 
	  y|Y ) BUILD_WEBSTORM=true;;
	  n|N ) BUILD_WEBSTORM=false;;
	  * ) echo "Invalid input - aborting!"; exit 1;;
	esac
fi

clear

if [ "$BUILD_ALL" != true ]; then
	echo "The following images will be built:"

	if [ "$BUILD_DATAGRIP" == true ]; then
		echo "[x] Datagrip $DATAGRIP_VERSION"
	else
		echo "[ ] Datagrip $DATAGRIP_VERSION"
	fi

	if [ "$BUILD_WEBSTORM" == true ]; then
		echo "[x] Webstorm $WEBSTORM_VERSION"
	else
		echo "[ ] Webstorm $WEBSTORM_VERSION"
	fi
else
	echo "All images will be built."
fi

echo ""

read -p "Start build? (y/n)?  " choice
case "$choice" in 
  y|Y ) clear;;
  n|N ) clear; echo "Goodbye!"; exit 1;;
  * ) echo "Invalid input - aborting!"; exit 1;;
esac

# Datagrip
if [ "$BUILD_ALL" == true ] || [ "$BUILD_DATAGRIP" == true ]; then
	echo "Building Datagrip $DATAGRIP_VERSION..."
	sudo docker build -t datagrip:$DATAGRIP_VERSION --build-arg DATAGRIP_VERSION=$DATAGRIP_VERSION -f dockerfile-datagrip .
	clear
fi


# Webstorm
if [ "$BUILD_ALL" == true ] || [ "$BUILD_WEBSTORM" == true ]; then
	echo "Building Webstorm $WEBSTORM_VERSION..."
	sudo docker build -t webstorm:$WEBSTORM_VERSION --build-arg WEBSTORM_VERSION=$WEBSTORM_VERSION -f dockerfile-webstorm .
	clear
fi

clear

echo "All done!"