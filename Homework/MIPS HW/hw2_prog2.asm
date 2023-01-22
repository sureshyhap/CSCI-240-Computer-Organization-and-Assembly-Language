.data
prompt:		.asciiz	"Enter a value: "
result:		.asciiz	"\nResult is: "

.text
reprompt:
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	
	slti	$t0, $v0, 0
	bne	$t0, $zero, reprompt
	
	move	$a0, $v0
	
	jal	Func
	move	$s0, $v0
	li	$v0, 4
	la	$a0, result
	syscall
	
	li	$v0, 1
	move	$a0, $s0
	syscall
	
	li	$v0, 10
	syscall
	
Func:
	bne	$a0, $zero, recursivePart
	li	$v0, 6
	jr	$ra

recursivePart:
	addi	$sp, $sp, -8
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	
	addi	$a0, $a0, -1
	jal	Func
	sll	$t0, $v0, 2
	li	$t1, 5
	lw	$a0, 0($sp)
	
	mul	$t3, $t1, $a0
	add	$t4, $t0, $t3
	move	$v0, $t4
	
	lw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jr	$ra
	