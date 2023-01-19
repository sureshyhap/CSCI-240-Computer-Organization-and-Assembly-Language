# Suresh Yhap
# Pseudocode: 	    int x;
#                   for(x=0;x<10;x++){
#                       printf("\n4x=%d", 4*x);
#                   }
#
# Registers:
# x: $s0
	.data
xEquals:	.asciiz	"\n4x="
	.text
	
	li	$s0, 0			# x = 0
forLoop:
	slti	$t0, $s0, 10
	beq	$t0, $zero, exit	# if x >= 10 exit loop

	li	$v0, 4
	la	$a0, xEquals
	syscall				# print '4x='

	li	$v0, 1
	sll	$a0, $s0, 2
	syscall				# print value of 4 * x
	
	addi	$s0, $s0, 1		# increment x
	
	j	forLoop
exit:
	li	$v0, 10
	syscall				# end program
