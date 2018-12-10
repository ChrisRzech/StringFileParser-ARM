.data
menuFile: .asciz "mainmenu.txt"
enterString: .asciz "Enter a string: "
pressEnter: .asciz "Press enter to continue..."
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


file: .asciz "input.txt"
list: .word 0,0,0

.text
.global _start
_start:
	bl	zero_regs
	mov	R0,#0

menu_input:
	bl	v_clear

	ldr	R1,=menuFile
	bl	display_file		@output menu

	ldr	R1,=menuInput
	mov	R2,#256
	bl	string_input		@input option

check_optionOne:
	ldr	R2,=optionOne
	bl	string_equals
	cmp	R0,#1
	bne	check_optionTwo

	ldr	R1,=list
	bl	print_list		@if(input == "1") print list

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
	bne	check_optionTwo

	ldr	R1,=enterString
	bl	string_print		@prompt for input
	bl	v_endl

	ldr	R1,=list
	bl	add_string_to_list	@if(input == "2a") add a string to the list
	b	check_end

check_optionThree:
	ldr	R2,=optionThree
	bl	string_equals
	cmp	R0,#1
	bne	check_optionThree

	ldr	R1,=list
	ldr	R2,=file
	bl	load_list_from_file	@if(input == "2b") load the list from the file
	b	check_end

check_optionFour:
	ldr	R2,=optionFour
	bl	string_equals
	cmp	R0,#1
	bne	check_optionFive

@	bl	do_optionThree		@if(input == "3") do 3
	b	check_end

check_optionFive:
	ldr	R2,=optionFive
	bl	string_equals
	cmp	R0,#1
	bne	check_optionSix

@	bl	do_optionFour		@if(input == "4") do 4
	b	check_end

check_optionSix:
	ldr	R2,=optionSix
	bl	string_equals
	cmp	R0,#1
	bne	check_optionSeven

@	bl	do_optionFive		@if(input == "5") do 5
	b	check_end

check_optionSeven:
	ldr	R2,=optionSeven
	bl	string_equals
	cmp	R0,#1
	bne	check_optionEight

@	bl	do_optionSix		@if(input == "6") do 6
	b	check_end

check_optionEight:
	ldr	R2,=optionEight
	bl	string_equals
	cmp	R0,#1
	bne	check_end

	b	exit			@if(input == "7") exit

check_end:
	b	menu_input

exit:
	mov	R7,#1
	svc	0
.end

