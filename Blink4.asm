 .cr     8085        To load the 8085 cross overlay
 
		.OR		$0000
		.TF	blink4.hex,INT,32

		MVI	A,01H
		OUT	20H			; Initialize 8155
;		LXI	SP,17FFH	; Initialize Stack Pointer End of RAM
		LXI	SP,20FFH	; Initialize Stack Pointer End of RAM 8155
		
LOOP:	MVI	 A,01H
		OUT	21H
		CALL DELAY
		
OFF:	MVI	 A,00H
		OUT	21H	
		CALL DELAY
		JMP LOOP
	
DELAY:	PUSH B			; Saving B. This delay subroutine uses 2 single registers A & D and 1 register pair BC
		PUSH D
		PUSH PSW		; Saving PSW
		MVI D, 0FFH		; Loading counter for outer loop
ST:		LXI B, 90H	; Loading counter for inner loop
L:		DCX B			; Decrement inner counter
		MOV A, C		; If not exhausted go again for inner loop
		ORA B	
		JNZ L	
		DCR D			; Decrement outer counter
		JNZ ST			; If not exhausted go again for outer loop
		POP PSW			; Restore PSW
		POP D
		POP B			; Restore B
		RET
		
		
		
		
		
		
