#!/bin/bash
source ${0%/*}/../../config.sh
set -e

echo
echo '---------------------------------'
echo 'Retrieve Raspbian image'
echo '---------------------------------'

pushd $ROOT_DIR

	# Download raspbian OS
	if [ ! -f $RASPBIAN_ZIP_FILENAME ] ; then
	    echo 'Download image from raspberrypi.org'
	    wget $RASBPIAN_URL
	else
	    echo "$RASPBIAN_ZIP_FILENAME is downloaded"
	fi

	# Install unzip
	sudo apt-get install zip

	# Extract the raspbian OS
	if [ ! -f $RASPBIAN_IMG_FILENAME ] ; then
	    echo 'Extract image from zile file'
	    unzip $RASPBIAN_ZIP_FILENAME
	else
	    echo "$RASPBIAN_ZIP_FILENAME is extracted"
	fi

popd