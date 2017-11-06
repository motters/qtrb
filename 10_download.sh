#!/bin/bash

set -e

# Download offical pi toolchain
./11_download_toolchain.sh

# Download qt source
./12_download_qt.sh

# Download raspbian OS
./13_download_raspbian.sh

# Download sysroot image
./14_download_sysroot.sh

# Copy scripts
./15_copy_scripts.sh
