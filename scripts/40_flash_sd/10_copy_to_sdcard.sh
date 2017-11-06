#!/bin/bash
source ${0%/*}/config.sh
set -e

echo
echo '---------------------------------'
echo 'Copy to sdcard'
echo '---------------------------------'

# Burn the new sys root to a SD card for the pi
sudo dd bs=4M if=$SYSROOT_IMG_FILEPATH of=/dev/sdd conv=fsync status=progress