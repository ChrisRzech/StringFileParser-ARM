@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Outputs all the strings @
@ of a linked list        @
@================@@@@@@@@@@
@ Pre-condition  @
@ R1: List       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global print_list
print_list:
	push	{R2,LR}

	ldr	R2,=print_string_with_endl
	bl	list_for_each

	pop	{R2,LR}
	bx	LR
.end

