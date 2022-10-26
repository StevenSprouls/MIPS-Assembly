.data 

array: 		.word 5, 7, 12, 3, 4, 9, 6, 11, 2, 10 	


iterator: 	.word 0		#The iterator will start at 0		
size: 		.word 10	#This is the size of the array

minvalue: 	.asciiz "The smallest number:  "

.text

main:
	la $s0, array		#s0 now contains the address of the array
	lw $s6, iterator	#s6 now equals the iterator
	lw $s7, size		#s7 now equals the size
	
	lw $s1, 0($s0)		#The first value of the array is set as the min to start off 
	
loop:
	beq $s6, $s7, Exit	#for(int i = 0; i > array.size (10); i++), otherwise 
	lw $t0, 0($s0)		#t0 becomes s0
	addi $s6, $s6, 1	#s6 (the iterator) gets i++
	addi $s0, $s0, 4	#advance the array by 4 bytes
	
	slt $t1, $s1, $t0	#checks if the next index of the array is smaller or larger than the current smallest

	bne $t1, $zero, loop	#store the lowest value and the size of the array 
	
	move $s1, $t0		#the lowest value is now stored
	j loop 



Exit:
	li $v0,4
	la $a0, minvalue
	syscall
	
	li $v0,1
	move $a0, $s1
	syscall

	li $v0, 10
	syscall
	testing