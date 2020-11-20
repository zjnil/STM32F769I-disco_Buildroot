The instructions are for use in VSCode.

Open the project in VSCode and run the task: "Rebuild (all)" to build it.

After it is built plug in your STM32F769I-DISCO board and run "U-Boot flash" task.

To put the data on SD card first create two partions:
- 1. FAT32
- 2. EXT4

Fix paths in "cp_sd.sh" for your use case and run it so the data is properly copied.

Put the SD card in the board and run it with the blue button pressed, keep the button pressed until
the boot process switches to kernel after that you will enter the kernel and will be able to use the supported features.