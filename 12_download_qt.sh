#!/bin/bash
source ${0%/*}/config.sh
set -e

echo
echo '---------------------------------'
echo 'Retrieve Qt5'
echo '---------------------------------'
pushd $ROOT_DIR

	if [ ! -d $QT_SOURCE_DIR ] ; then
		# Clone Qt 5 source
	    git clone git://code.qt.io/qt/qt5.git $QT_SOURCE_DIR

	    pushd $QT_SOURCE_DIR
	    	# Prep qt modules
		    perl init-repository
		    git checkout $QT_TAG_VERSION
		    git submodule update --recursive
	    popd
	else
	    echo 'Qt sources already retrieved'
	fi

popd
