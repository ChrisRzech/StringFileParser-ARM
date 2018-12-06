@@@@@@@@@@@@@@@@@@@@
@ Returns the tail @
@ of a list        @
@================@@@
@ Pre-condition  @
@ R0: --         @
@ R1: List       @
@================@
@ Post-condition @
@ R0: Tail       @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_getTail
list_getTail:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
tail .req R0     @
list .req R1     @
@@@@@@@@@@@@@@@@@@
	ldr	tail,[list,#8]	@offset the node by two words
	bx	LR
.end

