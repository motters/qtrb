# QTRB-VM

## Introduction

QtRb is a fork of the original Qtrb but has been changed so that the build takes place on a vm created by virtual box.

The original QtRb scripts were also edited so that they would work in the new format. Even though the project has been modified the end outcome has not; hence if you just want a compiled binary version of QtRb go to the official repo.

## Usage

The below will explain the steps involved in using the scripts.

### Stage 1: Creating a sysroot

The first stage is to create a sysroot img that will be used during compiling Qt and in the end image. If you want to skip this step you can download a sysroot from [the official QtRb repo release page]().

To create your own sysroot follow the [guide in the documentation folder](documentation/creating_sysroot.md).

### Stage 2: Building Qt

### Stage 3: Coping Qt to sysroot

### Stage 4: Flashing new image

## Testing Program



## Qt config summary

The compiled binaries configuration can be seen in the [documentation folder](documentation/qt_configure_summary.md)