#!/bin/bash
source ${0%/*}/config.sh
set -e

echo
echo '---------------------------------'
echo 'Mount sysroot'
echo '---------------------------------'
pushd $ROOT_DIR

# Create log directory
	if [ ! -d $ROOT_DIR/logs ] ; then
	    mkdir $ROOT_DIR/logs
	fi

	# Create sys root directory
	if [ ! -d $SYSROOT ] ; then
	    mkdir $SYSROOT
	fi

	# Mount the pi img
	sudo losetup -P /dev/loop0 $SYSROOT_IMG_FILENAME
	sudo mount /dev/loop0p2 $SYSROOT

	# QEMU (processor emulator for ARM)
	sudo apt-get -y install qemu-user-static
	sudo cp /usr/bin/qemu-arm-static $SYSROOT/usr/bin/

	sudo mount -o bind /proc $SYSROOT/proc
	sudo mount -o bind /dev $SYSROOT/dev
	sudo mount -o bind /sys $SYSROOT/sys


	# Fix issue with 'Illegal instruction'
	sudo sed -i '/./s/^/#/g' $SYSROOT/etc/ld.so.preload

	# Install required libs on pi img
	sudo chroot $SYSROOT /bin/bash -c 'apt install -y libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev'
	sudo chroot $SYSROOT /bin/bash -c 'apt install -y libxcb1 libxcb1-dev libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-image0 libxcb-image0-dev libxcb-shm0 libxcb-shm0-dev libxcb-icccm4 libxcb-icccm4-dev libxcb-sync1 libxcb-sync-dev libxcb-render-util0 libxcb-render-util0-dev libxcb-xfixes0-dev libxrender-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-glx0-dev libxcb-xinerama0-dev'
	

	# Fix symlinks
	chmod u+x $ROOT_DIR/sysroot-relativelinks.py
	sudo ./sysroot-relativelinks.py $ROOT_DIR/sysroot |& tee $ROOT_DIR/logs/relativelinks.log
popd 

