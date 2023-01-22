.data
array:		.space 40
newline:	.asciiz "\n"
prompt:		.asciiz	"\nEnter an integer: "
sum:		.asciiz	"\nSum: "
min:		.asciiz	"\nMin: "

.text
	li	$s0, 0		# i = 0
	li	$s1, 0		# $s1 = 4 * i
	la	$s2, array	# $s2 = base address
	move	$s3, $s2	# $s3 = current address
inputtingLoop:
	slti	$t0, $s0, 10
	beq	$t0, $zero, finishedPrompting
	
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	
	move	$t0, $v0
	add	$s3, $s2, $s1
	sw	$t0, 0($s3)
	
	addi	$s0, $s0, 1
	addi	$s1, $s1, 4
	
	j	inputtingLoop
finishedPrompting:
	li	$s0, 0		# i = 0
	li	$s1, 0		# 4 * i
	la	$s2, array	# base address
	move	$s3, $s2	# current address
	li	$s4, 0		# sum = 0
	move	$s5, $s2	# min = a[0]
calculatingLoop:
	slti	$t0, $s0, 10
	beq	$t0, $zero, finishedCalculating
	add	$s3, $s2, $s1
	lw	$t0, 0($s3)
	add	$s4, $s4, $t0
	slt	$t1, $t0, $s5
	beq	$t1, $zero, notNewMin
	move	$s5, $t0
notNewMin:
	addi	$s0, $s0, 1
	addi	$s1, $s1, 4
	j	calculatingLoop
finishedCalculating:
	li	$v0, 4
	la	$a0, sum
	syscall
	
	li	$v0, 1
	move	$a0, $s4
	syscall
	
	li	$v0, 4
	la	$a0, min
	syscall
	
	li	$v0, 1
	move	$a0, $s5
	syscall


	li	$s0, 9		# i = 9
	li	$s1, 36		# 4 * i
	la	$s2, array	# base address
reversePrintLoop:
	add	$s3, $s2, $s1	# current address
	slti	$t0, $s0, 0
	bne	$t0, $zero, donePrinting
	
	li	$v0, 4
	la	$a0, newline
	syscall
	
	lw	$s4, 0($s3)
	li	$v0, 1
	move	$a0, $s4
	syscall
	
	addi	$s0, $s0, -1
	addi	$s1, $s1, -4
	j	reversePrintLoop
donePrinting:
	li	$v0, 10
	syscall