#!/bin/bash

source ${0%/*}/../../config.sh
set -e

# Create folder folder for build
if [ ! -d "$ROOT_DIR" ] ; then
	sudo mkdir $ROOT_DIR
	sudo chown electronics:electronics $ROOT_DIR 
fi

# Download raspbian OS
./${0%/*}/11_download_raspbian.sh
