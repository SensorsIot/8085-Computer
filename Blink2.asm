 .cr     8085        To load the 8085 cross overlay
 
		.OR		$0000
		.TF	blink2.hex,INT,32

		MVI	A,01H
		OUT	20H			; Initialize 8155
		
LOOP:	MVI	 A,01H
		OUT	21H			; Switch LED on
		
		MVI	 A,00H
WAIT1:	INR	A			; delay()
		NOP
		CPI 0FFH
		JZ	OFF
		JMP WAIT1
		
OFF:	MVI	 A,00H
		OUT	21H			; Switch LED off
		
WAIT2:	INR	A			; delay()
		NOP
		CPI 0FFH
		JZ	LOOP
		JMP	WAIT2
		
		
		
		
		
		
