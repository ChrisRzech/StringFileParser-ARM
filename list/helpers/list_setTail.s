@@@@@@@@@@@@@@@@@@@@
@ Assigns the tail @
@ of the list      @
@================@@@
@ Pre-condition  @
@ R1: List       @
@ R2: Tail       @
@================@
@ Post-condition @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global list_setTail
list_setTail:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
list .req R1     @
tail .req R2     @
@@@@@@@@@@@@@@@@@@
	str	tail,[list,#8]
	bx	LR
.end

