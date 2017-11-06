#!/bin/bash
source ${0%/*}/../config.sh
set -e

echo
echo '---------------------------------'
echo 'Coping scripts '
echo '---------------------------------'


cp -b sysroot-relativelinks.py $ROOT_DIR

