 .cr     8085        To load the 8085 cross overlay
 
		.OR		$0000
		.TF	blink3.hex,INT,32

		MVI	A,01H
		OUT	20H			; Initialize 8155
		
LOOP:	MVI	 A,01H
		OUT	21H
		
WAIT1:	MVI D, 0FFH		; Loading counter for outer loop
ST1:		LXI B, 90H	; Loading counter for inner loop
L1:		DCX B			; Decrement inner counter
		MOV A, C		; If not exhausted go again for inner loop
		ORA B	
		JNZ L1	
		DCR D			; Decrement outer counter
		JNZ ST1			; If not exhausted go again for outer loop
		
OFF:	MVI	 A,00H
		OUT	21H
		
WAIT2:	MVI D, 0FFH		; Loading counter for outer loop
ST2:		LXI B, 90H	; Loading counter for inner loop
L2:		DCX B			; Decrement inner counter
		MOV A, C		; If not exhausted go again for inner loop
		ORA B	
		JNZ L2	
		DCR D			; Decrement outer counter
		JNZ ST2			; If not exhausted go again for outer loop
		
		JMP LOOP
		
		
		
		
		
		
