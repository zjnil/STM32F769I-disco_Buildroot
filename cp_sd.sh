#!/bin/bash

sudo rm -rf /media/zjerina/06ca6eef-4a9f-4e78-8da0-523de28064f6/* &&
sudo tar -C /media/zjerina/06ca6eef-4a9f-4e78-8da0-523de28064f6/ -xvzf buildroot/output/images/rootfs.tar.gz &&
cp output/* /media/zjerina/CC81-23A0/stm32f769/ &&
sudo umount /media/zjerina/* &&
sync &&
echo "Done" ||
echo "Failed"
