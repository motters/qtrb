#!/bin/bash
source ${0%/*}/config.sh
#set -e

pushd $QT_SOURCE_DIR
make -j $JOB_COUNT |& tee $ROOT_DIR/logs/make.log
make -j $JOB_COUNT install |& tee $ROOT_DIR/logs/make_install.log
du -sh $QT_OUTPUT_DIR
popd
