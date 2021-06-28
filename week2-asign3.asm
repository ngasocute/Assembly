#Program which prompts the user to enter  their favorite type of pie
#Author: NTNga-20184296
#Date: 3/11/2021

.data 
prompt: .asciiz " Please input your student ID: "
output: .asciiz  " So your stdent ID is: "
output2: .asciiz  " Student ID by word is: two, zero, one, eight, four, two, nine, six"
input: .space 81
inputSize: .word 80

.text
main:
	#prompt for the string to enter 
	li $v0, 4
	la $a0, prompt
	syscall
	
	#Read the string
	li $v0, 8 	
	la $a0, input 
	lw $a1, inputSize		
	syscall		
	#output the text
	li $v0, 4
	la $a0, output 
	syscall
	
	#output the string
	li $v0,4
	la $a0, input
	syscall
	
	#output the text
	li $v0,4
	la $a0, output2
	syscall
	
 	#exit
 	li $v0, 10
 	syscall
 	
