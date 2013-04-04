/* ARM11 Processors -> ARM1176 -> RM1176JZF-S Technical Reference Manual */

#include "entry.h"
#include "gpio.h"

int kern_main() {
  // TRC: enable the status LED
  enable_status_led();

  while (1) {
    toggle_status_led(1);
    _wait(8000000);
    toggle_status_led(0);
    _wait(8000000);
  }
  
  return 0;
}
