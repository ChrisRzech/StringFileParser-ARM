@@@@@@@@@@@@@@@@@@@@
@ Returns the head @
@ of a list        @
@================@@@
@ Pre-condition  @
@ R0: --         @
@ R1: List       @
@================@
@ Post-condition @
@ R0: Head       @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_getHead
list_getHead:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
head .req R0     @
list .req R1     @
@@@@@@@@@@@@@@@@@@
	ldr	head,[list,#4]	@offset the list by a word
	bx	LR
.end

