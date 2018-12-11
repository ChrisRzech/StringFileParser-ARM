@@@@@@@@@@@@@@@@@@@@@@@
@ Add a string to the @
@ end of a list       @
@================@@@@@@
@ Pre-condition  @
@ R1: List       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.data
string: .space 256

.text
.global add_string_to_list
add_string_to_list:
	push	{R0-R2,LR}
	
	push	{R1}		@save list

	ldr	R1,=string
	mov	R2,#256
	bl	string_input
	bl	string_copy	@R0 = copy of string
	mov	R2,R0		@R2 = copy of string

	pop	{R1}		@load list

	bl	list_insertLast

	pop	{R0-R2,LR}
	bx	LR
.end

