KERNEL = kernel.img

ARMGNU = arm-eabi
CC = $(ARMGNU)-gcc
LD = $(ARMGNU)-ld
AS = $(ARMGNU)-as

SOURCE = src

# KERNEL
SOURCES  = $(SOURCE)/entry.S
SOURCES += $(SOURCE)/main.c
SOURCES += $(SOURCE)/gpio.c

OBJECTS = $(patsubst %.c,%.o,$(patsubst %.S,%.o,$(SOURCES)))

CFLAGS = -Wall -Werror -O2 -nostdlib -ffreestanding -std=c99

all: $(KERNEL)

kernel.o:
	$(CC) $(CFLAGS) -o $@ -c $^

$(KERNEL): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	rm $(OBJECTS)
	rm $(KERNEL)
