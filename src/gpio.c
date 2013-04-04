#include "gpio.h"

// TRC: super simple, 0 = led off, else = led on
void toggle_status_led(int on) {
  if (on) {
    unsigned int* gpio = (unsigned int*)GPIO_BASE;
    gpio[GPIO_GPFSEL1] |= (1 << 18);
    gpio[OKAY_ON] = (1 << 16);
  }
}
