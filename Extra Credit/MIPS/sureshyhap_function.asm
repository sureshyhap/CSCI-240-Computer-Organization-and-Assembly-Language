##################################################################
# Name: Suresh Yhap	
#
# Date: January 18, 2023	
# 
# Program Name: sureshyhap_function.asm
#
# Description: This program illustrates how to implement a simple function call
#
# Pseudocode:   int g = 10;
#		int h = 5;
#		int i = 8;
#		int j = 4;
#		int f = 0;
#		f = add_four(g, h, i, j);
#		printf("%d", f);
#		
# Registers:	$s0: variable g
#		$s1, variable h
#		$s2, variable i
#		$s3, variable j
#		$s4, variable f
#
###################################################################
	
.data

.text

main:	
	li	$s0, 10		# g = 10
	li	$s1, 5		# h = 5
	li	$s2, 8		# i = 8
	li	$s3, 4		# j = 4
	li	$s4, 0		# f = 0
	move	$a0, $s0	
	move	$a1, $s1
	move	$a2, $s2
	move	$a3, $s3
	jal	add_for		# call add_for function
	move	$s4, $v0	# f = result
	move	$a0, $s4
	li	$v0, 1
	syscall			# print result
	li	$v0, 10
	syscall			# exit program
#######################Function
#########################################
# Function Name: add_for
############################################################################
#########
# Functional Description: Computes an arithmetic result based on 4 parameters
#
############################################################################
############################################################################
# Register Usage in Function:
# $a0: g
# $a1: h
# $a2: i
# $a3: j
# $v0 = ($a0 + $a1) - ($a2 + $a3)
###########################################################################
# Pseudocode Description
# int add_four(g, h, i, j) {
#	return (g + h) - (i + j);
# }
#
############################################################################
add_for:
	move	$t0, $a0	
	move	$t1, $a1
	move	$t2, $a2
	move	$t3, $a3
	add	$t0, $t0, $t1	# g + h
	add	$t2, $t2, $t3	# i + j
	sub	$v0, $t0, $t2	# (g + h) - (i + j)
	jr	$ra		# return to main
