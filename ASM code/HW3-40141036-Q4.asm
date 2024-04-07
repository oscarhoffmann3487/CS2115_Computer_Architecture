.data
	text1: .asciiz "h("
	text2: .asciiz ")="
	text3: .asciiz "\n"
	
.text
	li, $t6, 0	#initializing the counter
loop1:
	bgt $t6, 7, loop2

	li $v0, 4
	la $a0, text1	#"h("
	syscall
	
	li $v0, 1
	move $a0, $t6	#the value of the counter 0-200
	syscall
	
	li $v0, 4
	la $a0, text2	#prints ")="
	syscall
	
	jal fx		#jumps to fx where the first 8 values are calculated
	
	li $v0, 4
	la $a0, text3	#prints "\n"
	syscall
	
	addi $t6, $t6, 1
	j loop1

loop2:
	bgt $t6, 200, end
	
	li $v0, 4
	la $a0, text1	#"h("
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	li $v0, 4
	la $a0, text2	#prints ")="
	syscall
	
	jal hx
	
	li $v0, 4
	la $a0, text3	#prints "\n"
	syscall
	
	addi $t6, $t6, 1
	j loop2

	
hx:			
	add $t7, $t5, $t4
	sub $t8, $t7, $t2
	
	li $v0, 1
	move $a0, $t8
	syscall
	
	move $t2, $t4
	move $t4, $t5
	move $t5, $t8
	
	#Checking some values
	#h(8) = h(7)+h(6)-h(5) = 6+3-0 = 9
	#h(9) = h(8)+h(7)-h(6) = 9+6-3 = 12
	#h(10) = h(9)+h(8)-h(7) = 12+9-6 = 15
	
	jr $ra
fx:
	li $t1, 4
	li, $t2, 0
	li $t3, 1
	li, $t4, 3
	li $t5, 6
	
	beq $t6, 0, print4
	beq $t6, 1, print0	
	beq $t6, 2, print1
	beq $t6, 3, print4
	beq $t6, 4, print1
	beq $t6, 5, print0
	beq $t6, 6, print3
	beq $t6, 7, print6
	jr $ra
print4:
	li $v0, 1
	move $a0, $t1
	syscall
	jr $ra
print1:
	li $v0, 1
	move $a0, $t3
	syscall
	jr $ra
print0:
	li $v0, 1
	move $a0, $t2
	syscall
	jr $ra
print3:
	li $v0, 1
	move $a0, $t4 
	syscall
	jr $ra
print6:
	li $v0, 1
	move $a0, $t5 
	syscall
	jr $ra

end:
	li $v0, 10
	syscall
