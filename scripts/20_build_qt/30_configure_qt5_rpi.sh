#!/bin/bash
source ${0%/*}/../config.sh
set -e

pushd $QT_SOURCE_DIR
	# Configure qt for the raspberry pi and log the process
	./configure -no-pch -release -opengl es2 -device linux-rasp-pi3-g++ \
		-device-option CROSS_COMPILE=$CROSS_COMPILE \
		-sysroot $SYSROOT \
		-opensource -confirm-license -make libs \
		-prefix $QT_DEVICE_DIR \
		-extprefix $QT_OUTPUT_DIR \
		-hostprefix $QT_HOST_DIR \
		-no-use-gold-linker \
		-qt-xcb \
		-v \
		|& tee $ROOT_DIR/logs/configure.log
popd
