$MOD51	; This includes 8051 definitions for the Metalink assembler

; Please insert your code here.
   		  ORG 0000H
	LOOP: MOV P0, #01H
	      ACALL DELAY
		  MOV P0, #02H
          ACALL DELAY
		  SJMP LOOP

	DELAY:MOV R1,#02H
	  L2: MOV R2,#0FFH
	  L1: DJNZ R2,L1
		  DJNZ R1,L2
		  RET
 		  END