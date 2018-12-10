@@@@@@@@@@@@@@@@@@@@@
@ Clears the screen @
@@@@@@@@@@@@@@@@@@@@@
.data
clear: .asciz "clear"

.text
.extern system

.global v_clear
v_clear:
	push	{R0,LR}

	ldr	R0,=clear
	bl	system

	pop	{R0,LR}
	bx	LR
.end

