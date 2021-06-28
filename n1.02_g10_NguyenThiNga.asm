
#Problem 1.2: Nhap so nguyên m và n , tìm so nguyên trong khoang m n

.data
	myArray: .space 10000
	X: 	  .word 0 # Test value
	message1: .asciiz "Nhap so nguyen m:"
	message2: .asciiz "Nhap so nguyen n:"
	message3: .asciiz "So nguyen to trong khoang cua ban la: "
	space: .asciiz " "
.text
input:	
	li $v0, 51
	la $a0, message1
	syscall
	add $s1, $zero, $a0
	
	li $v0, 51
	la $a0, message2
	syscall
	add $s2, $zero, $a0
	
	lw $t9, X  # $t9 = X
	addi $t8, $zero, 0 #Index array = $t8

handing:
    # Check < 2
    addi $t3,$zero,2
    slt $t4,$s1,$t3    	# $s1 < $t3 -> $t1 =1
    bnez $t4,continue   	#$t4 #0 -> continue
    while:
	slt $t0,$s2,$s1   # $s2< $s1 -> $t0=1
	bne $t0,$zero,endwhile 
	nop
	addi $t1,$zero,2 	# i=2
	for:
		slt $t5,$t1,$s1   #i<m, $t1 < $s1 -> $t5=1
		beq $t5,$zero,endfor 
		nop
		div $s1, $t1	# $s1%$t1
		mfhi $t3  	# luu so du vao $t3
		mflo $t4		# luu thuong vao $t4
		bne $t3,$zero,not_divide  
		nop
		#test==1
		la $a0, X #get address
   		li $t9, 1 #new value
   		sw $t9, 0($a0) #save new value	 
   		j endfor
		not_divide:
		nop
		addi $t1,$t1,1 	# tang den so tiep theo
		j for		
  	endfor:
  	#Check test==0
  	bne $t9,$zero,continue
  	nop
  	sw $s1,myArray($t8)
  	addi $t8, $t8, 4
  	continue:
  	addi $s1,$s1,1
  	la $a0, X #get address
   	li $t9, 0 #new value
   	sw $t9, 0($a0) #save new value
  	j handing
    endwhile: 
    #Print prime number 
    	li $v0,4
    	la $a0,message3
    	syscall
    	addi $t7, $zero, 0  #Clear index array = 0
    	while_print:
    		beq $t7,$t8,exit	 
    			
    		lw $t6, myArray($t7)
    		addi $t7,$t7,4
    		#print currnet number
    		li $v0,1
    		move $a0,$t6
    		syscall
    		#space
    		li $v0,4
    		la $a0,space
    		syscall
    		j while_print
   
   exit:
    		li $v0, 10
    		syscall
