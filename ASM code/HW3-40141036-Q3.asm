.data
	text1: .asciiz  "input a value: "	#my SID is 40141036
.text
	li $v0, 4
	la $a0, text1	#tells the user to put in a value
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0	#puts the value into t0
	
	li $t1, 4
	li, $t2, 0
	li $t3, 1
	li, $t4, 3
	li $t5, 6
	
	beq  $t0, 0, print4
	beq $t0, 1, print0	
	beq $t0, 2, print1
	beq $t0, 3, print4
	beq $t0, 4, print1
	beq $t0, 5, print0
	beq $t0, 6, print3
	beq $t0, 7, print6
	
print4:
	li $v0, 1
	move $a0, $t1
	syscall
	j end
print1:
	li $v0, 1
	move $a0, $t3
	syscall
	j end
print0:
	li $v0, 1
	move $a0, $t2
	syscall
	j end
print3:
	li $v0, 1
	move $a0, $t4 
	syscall
	j end
print6:
	li $v0, 1
	move $a0, $t5 
	syscall
	j end
end:
	li $v0, 10
	syscall