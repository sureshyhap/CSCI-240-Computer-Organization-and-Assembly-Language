.data
array:	.space	40
prompt:	.asciiz	"\nEnter integer: "
sum:	.asciiz	"\nSum: "
min:	.asciiz	"\nMin: "

.text
	la	$s0, array	# base address
	move	$s1, $s0	# current address
	li	$s4, 0		# i = 0
loop:
	slti	$t0, $s4, 10
	beq	$t0, $zero, endLoop1
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	
	move	$t0, $v0
	
	sw	$t0, 0($s1)
	addi	$s1, $s1, 4
	addi	$s4, $s4, 1
	j	loop
endLoop1:
	li	$s2, 0		# sum
	lw	$s3, 0($s0)	# min
	move	$s1, $s0
	li	$s4, 0		# i = 0
loop2:
	slti	$t0, $s4, 10
	beq	$t0, $zero, end
	lw	$t0, 0($s1)
	add	$s2, $s2, $t0
	slt	$t1, $t0, $s3
	addi	$s1, $s1, 4
	addi	$s4, $s4, 1
	bne	$t1, $zero, assignNewMin
	j	loop2
assignNewMin:
	move	$s3, $t0
	j	loop2
end:	li	$v0, 4
	la	$a0, sum
	syscall
	li	$v0, 1
	move	$a0, $s2
	syscall
	li	$v0, 4
	la	$a0, min
	syscall
	li	$v0, 1
	move	$a0, $s3
	syscall
	li	$v0, 10
	syscall
