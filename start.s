.data
menuFile: .asciz "mainmenu.txt"
enterString: .asciz "Enter a string: "
enterIndex:  .asciz "Enter an index: "
pressEnter: .asciz "Press enter to continue..."
byteCount: .asciz "List memory size (bytes): "
menuInput: .space 256

@ Menu options @
optionOne:   .asciz "1"
optionTwo:   .asciz "2"
optionThree: .asciz "3"
optionFour:  .asciz "4"
optionFive:  .asciz "5"
optionSix:   .asciz "6"
optionSeven: .asciz "7"
optionEight: .asciz "8"

inFile:  .asciz "input.txt"
outFile: .asciz "output.txt"
endl:	.asciz "\n"
list: .word 0,0,0

.text
.global _start
_start:
	bl	zero_regs
	mov	R0,#0

menu_input:
	bl	v_clear

	ldr	R1,=byteCount
	bl	string_print

	ldr	R1,=list
	bl	list_getSize
	mov	R2,#8
	mul	R0,R2
	bl	v_dec
	bl	v_endl

	ldr	R1,=menuFile
	bl	display_file		@output menu

	ldr	R1,=menuInput
	mov	R2,#255
	bl	string_input		@input option
	bl	v_endl

check_optionOne:
	ldr	R2,=optionOne
	bl	string_equals
	cmp	R0,#1
	bne	check_optionTwo

	ldr	R1,=list
	bl	print_list		@if(input == "1") print list

	bl	v_endl

	ldr	R1,=pressEnter
	bl	string_print
	bl	v_endl

	ldr	R1,=menuInput
	bl	string_input		@make-shift "Press enter to continue"
	b	check_end

check_optionTwo:
	ldr	R2,=optionTwo
	bl	string_equals
	cmp	R0,#1
	bne	check_optionThree

	ldr	R1,=enterString
	bl	string_print		@prompt for input
	bl	v_endl

	ldr	R1,=list
	bl	add_string_to_list	@if(input == "2") add a string to the list
	b	check_end

check_optionThree:
	ldr	R2,=optionThree
	bl	string_equals
	cmp	R0,#1
	bne	check_optionFour

	ldr	R1,=list
	ldr	R2,=inFile
	bl	load_list_from_file	@if(input == "3") load the list from the file
	b	check_end

check_optionFour:
	ldr	R2,=optionFour
	bl	string_equals
	cmp	R0,#1
	bne	check_optionFive

	ldr	R1,=enterIndex
	bl	string_print

	ldr	R1,=menuInput
	mov	R2,#255
	bl	string_input
	bl	stoi
	mov	R2,R0

	ldr	R1,=list
	bl	list_delete
	
	b	check_end

check_optionFive:
	ldr	R2,=optionFive
	bl	string_equals
	cmp	R0,#1
	bne	check_optionSix

	b	check_end

check_optionSix:
	ldr	R2,=optionSix
	bl	string_equals
	cmp	R0,#1
	bne	check_optionSeven

	ldr	R1,=enterString
	bl	string_print
	bl	v_endl

	ldr	R1,=menuInput
	bl	string_input

	bl	v_endl
	bl	v_endl

	mov	R2,R1
	ldr	R1,=list
	ldr	R3,=substr_exists
	bl	list_find_all_equal

	mov	R1,R0
	ldr	R2,=print_string_with_endl
	bl	list_for_each

	push	{R1}			@save new list

	ldr	R1,=pressEnter
	bl	string_print

	ldr	R1,=menuInput
	bl	string_input

	pop	{R1}			@load new list

	bl	list_free
	
	bl	v_endl
	b	check_end

check_optionSeven:
	ldr	R2,=optionSeven
	bl	string_equals
	cmp	R0,#1
	bne	check_optionEight

	ldr	R1,=outFile
	mov	R2,#0101
	bl	file_open
	mov	R5,R0			@R5 = file handle

	ldr	R1,=list
	bl	list_getHead
	mov	R1,R0			@R1 = head's node

write_loop:
	cmp	R1,#0
	beq	write_loop_exit		@if(node == nullptr) exit loop

	bl	node_getData
	push	{R1}			@save node
	mov	R1,R0			@R1 = node->data
	mov	R0,R5			@get file handle
	bl	file_write

	ldr	R1,=endl
	bl	file_write
	pop	{R1}			@load node

	bl	node_getNext
	mov	R1,R0			@R1 = node->next
	b	write_loop
write_loop_exit:
	
	b	check_end

check_optionEight:
	ldr	R2,=optionEight
	bl	string_equals
	cmp	R0,#1
	bne	check_end

	b	exit			@if(input == "8") exit

check_end:
	b	menu_input

exit:
	ldr	R1,=list
	bl	list_clear

	mov	R7,#1
	svc	0
.end

