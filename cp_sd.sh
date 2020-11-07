#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Missing SD card argument. Usage: $0 <SD partition name>"
    exit 1
fi

cp output/* /media/zjerina/$1/stm32f769/ &&
sudo umount /media/zjerina/* &&
sync

echo "Done"
