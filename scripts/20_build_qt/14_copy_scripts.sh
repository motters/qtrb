#!/bin/bash
source ${0%/*}/../config.sh
set -e

echo
echo '---------------------------------'
echo 'Coping scripts '
echo '---------------------------------'

# Copy relativelink script
if [ ! -f $ROOT_DIR/sysroot-relativelinks.py ] ; then
	cp -b ${0%/*}/sysroot-relativelinks.py $ROOT_DIR
fi

