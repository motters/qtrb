#!/bin/bash
source ${0%/*}/config.sh
set -e

echo
echo '---------------------------------'
echo 'Deploy to sysroot'
echo '---------------------------------'

pushd $ROOT_DIR
	
	# Remove any old versions of Qt 
	if [ ! -d $SYSROOT_QT_DEVICE_DIR ] ; then
	    sudo rm -rf $SYSROOT_QT_DEVICE_DIR
	fi

	# Copy the compiled version of qt to sysroot
	sudo cp -r $QT_OUTPUT_DIR $SYSROOT_QT_DEVICE_DIR