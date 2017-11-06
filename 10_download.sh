#!/bin/bash

source ${0%/*}/config.sh
set -e

# Create folder folder for build
if [ ! -d "$ROOT_DIR" ] ; then
	sudo mkdir $ROOT_DIR
	sudo chown electronics:electronics $ROOT_DIR 
fi

# Download offical pi toolchain
./11_download_toolchain.sh

# Download qt source
./12_download_qt.sh

# Download raspbian OS
./13_download_raspbian.sh

# Download sysroot image
./14_download_sysroot.sh

# Copy scripts
./15_copy_scripts.sh
