#!/bin/bash
source ${0%/*}/../config.sh
set -e

echo
echo '---------------------------------'
echo 'Retrieve toolchain'
echo '---------------------------------'

pushd $ROOT_DIR
	# Clone the pi tool chain
	if [ ! -d $TOOLCHAIN_DIR ] ; then
	    git clone --depth=1 -b master https://github.com/raspberrypi/tools $TOOLCHAIN_DIR
	fi
popd

pushd $TOOLCHAIN_DIR
	# Git pull lastest pi tool chain from git
	git pull
popd
