#!/bin/bash
source ${0%/*}/config.sh
set -e

echo
echo '---------------------------------'
echo 'Generate packages'
echo '---------------------------------'

pushd $ROOT_DIR
	
	# Make package directory
	if [ ! -d $PCK_DIR ] ; then
	    mkdir $PCK_DIR
	fi

	# Remove old version of packages
	rm -f $PCK_DIR/qtrb_device_$PCK_VERSION.zip
	rm -f $PCK_DIR/qtrb_host_$PCK_VERSION.zip
	rm -f $PCK_DIR/qtrb_sysroot_$PCK_VERSION.zip
	rm -f $PCK_DIR/qtrb_logs_$PCK_VERSION.zip

	# Create new packages from compiled qt
	zip -r $PCK_DIR/qtrb_device_$PCK_VERSION.zip $QT_OUTPUT_DIR
	zip -r $PCK_DIR/qtrb_host_$PCK_VERSION.zip $QT_HOST_DIR
	zip -r $PCK_DIR/qtrb_sysroot_$PCK_VERSION.zip $SYSROOT_IMG_FILEPATH
	zip -r $PCK_DIR/qtrb_logs_$PCK_VERSION.zip $ROOT_DIR/logs

	# Print size of each package
	du -sh $PCK_DIR/qtrb_host_$PCK_VERSION.zip
	du -sh $PCK_DIR/qtrb_device_$PCK_VERSION.zip
	du -sh $PCK_DIR/qtrb_sysroot_$PCK_VERSION.zip
	du -sh $PCK_DIR/qtrb_logs_$PCK_VERSION.zip

popd
