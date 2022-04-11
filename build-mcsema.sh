#!/bin/sh

# mohit kumar(343542)
# kmohit@cdac.in
# 12-Sept-2019

# Tested on ubuntu 18.04 12-09-2019

# Implementation of Shell script to build Mcsema  

#-------------------------
#Assumptions: the script is executed in users home directory
#-------------------------

# Upgrading Packages
echo --------------------
echo Upgrading packages
echo --------------------
 sudo apt-get upgrade

# Download dependencies
echo --------------------
echo Installing the dependencies
echo --------------------
 sudo apt-get install \
             git \
             curl \
             cmake \
             python2.7 python-pip python-virtualenv \
             wget \
             build-essential \
             gcc-multilib g++-multilib \
             libtinfo-dev \
             lsb-release \
             realpath \
             zlib1g-dev

# Download Mcsema and Remill source code

echo --------------------
echo Cloning the repository of mcsema and remill
echo --------------------

echo --------------------
echo \#1. Cloning the Mcsema into pwd
echo --------------------
        git clone --depth 1 https://github.com/trailofbits/mcsema.git
	export REMILL_VERSION=`cat ./mcsema/.remill_commit_id`

echo --------------------
echo \#2. Cloning the remill into pwd
echo --------------------
        git clone https://github.com/trailofbits/remill.git
	cd ~/remill
	git checkout -b temp ${REMILL_VERSION}


# Move the Mcsema repository inside remill/tools folder

echo --------------------
echo Moving the mcsema into the remill-build/tools                       
echo --------------------
	 mv -f ../mcsema ~/remill/tools

echo --------------------
echo Building Mcsema
echo --------------------
# Build Mcsema
	 ./scripts/build.sh

echo --------------------
echo Installation
echo --------------------
# Installing Mcsema
 cd ~/remill/remill-build
 sudo make install

# Verifying that Mcsema is installed properly or not 

echo --------------------
echo Try execution mcsema cmds: mcsema-disass \& mc-sema-lift-4.0
echo --------------------

 mcsema-disass
 mcsema-lift-4.0

echo --------------------
echo Remill Test Suite 
echo --------------------
 cd ~/remill/remill-build
 make test_dependencies
 make test
