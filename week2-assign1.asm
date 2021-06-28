#Laboratory Excercise 2, Assignment 2
#Author NTNga-20184296
#Date: 3/11/2021

.text
	lui $s0, 0x2110		#put upper half of pattern in $s0
	ori $s0, $s0, 0x003d	#put lowe half of pattern in $s0