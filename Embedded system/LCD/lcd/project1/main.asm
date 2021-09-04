$MOD51 ; this includes 8051 
ORG 0000
;STORING NAME IN 60H TO 6FH
		MOV R1 ,#60H
		MOV @R1,#'T'
		INC R1
		MOV @R1,#' '
		INC R1
		MOV @R1,#'R'
		INC R1
		MOV @R1,#'A'
		INC R1
		MOV @R1,#'J'
		INC R1
		MOV @R1,#'A'
		INC R1
		MOV @R1,#' '
		INC R1
		MOV @R1,#'A'
		INC R1
		MOV @R1,#'A'
		INC R1
		MOV @R1,#'D'
		INC R1
		MOV @R1,#'H'
		INC R1
		MOV @R1,#'I'
		INC R1
		MOV @R1,#'T'
		INC R1
		MOV @R1,#'H'
		INC R1
		MOV @R1,#'A'
		INC R1
		MOV @R1,#'N'

		MOV A,#38H    ; initialize LCD
		ACALL COMNWRT ; Call command Subroutine
		MOV A, #0EH   ; Display on, cursor on.
		ACALL COMNWRT ; Call command Subroutine.
		MOV A, # 01   ; Clear LCD.
		ACALL COMNWRT ; Call command subroutine
  	    MOV A, #80H ; Cursor at line 1 position 0
		ACALL COMNWRT ; Call command subroutine.

; // MESSAGE DISPLY
		MOV R0,#16
		MOV R1,#60H
   LOOP:MOV A,@R1
		ACALL DATAWRT
		INC R1
		DJNZ R0,LOOP
 AGAIN: SJMP AGAIN

COMNWRT:MOV P1, A
 		CLR P3.1; RS=0 FOR COMMAND WRITE
 		CLR P3.0; R/W=0FOR WRITE
 		SETB P3.2; E=1 FOR HIGH PUSLSE
 		CLR P3.2 ;E=0 FOR H-TO-L PULSE
 		RET 

DATAWRT:MOV P1, A; WRITE DATA TO LCD
	 	SETB P3.1; RS=1 FOR DATA
 		CLR P3.0; R/W=0 F0R WRITE
 		SETB P3.2; E=1 FOR HIGH PULSE
 		CLR P3.2; E=0 FOR H-TO-L PULSE
 		RET
		END