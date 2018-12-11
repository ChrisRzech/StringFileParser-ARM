@@@@@@@@@@@@@@@@@@@@@
@ Removes all nodes @
@ from the list     @
@================@@@@
@ Pre-condition  @
@ R1: List       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_clear
list_clear:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
size .req R0     @
list .req R1     @
@@@@@@@@@@@@@@@@@@
	push	{R0,LR}

	cmp	list,#0
	beq	return		@if(list == nullptr) return

loop:
	bl	list_deleteFirst

	bl	list_getSize
	cmp	size,#0
	beq	return		@if(list.size() == 0) exit loop

	b	loop

return:
	pop	{R0,LR}
	bx	LR
.end

