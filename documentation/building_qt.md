# Building Qt

This guide will show how to build Qt using QtRb-VM.

## HOST->VM: Download required dependences 

First we must download all the required dependences, to do this run the below on the VM

```bash
cd /home/vagrant/qtrb && ./scripts/20_build_qt/10_download.sh
```

| Note: Ensure you are ssh'ed into the VM (followed stage 1 on the main read me file)

## HOST->VM: Mount sysroot

This step is going to mount and setup the sysroot image, run the following:

```
./scripts/20_build_qt/20_mount_sysroot.sh
```

## HOST->VM: Configure Qt

This step is going to configure Qt 5.9.1 for the raspberry pi, run the following:

```
./scripts/20_build_qt/30_configure_qt5_rpi.sh
```

## HOST->VM: Build Qt

Finally we are going to built Qt 5.9.1, run the following:

```
./scripts/20_build_qt/40_build.sh
```

