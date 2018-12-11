@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Initializes a list  with a @
@ head and tail pointer and  @
@ the size                   @
@================@@@@@@@@@@@@@
@ Pre-condition  @
@ R1: --         @
@================@
@ Post-condition @
@ R1: List       @
@@@@@@@@@@@@@@@@@@
.global list_create
list_create:
	push	{R0,LR}

	mov	R0,#3		@3 words (size, head, tail)
	bl	list_general_malloc
	mov	R1,R0		@R1 = list

	mov	R0,#0
	str	R0,[R1]		@size = 0
	bl	list_setHead	@head = 0
	bl	list_setTail	@tail = 0

	pop	{R0,LR}
	bx	LR
.end

