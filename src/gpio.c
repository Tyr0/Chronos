#include "gpio.h"

unsigned int *gpio;
void enable_status_led() {
  gpio = (unsigned int*)GPIO_BASE;
  gpio[GPIO_GPFSEL1] |= (1 << 18);
}

// TRC: super simple, 0 = led off, else = led on
void toggle_status_led(int on) {
  if (on) {
    gpio[OKAY_ON] = (1 << 16);
  }
  else {
    gpio[OKAY_OFF] = (1 << 16);
  }
}
