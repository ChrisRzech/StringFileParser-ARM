@@@@@@@@@@@@@@@@@@@
@ Returns if the  @
@ list is empty   @
@================@@
@ Pre-condition  @
@ R0: --         @
@ R1: List       @
@================@
@ Post-condition @
@ R0: Boolean    @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_isEmpty
list_isEmpty:
	push	{LR}

	bl	list_getSize

	cmp	R0,#0
	moveq	R0,#1	@if(size == 0) return true
	movne	R0,#0	@if(size != 0) return false

	pop	{LR}
	bx	LR
.end

