@@@@@@@@@@@@@@@@@@@@
@ Returns the size @
@ of a list        @
@================@@@
@ Pre-condition  @
@ R0: --         @
@ R1: List       @
@================@
@ Post-condition @
@ R0: Size       @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_getSize
list_getSize:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
size .req R0     @
list .req R1     @
@@@@@@@@@@@@@@@@@@
	ldr	size,[list]
	bx	LR
.end

