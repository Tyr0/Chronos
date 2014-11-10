KERNEL = kernel.img

ARMGNU = arm-none-eabi
CC = $(ARMGNU)-gcc
LD = $(ARMGNU)-ld
AS = $(ARMGNU)-as

QEMU = /opt/qemu-rpi/bin/qemu-system-arm
QFLAGS = -cpu arm1176 -m 256 -M raspi -serial stdio -device usb-kbd
QFLAGS+= -device usb-mouse -usb -usbdevice net
QFLAGS+= -append "rw earlyprintk loglevel=8 panic=120 keep_bootcon rootwait dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1024 bcm2708_fb.fbheight=768 bcm2708.boardrev=0xf bcm2708.serial=0xcad0eedf smsc95xx.macaddr=B8:27:EB:D0:EE:DF sdhci-bcm2708.emmc_clock_freq=100000000 vc_mem.mem_base=0x1c000000 vc_mem.mem_size=0x20000000  dwc_otg.lpm_enable=0 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait"

SOURCE = src

# KERNEL
SOURCES  = $(SOURCE)/entry.S
SOURCES += $(SOURCE)/main.c
SOURCES += $(SOURCE)/gpio.c
SOURCES += $(SOURCE)/string.c

OBJECTS = $(patsubst %.c,%.o,$(patsubst %.S,%.o,$(SOURCES)))

CFLAGS = -Wall -Werror -O2 -nostdlib -ffreestanding -std=c99
# GDB Debug Flag
CFLAGS+= -g

all: $(KERNEL)

kernel.o:
	$(CC) $(CFLAGS) -o $@ -c $^

$(KERNEL): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	rm $(OBJECTS)
	rm $(KERNEL)

run:
	$(QEMU) -kernel $(KERNEL) $(QFLAGS)
