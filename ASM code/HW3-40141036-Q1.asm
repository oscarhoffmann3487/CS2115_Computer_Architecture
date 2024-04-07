.data
	text1: .asciiz  "input value x:"
	text2: .asciiz "input value y:"
	text3: .asciiz  "input value z:"
	text4: .asciiz "input value w:"
.text
	li $v0, 4
	la $a0, text1	#tells the user to put in the first value
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0	#puts x into t0
	
	li $v0, 4
	la $a0, text2	#tells the user to put in the secound value
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0	#puts y into t1
	
	li $v0, 4
	la $a0, text3	#tells the user to put in the third value
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0	#puts z into t2
	
	li $v0, 4
	la $a0, text4	#tells the user to input the forth value
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0	#puts w into t1
	
	add $t0, $t0, $t1	#performs x+y, storing it in t0
	mult $t0, $t2		#performs (x+y)*z
	mflo $t4		#stores the value from multiplication in $t0
	and $t0, $t4, $t3
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10 	#Exits the program
	syscall
	