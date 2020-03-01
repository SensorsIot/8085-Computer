		.cr     8085        To load the 8085 cross overlay
 
		.OR		$0000
		.TF	Light.hex,INT,32

RESET	MVI	 A,03H
		OUT	20H			; Initialize 8155
;		LXI	SP,17FFH	; Initialize Stack Pointer End of RAM
		LXI	SP,20FFH	; Initialize Stack Pointer End of RAM 8155

		MVI C, 15H		; Initializing the counter
		LXI H, PATTERN	; Pointing to the pattern IN-BUFFER

AGAIN:	MOV A,M			; Read pattern byte
		OUT 21H			; Out at port B
		CALL DELAY		; Calling the delay sub-routine
		INR L			; Pointing to the next location
		DCR C			; Decrement the counter
		JNZ AGAIN		; If not exhausted go again
		JMP	RESET
DELAY:	PUSH B			; Saving B. This delay subroutine uses 2 single registers A & D and 1 register pair BC
		PUSH PSW		; Saving PSW
		MVI D, 0FH		; Loading counter for outer loop
ST:		LXI B, 1000H	; Loading counter for inner loop
L:		DCX B			; Decrement inner counter
		MOV A, C		; If not exhausted go again for inner loop
		ORA B	
		JNZ L	
		DCR D			; Decrement outer counter
		JNZ ST			; If not exhausted go again for outer loop
		POP PSW			; Restore PSW
		POP B			; Restore B
		RET				; Return to the calling program
	
;PATTERN:	.DB		$FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF
;PATTERN:	.DB		$81, $42, $24, $18, $18, $24, $42, $81, $81, $C3, $E7, $FF, $7E, $3C, $18, $00, $55, $AA, $55, $AA, $FF


PATTERN:	.DB		$7e, $bd, $db, $e7, $e7, $db, $bd, $7e, $7e, $3c, $18, $00, $81, $c3, $e7, $ff, $aa, $55, $aa, $55, $00
