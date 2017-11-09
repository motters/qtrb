#!/bin/bash
source ${0%/*}/../config.sh
set -e

echo
echo '---------------------------------'
echo 'Retrieve sysroot image'
echo '---------------------------------'

pushd $ROOT_DIR

	# Download sysroot image if there is not one present
	if [ ! -f $SYSROOT_HOSTED_IMG_FILEPATH ] ; then
	    echo 'Download image from github'
	    sudo wget $SYSROOT_HOSTED_IMG_FILEURL
	else
	    echo "$SYSROOT_HOSTED_IMG_FILEPATH is already in folder"
	fi

	# Extract the sysroot image from the supplied zip
	if [ ! -f $SYSROOT_IMG_FILEPATH ] ; then
	    echo 'Extract image from zile file'
	    sudo unzip $SYSROOT_HOSTED_IMG_ZIPPATH $SYSROOT_HOSTED_IMG_ZIP_IMGPATH -d /$ROOT_DIR
	    sudo mv $ROOT_DIR/$SYSROOT_HOSTED_IMG_ZIP_IMGPATH $ROOT_DIR
	    sudo rm -r $ROOT_DIR/opt
	else
	    echo "$SYSROOT_HOSTED_IMG_FILENAME is already in folder"
	fi
popd
