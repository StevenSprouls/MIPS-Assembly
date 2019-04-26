.text
	
	.globl	main
main:
	# Print string msg1
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg1	# load the address of msg1
	syscall

	# Get input num1 from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t0,$v0		# syscall results returned in $v0

	# Print string msg2
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg2	# load the address of msg2
	syscall

	# Get input num2 from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t1,$v0		# syscall results returned in $v0	
	
	# Print string msg3
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg3	# load the address of msg2
	syscall

	# Get input num3 from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t2,$v0		# syscall results returned in $v0

	
	add	$t0, $t0, $t1	# num1 = num1 + num2	#adds number 1 and number 2 together and saves this where number 1 was
	sub	$t0, $t2, $t0   # num1 = num3 - new num1 #subracts the result of the addition and resaves it in the address of num1 again

	# Print string msg4
	li	$v0, 4
	la	$a0, msg4
	syscall

	# Print sum
	li	$v0,1		# print_int syscall code = 1
	move	$a0, $t0	# int to print must be loaded into $a0
	syscall

	li	$v0,10		# exit
	syscall

	.data
msg1:	.asciiz	"Enter num1:   "
msg2:	.asciiz	"Enter num2:   "
msg3:	.asciiz "Enter num3:   "
msg4:	.asciiz	"num3 - (num1 + num2) = "