	.data
input:	.asciiz	"Enter a positive integer: "
result:	.asciiz	"\nResult is: "
	
	.text
main:
	li	$v0, 4
	la	$a0, input
	syscall					# print prompt

	li	$v0, 5
	syscall					# read integer

	move	$a0, $v0
	jal	fact				# call fact

	move	$s0, $v0		

	li	$v0, 4
	la	$a0, result
	syscall					# print result prompt

	li	$v0, 1
	move	$a0, $s0
	syscall					# print result

	j	exit
fact:
	bne	$a0, $zero, recursivePart	# if n != 0 do recursion
	li	$v0, 1				# if n == 0 return 1
	jr	$ra
recursivePart:
	addi	$sp, $sp, -8			# allocate 8 bytes of space for $ra and n
	sw	$a0, 0($sp)			# store n
	sw	$ra, 4($sp)			# store $ra
	addi	$a0, $a0, -1			# $a0 <-- n - 1
	jal	fact				# call fact with argument n - 1
	lw	$a0, 0($sp)			# retrieve value of n
	lw	$ra, 4($sp)			# retrieve value of $ra
	mul	$v0, $a0, $v0			# n * fact(n - 1)
	addi	$sp, $sp, 8			# free 8 bytes of space
	jr	$ra				# return
exit:	li	$v0, 10				# exit program
	syscall
