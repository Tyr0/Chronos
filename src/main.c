/* ARM11 Processors -> ARM1176 -> RM1176JZF-S Technical Reference Manual */

#include "entry.h"
#include "gpio.h"

int kern_main() {
  toggle_status_led(1);
  
  return 0;
}
