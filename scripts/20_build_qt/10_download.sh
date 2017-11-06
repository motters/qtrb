#!/bin/bash

source ${0%/*}/../config.sh
set -e

# Create folder folder for build
if [ ! -d "$ROOT_DIR" ] ; then
	sudo mkdir $ROOT_DIR
	sudo chown ubuntu:ubuntu $ROOT_DIR 
fi

# Ensure git is installed
sudo apt install git python3

# Download offical pi toolchain
./${0%/*}/11_download_toolchain.sh

# Download qt source
./${0%/*}/12_download_qt.sh

# Download sysroot image
./${0%/*}/13_download_sysroot.sh

# Copy scripts
./${0%/*}/14_copy_scripts.sh
