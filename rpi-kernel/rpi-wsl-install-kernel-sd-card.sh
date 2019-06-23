#!/bin/bash

echo "note you need to be in the folder of the linux installation"

KERNEL=kernel

if [ ! -d mnt ] ; then
	mkdir mnt
fi

fat32Drive=e:
ext4Drive=f:

if [ ! -d mnt/fat32 ] ; then
	sudo mkdir mnt/fat32
fi

if [ ! -d mnt/ext4 ] ; then
	sudo mkdir mnt/ext4
fi

sudo mount -t drvfs $fat32Drive mnt/fat32
sudo mount -t drvfs $ext4Drive mnt/ext4

sudo make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=mnt/ext4 modules_install

echo "Copying over Kernel"
sudo cp mnt/fat32/$KERNEL.img mnt/fat32/$KERNEL-backup.img
sudo cp arch/arm/boot/zImage mnt/fat32/$KERNEL.img
sudo cp arch/arm/boot/dts/*.dtb mnt/fat32/
sudo cp arch/arm/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm/boot/dts/overlays/README mnt/fat32/overlays/

sleep 2

echo "Unmounting SD card rPi FS"
sudo umount mnt/fat32

sleep 2
sudo umount mnt/ext4

sleep 2

rmdir mnt/fat32
rmdir mnt/ext4

