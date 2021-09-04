$MOD51	; This includes 8051 definitions 
   
LOOP:    SETB P0.1
		 CLR  P0.0
		 ACALL DELAY
		 CLR P0.1
		 SETB P0.0
		 ACALL DELAY
		 SJMP LOOP

	 DELAY: MOV R1,01H
		L1: DJNZ R1,L1
			RET
		 
          END