.section .init

.globl _start
_start:
	bl  kern_main
/* _start */

_cycle:
  b   _cycle
/* _cycle */


.globl _wait
_wait:
  sub r0, #1
  cmp r0, #0
  bne _wait
  bx  lr
/* _wait */

.globl _dummy
_dummy:
  bx lr
