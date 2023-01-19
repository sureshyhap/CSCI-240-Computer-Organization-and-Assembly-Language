.data
str1:	.asciiz		"Enter a character: "
str2:	.asciiz		"\nLowercase"
str3:	.asciiz		"\nUppercase"

.text
	li	$v0, 4
	la	$a0, str1
	syscall
	
	li	$v0, 12
	syscall
	
	move	$a0, $v0
	jal	islower
	bne	$v0, $zero, lower
	j	upper
	
islower:
	sub	$t0, $a0, 'a'
	sub	$t1, $a0, 'z'
	bltz	$t0, zero
	bgtz	$t1, zero
	li	$v0, 1
	jr	$ra
zero:
	li	$v0, 0
	jr	$ra

lower:
	li	$v0, 4
	la	$a0, str2
	syscall
	j	end
upper:
	li	$v0, 4
	la	$a0, str3
	syscall
end:
	li	$v0, 10
	syscall