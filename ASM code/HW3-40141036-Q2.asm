.data
	project: .space 100
	howlong: 
	text1: .asciiz "My name is Oscar Hoffmann. "
	fullstop: .asciiz "."
	text2: .asciiz "My SID is 40141036. "
	text3: .asciiz "My project name is "
	input_project: "Input your project name: "
	
.text
	li $v0, 4
	la $a0, input_project	#tells the user to input their project name
	la, $a1, 100
	syscall 
	
	li $v0, 8
	la $a0, project
	syscall
	
	add $t0, $t0, $zero	#indexing of the character
loop:	
	lb $t1, ($a0)
	beq $t1, '\n', print
	addi $t0, $t0, 1	#adds 1 to the index of the character
	addi $a0, $a0, 1	#adds 1 to the current character we are looking at
	j loop
	
print:
	la $a0, project
	add $a0, $a0, $t0
	sb $zero, ($a0) # this overwrites '\n' with a 0
	

	li $v0, 4
	la $a0, text1
	syscall
	la $a0, text2
	syscall
	la $a0, text3
	syscall
	la $a0, project
	syscall
	la $a0, fullstop
	syscall
	li $v0, 10
	syscall
	
