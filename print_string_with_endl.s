@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prints a string followed @
@ by a endl at the end     @
@================@@@@@@@@@@@
@ Pre-condition  @
@ R1: String     @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global print_string_with_endl
print_string_with_endl:
	push	{LR}

	bl	string_print
	bl	v_endl

	pop	{LR}
	bx	LR
.end

