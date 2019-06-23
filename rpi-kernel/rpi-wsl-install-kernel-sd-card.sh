#!/bin/bash

echo "note you need to be in the folder of the linux installation"

fat32Drive=e:
fat32MntPoint=/mnt/fat32
ext4Drive=f:
ext4MntPoint=/mnt/ext4

sudo mkdir $fat32MntPoint
sudo mkfir $ext4MntPoint

sudo mount -t drvfs $fat32Drive $fat32MntPoint
sudo mount -t drvfs $ext4Drive $ext4MntPoint


sudo make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=$ext4MntPoint modules_install

sudo cp /mnt/fat32/$KERNEL.img $fat32MntPoint/$KERNEL-backup.img
sudo cp arch/arm/boot/zImage $fat32MntPoint/$KERNEL.img
sudo cp arch/arm/boot/dts/*.dtb $fat32MntPoint/
sudo cp arch/arm/boot/dts/overlays/*.dtb* $fat32MntPoint/overlays/
sudo cp arch/arm/boot/dts/overlays/README $fat32MntPoint/overlays/

sudo umount $fat32MntPoint
sudo umount $extMntPoint

