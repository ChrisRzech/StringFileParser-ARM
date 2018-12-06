@@@@@@@@@@@@@@@@@@@
@ Increments size @
@ of a list       @
@================@@
@ Pre-condition  @
@ R1: List       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_incrSize
list_incrSize:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
size    .req R0  @
list    .req R1  @
@@@@@@@@@@@@@@@@@@
	push	{R0,LR}

	bl	list_getSize	@R0 = size
	add	size,#1

	str	size,[list]

	pop	{R0,LR}
	bx	LR
.end

