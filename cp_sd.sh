#!/bin/bash

base_path="/media/zjerina"
ext_path="$base_path/06ca6eef-4a9f-4e78-8da0-523de28064f6"
fat_path="$base_path/CC81-23A0/stm32f769"

sudo rm -rf ${ext_path}/* &&
sudo tar -C ${ext_path}/ -xvzf buildroot/output/images/rootfs.tar.gz &&
cp output/* ${fat_path}/ &&
sudo umount ${base_path}/* &&
sync &&
echo "Done" ||
echo "Failed"
