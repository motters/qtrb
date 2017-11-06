# Creating sysroot image

This guide will demonstrate how to create a sysroot image file from scratch.

## HOST->VM: Download OS

First run the following command in the terminal 

```bash
cd /home/vagrant/qtrb && ./scripts/10_creating_sysroot/11_flash_sd/10_download.sh
```

| Note: Ensure you are ssh'ed into the VM (followed stage 1 on the main read me file)

## HOST: Flash raspbian OS to sd card

The next step is to flash the image that was just download to an SD card. Plus a microSD card into your compute which is at least 8GB is size.

Fashing an image can be performed multiple ways, the easy method is using (Etcher)[https://etcher.io/] which is a simple graphical UI that will allow you to flash "opt/qtrb/2017-09-07-raspbian-stretch.img" to your SD card.

The second way is to use use dd on linux or mac:

```bash
sudo dd bs=4M if={QtRb-VM Location}/build/2017-09-07-raspbian-stretch.img of=/dev/sdd conv=fsync status=progress
```

## PI: Insert SD card

Unmount the SD card from your PC and plug it into the PI and Boot up the raspberry pi.

## PI: Pull Qtrb

Qtrb contains some helper shells to prep the raspbain image, first we must pull the Qtrb project.

Note: If you have no internet connect copy the Qtrb folder from you host machine to you pi.

```bash
cd ~
git pull https://github.com/motters/qtrb.git
cd qtrb
```

## PI: Expand the file system

First we must expand the file system, this is automatically done on first boot so you could skip this stage out; however i like to run it again to make sure.

```bash
./10_expand_file_system.sh
```

## PI: Enable ssh

Again not a critical stage but will be required later on when remote deploying to the pi

```bash
./20_enable_ssh.sh
```

 Note: feel free to update your password!

## PI: Update OS

 Next we will update the system OS

```bash
./30_update.sh
```

## PI: Reboot the pi

 We will now reboot the pi to ensure all the above change take place

```bash
./40_reboot.sh
```

## PI: Shut down and remove SD card

 After reboot we will cleanly shutdown the pi and the remove the Sd card

```bash
./50_shutdown.sh
```

## HOST: Create image

Next plug the SD card back into the host PC and run the below command to create an image of the SD card, This will be your sysroot image.

```bash
sudo dd bs=4M if=/dev/sdd of={QtRb-VM Location}/build/qtrb_v0.1.img conv=fsync status=progress
```

If on windows use [Win32DiskImager](http://sourceforge.net/projects/win32diskimager/) to create the image file from the SD card, and save it into the "build" folder under the QtRb-VM folder. Ensure the image name is "qtrb_v0.1.img".

