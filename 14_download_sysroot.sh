#!/bin/bash
source ${0%/*}/config.sh
set -e

echo
echo '---------------------------------'
echo 'Retrieve sysroot image'
echo '---------------------------------'

pushd $ROOT_DIR

	# Download sysroot image if there is not one present
	if [ ! $SYSROOT_IMG_FILEPATH ] ; then
	    echo 'Download image from github'
	    wget $SYSROOT_HOSTED_IMG_FILEPATH
	else
	    echo "$SYSROOT_HOSTED_IMG_FILEPATH is already in folder"
	fi

	# Extract the sysroot image from the supplied zip
	if [ ! $RASPBIAN_IMG_FILENAME ] ; then
	    echo 'Extract image from zile file'
	    unzip $SYSROOT_HOSTED_IMG_FILENAME
	else
	    echo "$SYSROOT_HOSTED_IMG_FILENAME is already in folder"
	fi
popd
