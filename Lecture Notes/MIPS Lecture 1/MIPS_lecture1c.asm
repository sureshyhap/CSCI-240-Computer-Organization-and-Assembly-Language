.text
	li	$v0, 5
	syscall
	# arbitrary values for the following four registers
	li	$s1, 12
	li	$s2, 5
	li	$s3, 17
	li	$s4, 11
	move	$s5, $v0	
	bne	$s5, $zero, case1
	add	$s0, $s3, $s4
	j	done
case1:	li	$t0, 1
	bne	$s5, $t0, case2
	add	$s0, $s1, $s2
	j 	done
case2:	li	$t0, 2
	bne	$s5, $t0, case3
	sub	$s0, $s1, $s2
	j	done
case3:	li	$t0, 3
	bne	$s5, $t0, done
	sub	$s0, $s3, $s4
done:	li	$v0, 1
	move	$a0, $s0
	syscall
	li	$v0, 10
	syscall