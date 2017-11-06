# QTRB-VM

## Introduction

QtRb is a fork of the original Qtrb but has been changed so that the build takes place on a vm created by virtual box.

The original QtRb scripts were also edited so that they would work in the new format. Even though the project has been modified the end outcome has not; hence if you just want a compiled binary version of QtRb go to the official repo.

## System requirements

To use QtRb-VM you must have the following installed on your local machine

* Vagrant
* Virtual box or VMware

## Usage

The below will explain the steps involved in using the scripts.

### Stage 1: Startup virtual machine

First run the below to startup the virtual machine

```bash
vagrant up
```

Next ssh into the VM

```
vagrant ssh
```

### Stage 2: Creating a sysroot

This stage is to create a sysroot img that will be used during compiling Qt and in the end image. If you want to skip this step you can download a sysroot from [the official QtRb repo release page]().

To create your own sysroot follow the [guide in the documentation folder](documentation/creating_sysroot.md).

### Stage 3: Building Qt

This stage involves actually build Qt on the Ubuntu for the Raspberry Pi 3 / Compute Module 3. Two folders will be generated during this stage:

* qt-linux-rasp-pi3: This folder contains the binaries that Ubuntu will eventually be use to compile your end program
* qt5pi: This folder contains the compiled Qt binaries that will be hosted on the Raspberry Pi

If you want to skip this step you can download the latest version of "qt-linux-rasp-pi3" and "qt5pi" from [the official QtRb repo release page]() and skip step 3 and 4.

To build Qt (generating "qt-linux-rasp-pi3" and "qt5pi") following the quide in the [guide in the documentation folder](documentation/building_qt.md).

### Stage 3: Coping Qt to sysroot

Now that Qt has compiled the next step is to copy the compiled Qt libraries in "qt5pi" to the sysroot image. 

```
./scripts/30_final_image/10_deploy_to_sysroot.sh
```

Once the above has finished the next stage is to backup the packages you have generated. Run the below to backup all the relevant files and folders.

```
./scripts/30_final_image/20_generate_packages.sh
```

### Stage 4: Cleanup

This stage will clean the VM ready for future builds

```
./scripts/50_clean_build/10_unmount_sysroot.sh
./scripts/50_clean_build/20_clean_and_delete.sh
```

### Stage 4: Flashing new image

Whoou, you've finished all the hard stuff! Now all you have to do is flash the new Raspbian OS image an SD card and plug it into your Raspberry Pi.

The easiest way to do this is to download Etcher and burn the image file located in the "build" folder of QtRb-VM directory to an SD card.

## Testing Program



## Qt config summary

The compiled binaries configuration can be seen in the [documentation folder](documentation/qt_configure_summary.md)