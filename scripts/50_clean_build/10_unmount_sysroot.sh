#!/bin/bash
source ${0%/*}/../config.sh
set -e

echo
echo '---------------------------------'
echo 'Unmount sysroot'
echo '---------------------------------'

pushd $ROOT_DIR

	# Un mount
	sudo umount $SYSROOT/sys
	sudo umount $SYSROOT/dev
	sudo umount $SYSROOT/proc

	# Un mount sysroot folder and destroy loop device
	sudo umount $SYSROOT
	sudo losetup -d /dev/loop0

	# Delete sysroot folder
	sudo rm -r $SYSROOT	

popd

