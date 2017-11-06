#!/bin/bash
source ${0%/*}/../config.sh
#set -e

pushd $QT_SOURCE_DIR
	# Make Qt
	make -j $JOB_COUNT |& tee $ROOT_DIR/logs/make.log

	# Install 
	make -j $JOB_COUNT install |& tee $ROOT_DIR/logs/make_install.log

	# Print size of qt
	du -sh $QT_OUTPUT_DIR
popd
