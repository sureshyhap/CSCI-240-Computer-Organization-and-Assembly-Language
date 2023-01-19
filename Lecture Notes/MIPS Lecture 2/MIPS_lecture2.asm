.data
array: .word 55
       .word 66
       .word 77
       .word 88
       .word 0


newline:     .asciiz	"\n"

.text
	la	$t0, array
checkForZero:
	lw	$t1, 0($t0)
	beq	$t1, $zero, done
	li	$v0, 1
	move	$a0, $t1
	syscall
	li	$v0, 4
	la	$a0, newline
	syscall
	addi	$t0, $t0, 4
	j checkForZero
done:
	li	$v0, 10
	syscall