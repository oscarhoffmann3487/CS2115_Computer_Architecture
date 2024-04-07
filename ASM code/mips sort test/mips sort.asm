.data 
	text3: .asciiz "\n"

.text
	li $v0, 5	#loads x
	syscall
	move $t0, $v0
	
	li $v0, 5	#loads y
	syscall
	move $t1, $v0
	
	li $v0, 5	#loads z
	syscall
	move $t2, $v0	
	
	bgt  $t0, $t1, save1 #is x>y
	move $t4, $t1		# y>x

first:
	bgt $t4, $t2, print1	#is x/y > z 
				#z > x/y => largest
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, text3
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, text3
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	
	j exit
save1:
	move $t4, $t0
	j first
	
print1:
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, text3
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, text3
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	
	j exit
	
exit:
	li $v0, 10
	syscall
