 .cr     8085        To load the 8085 cross overlay
 
		.OR		$0000
		.TF	blink1.hex,INT,32

		MVI	A,01H
		OUT	20H			; Initialize 8155
		
LOOP:	MVI	 A,01H
		OUT	21H			; Pin High
		
		NOP
		NOP
		NOP
		NOP
		NOP
		
		MVI	 A,00H
		OUT	21H			; Pin Low
		
		NOP
		NOP
		NOP
		NOP
		NOP
		
		JMP	LOOP
		
		
		
		
		
		
