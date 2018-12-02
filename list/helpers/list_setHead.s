@@@@@@@@@@@@@@@@@@@@
@ Assigns the head @
@ of the list      @
@================@@@
@ Pre-condition  @
@ R1: List       @
@ R2: Head       @
@================@
@ Post-condition @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global list_setHead
list_setHead:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
list .req R1     @
head .req R2     @
@@@@@@@@@@@@@@@@@@
	str	head,[list,#4]
	bx	LR
.end

