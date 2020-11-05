url_buildroot = https://github.com/buildroot/buildroot.git
dir_configs = configs
dir_buildroot = buildroot
commit_buildroot = 2020.02.7
dir_output = output

bootstrap:
	git clone $(url_buildroot)
	cd $(dir_buildroot) && git fetch --all && git reset --hard $(commit_buildroot)
	cp $(dir_configs)/buildroot $(dir_buildroot)/.config

build:
	make -C $(dir_buildroot)
	cp $(dir_buildroot)/output/images/zImage ${dir_output}/
	cp $(dir_buildroot)/output/build/linux-5.4.61/arch/arm/boot/dts/stm32f769-disco.dtb ${dir_output}/

flash_bootloader:
	cd $(dir_buildroot)/output/build/host-openocd-0.10.0/tcl && ../../../host/usr/bin/openocd \
		-f board/stm32f7discovery.cfg \
		-c "program ../../../images/u-boot-spl.bin 0x08000000" \
		-c "program ../../../images/u-boot.bin 0x08008000" \
		-c "reset run" -c shutdown

linux_rebuild:
	make linux-rebuild $(ARGS) -C $(dir_buildroot)
	cp $(dir_buildroot)/output/images/zImage $(dir_output)/
	cp $(dir_buildroot)/output/build/linux-5.4.61/arch/arm/boot/dts/stm32f769-disco.dtb $(dir_output)/

linux_reconfigure:
	make linux-reconfigure $(ARGS) -C $(dir_buildroot)
	cp $(dir_buildroot)/output/images/zImage $(dir_output)/
	cp $(dir_buildroot)/output/build/linux-5.4.61/arch/arm/boot/dts/stm32f769-disco.dtb $(dir_output)/

uboot_rebuild:
	make uboot-dirclean -C $(dir_buildroot)
	make uboot-rebuild $(ARGS) -C $(dir_buildroot)

save_all:
	make update-defconfig -C $(dir_buildroot)
	make linux-update-defconfig -C $(dir_buildroot)
	make busybox-update-config -C $(dir_buildroot)
	make uclibc-update-config -C $(dir_buildroot)
	make barebox-update-defconfig -C $(dir_buildroot)
	make uboot-update-defconfig -C $(dir_buildroot)

clean:
	rm -rf $(dir_buildroot)
