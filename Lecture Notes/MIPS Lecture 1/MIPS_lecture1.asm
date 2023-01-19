	.data
PROMPT1:	.asciiz	"Please enter integer 1:\n"
PROMPT2:	.asciiz "Please enter integer 2:\n"
RESULT:		.asciiz	"Result is: "

	.text
	# Prompt the user for the first integer
	li	$v0, 4
	la	$a0, PROMPT1
	syscall

	li	$v0, 5
	syscall

	# move integer1 to $s1
	move	$s1, $v0
	
	# Prompt the user for the second integer
	li	$v0, 4
	la	$a0, PROMPT2
	syscall

	li	$v0, 5
	syscall

	# move integer2 to $s2
	move	$s2, $v0

	# compute integer1 + 8 * integer2
	sll	$t0, $s2, 3 	# $t0 <-- 8 * integer2
	add	$s0, $s1, $t0	# $s0 <-- integer1 + 8 * integer2

	# print results message
	li	$v0, 4
	la	$a0, RESULT
	syscall

	# print result value
	li	$v0, 1
	move	$a0, $s0
	syscall

	# exit
	li	$v0, 10
	syscall
	
