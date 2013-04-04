#ifndef CHRONOS_GPIO_DEFINE
#define CHRONOS_GPIO_DEFINE

#define GPIO_BASE 0x20200000
#define GPIO_GPFSEL1    1
#define OKAY_ON 10
#define OKAY_OFF 7

// FUNCTIONS
extern void toggle_status_led(int);

#endif
