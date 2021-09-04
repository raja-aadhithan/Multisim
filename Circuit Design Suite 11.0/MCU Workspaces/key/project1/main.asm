$MOD51	
		MOV P1,#00H
		MOV P0,#00H

loop:	MOV A , #00H
; CHECK THE VALUE 0F INPUT
		JNB P1.0, L1 ; row 0
		ADD A , #01H

	L1: JNB P1.1, L2 ; row 1
		ADD A , #02H

	L2: JNB P1.2, L3 ; col 0
		ADD A , #04H

	L3: JNB P1.3, L4 ; col 1
		ADD A , #08H
		
; MAP THE INPUT TO OUTPUT
	L4: MOV B, A
		CJNE A,#05H ,L5 ; switch 1,1
		MOV P0,#07H
	LA: JNB P1.0, LX 
	    JB P1.2, LA 
	LX:	LJMP L16

	L5: MOV A,B
		CJNE A,#06H ,L6 ; switch 1,2
		MOV P0,#79H
	LB: JNB P1.0, LY
	    JB P1.3, LB 
	LY: LJMP L16

	L6: MOV A,B
		CJNE A,#09H ,L7 ; switch 2,1
		MOV P0,#07H
	LC: JNB P1.1, LZ
	    JB P1.2, LC
	LZ: LJMP L16

	L7: MOV A,B
		CJNE A,#0AH ,L16 ; switch 2,2
		MOV P0,#6FH
	LD: JNB P1.1, L16 
	    JB P1.3, LD 

   L16: LJMP loop
		
  
END


