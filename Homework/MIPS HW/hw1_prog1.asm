	.data
firstInt:	.asciiz	"\nEnter first integer in range [100, 250]: "
secondInt:	.asciiz	"\nEnter second integer > -30: "
result:		.asciiz	"\nResult is: "
	.text
	li	$s7, 999		# create sentinel
loop1:	
	li	$v0, 4
	la	$a0, firstInt
	syscall				# prompt for first integer

	li	$v0, 5
	syscall				# read first integer

	move	$s0, $v0

	beq	$s0, $s7, Exit		# sentinel value inputted
	
	slti	$t0, $s0, 100
	bne	$t0, $zero, loop1	# checks if >= 100

	slti	$t0, $s0, 251
	beq	$t0, $zero, loop1	# checks if < 251
loop2:	
	li	$v0, 4
	la	$a0, secondInt
	syscall				# second prompt

	li	$v0, 5
	syscall				# read second integer

	move	$s1, $v0

	beq	$s1, $s7, Exit		# sentinel value inputted	
	
	slti	$t0, $s1, -29
	bne	$t0, $zero, loop2	# checks if >= -29

	###### Computing ######
	sll	$t0, $s0, 2
	
	addi	$t1, $s1, -9
	li	$t2, 7
	mul	$t1, $t1, $t2

	add	$s2, $t0, $t1		# $s2 = 4 * int1 + 7 * (int2 - 9)

	li	$v0, 4
	la	$a0, result
	syscall				# print result string

	li	$v0, 1
	move	$a0, $s2
	syscall				# print result
	j	loop1

Exit:	li	$v0, 10			# end program
	syscall
