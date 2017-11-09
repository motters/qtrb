# Script root output location
ROOT_DIR=/opt/qtrb




# Location of pi tool chain
TOOLCHAIN_DIR=$ROOT_DIR/toolchain

# Which compiler should be used
CROSS_COMPILE=$TOOLCHAIN_DIR/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-

# Job count for build
JOB_COUNT=10




# Qt version to compile for
QT_TAG_VERSION=v5.9.1

# Where to put qt source
QT_SOURCE_DIR=$ROOT_DIR/qt5

# Where the qt binaries for the pi should be put on host
QT_OUTPUT_DIR=$ROOT_DIR/qt5pi # OUTPUT_DIR

# Where the qt binaries for the pi should be put on pi
QT_DEVICE_DIR=/usr/local/qt5pi # PREFIX_DIR

# Where the qt binaries for the host
QT_HOST_DIR=$ROOT_DIR/qt-linux-rasp-pi3 # OUTPUT_HOST_DIR

# Location of sysroot
SYSROOT=$ROOT_DIR/sysroot





# Raspbian OS location for download
RASBPIAN_URL=https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-09-08/2017-09-07-raspbian-stretch.zip

# Name of raspbian zip
RASPBIAN_ZIP_FILENAME=2017-09-07-raspbian-stretch.zip

# Name of raspbian img
RASPBIAN_IMG_FILENAME=2017-09-07-raspbian-stretch.img




# Name of sysroot img 
SYSROOT_IMG_FILENAME=qtrb_v0.1.img

# Location of sysroot img
SYSROOT_IMG_FILEPATH=$ROOT_DIR/$SYSROOT_IMG_FILENAME

# Location of qt binarys relative to host
SYSROOT_QT_DEVICE_DIR=$SYSROOT$QT_DEVICE_DIR


# Hosted version of sysroot image url
SYSROOT_HOSTED_IMG_FILEURL=https://github.com/GuillaumeLazar/qtrb/releases/download/v0.1/qtrb_sysroot_v0.1.zip

# Hosted version of sysroot zip name
SYSROOT_HOSTED_IMG_ZIPNAME=qtrb_sysroot_v0.1.zip

# Hosted version of sysroot image path
SYSROOT_HOSTED_IMG_ZIPPATH=$ROOT_DIR/$SYSROOT_HOSTED_IMG_ZIPNAME

# Hosted version of sysroot image path
SYSROOT_HOSTED_IMG_ZIP_IMGPATH=opt/qtrb/$SYSROOT_IMG_FILENAME



# Version for package to be exported at end of process
PCK_VERSION=v0.1

# Location for package to be exported at end of process
PCK_DIR=$ROOT_DIR/packages
