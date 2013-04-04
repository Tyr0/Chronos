.section .init

.globl _start
_start:
	bl  kern_main

_cycle:
  b   _cycle

