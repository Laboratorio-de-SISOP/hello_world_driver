ifneq ($(KERNELRELEASE),)
	obj-m := hello_driver.o
else
	KDIR := ../buildroot/output/build/linux-master
	COMPILER := ../buildroot/output/host/bin/i686-buildroot-linux-uclibc-gcc
all:
	$(MAKE) -C $(KDIR) M=$$PWD
	$(COMPILER) -o teste_hello_char test_hello_char.c
	
clean:
	rm -f *.o *.ko
	rm -f modules.order
	rm -f Module.symvers
	rm -f hello_driver.mod.c
	rm -f teste_hello_char
endif
