obj-m := hello_driver.o
BUILDROOT_DIR := ../buildroot
KDIR := $(BUILDROOT_DIR)/output/build/linux-custom
COMPILER := $(BUILDROOT_DIR)/output/host/bin/i686-buildroot-linux-uclibc-gcc

all:
	$(MAKE) -C $(KDIR) M=$$PWD
	$(MAKE) -C $(KDIR) M=$$PWD modules_install INSTALL_MOD_PATH=../../target
	$(COMPILER) -o test_hello_char test_hello_char.c
	cp test_hello_char $(BUILDROOT_DIR)/output/target/bin
	
clean:
	rm -f *.o *.ko
	rm -f modules.order
	rm -f Module.symvers
	rm -f hello_driver.mod.c
	rm -f test_hello_char

