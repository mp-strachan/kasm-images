#!/bin/bash

clear

BUILD_ALL=false
BUILD_CLION=false
BUILD_DATAGRIP=false
BUILD_GOLAND=false
BUILD_INTELLIJ=false
BUILD_WEBSTORM=false

CLION_VERSION=2023.1.3
DATAGRIP_VERSION=2023.1.2
GOLAND_VERSION=2023.1.2
INTELLIJ_VERSION=2023.1.2
WEBSTORM_VERSION=2023.1.2

#######################################################################################

echo "--------------------------------------------"
echo "|  KASM Jetbrains Workspace Image Builder  |"
echo "--------------------------------------------"
echo ""

read -p "Build all images? (y/n)?  " choice
case "$choice" in 
  y|Y ) BUILD_ALL=true;;
  n|N ) BUILD_ALL=false;;
  * )   BUILD_ALL=false;;
esac

echo ""

if [ "$BUILD_ALL" != true ]; then

	# clion
	read -p "Build CLion $CLION_VERSION? (y/n)?  " choice
	case "$choice" in 
	  y|Y ) BUILD_CLION=true;;
	  n|N ) BUILD_CLION=false;;
	  * )   BUILD_CLION=false;;
	esac

	# datagrip
	read -p "Build Datagrip $DATAGRIP_VERSION? (y/n)?  " choice
	case "$choice" in 
	  y|Y ) BUILD_DATAGRIP=true;;
	  n|N ) BUILD_DATAGRIP=false;;
	  * )   BUILD_DATAGRIP=false;;
	esac

	# goland
	read -p "Build GoLand $GOLAND_VERSION? (y/n)?  " choice
	case "$choice" in 
	  y|Y ) BUILD_GOLAND=true;;
	  n|N ) BUILD_GOLAND=false;;
	  * )   BUILD_GOLAND=false;;
	esac

	# intellij
	read -p "Build IntelliJ IDEA $INTELLIJ_VERSION? (y/n)?  " choice
	case "$choice" in 
	  y|Y ) BUILD_INTELLIJ=true;;
	  n|N ) BUILD_INTELLIJ=false;;
	  * )   BUILD_INTELLIJ=false;;
	esac

	# webstorm
	read -p "Build Webstorm $WEBSTORM_VERSION? (y/n)?  " choice
	case "$choice" in 
	  y|Y ) BUILD_WEBSTORM=true;;
	  n|N ) BUILD_WEBSTORM=false;;
	  * )   BUILD_WEBSTORM=false;;
	esac
fi

clear

if [ "$BUILD_ALL" != true ]; then
	echo "The following images will be built:"

	# clion
	if [ "$BUILD_CLION" == true ]; then
		echo "[x] CLion $CLION_VERSION"
	else
		echo "[ ] CLion $CLION_VERSION"
	fi

	# datagrip
	if [ "$BUILD_DATAGRIP" == true ]; then
		echo "[x] Datagrip $DATAGRIP_VERSION"
	else
		echo "[ ] Datagrip $DATAGRIP_VERSION"
	fi

	# goland
	if [ "$BUILD_GOLAND" == true ]; then
		echo "[x] GoLand $GOLAND_VERSION"
	else
		echo "[ ] GoLand $GOLAND_VERSION"
	fi

	# goland
	if [ "$BUILD_INTELLIJ" == true ]; then
		echo "[x] InteliJ IDEA $INTELLIJ_VERSION"
	else
		echo "[ ] IntelliJ IDEA $INTELLIJ_VERSION"
	fi

	# webstorm
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
  n|N ) clear; echo "Goodbye!"; exit 0;;
  * ) echo "Invalid input - aborting!"; exit 1;;
esac

#######################################################################################

# CLion
if [ "$BUILD_ALL" == true ] || [ "$BUILD_CLION" == true ]; then
	echo "Building CLion $CLION_VERSION..."
	sudo docker build -t clion:$CLION_VERSION --build-arg CLION_VERSION=$CLION_VERSION -f dockerfile-clion .
	clear
fi

# Datagrip
if [ "$BUILD_ALL" == true ] || [ "$BUILD_DATAGRIP" == true ]; then
	echo "Building Datagrip $DATAGRIP_VERSION..."
	sudo docker build -t datagrip:$DATAGRIP_VERSION --build-arg DATAGRIP_VERSION=$DATAGRIP_VERSION -f dockerfile-datagrip .
	clear
fi

# GoLand
if [ "$BUILD_ALL" == true ] || [ "$BUILD_GOLAND" == true ]; then
	echo "Building GoLand $GOLAND_VERSION..."
	sudo docker build -t goland:$GOLAND_VERSION --build-arg GOLAND_VERSION=$GOLAND_VERSION -f dockerfile-goland .
	clear
fi

# IntelliJ IDEA
if [ "$BUILD_ALL" == true ] || [ "$BUILD_INTELLIJ" == true ]; then
	echo "Building IntelliJ IDEA $INTELLIJ_VERSION..."
	sudo docker build -t intellij:$INTELLIJ_VERSION --build-arg INTELLIJ_VERSION=$INTELLIJ_VERSION -f dockerfile-intellij .
	clear
fi


# Webstorm
if [ "$BUILD_ALL" == true ] || [ "$BUILD_WEBSTORM" == true ]; then
	echo "Building Webstorm $WEBSTORM_VERSION..."
	sudo docker build -t webstorm:$WEBSTORM_VERSION --build-arg WEBSTORM_VERSION=$WEBSTORM_VERSION -f dockerfile-webstorm .
	clear
fi

clear

echo "All done... Goodbye!"
exit 0