
_main:

;Lab5Compiler.c,4 :: 		void main()
;Lab5Compiler.c,7 :: 		TRISB = 0x00; // Set PORTB as output
	CLRF       TRISB+0
;Lab5Compiler.c,8 :: 		TRISC = 0x00; // Set PORTC as output
	CLRF       TRISC+0
;Lab5Compiler.c,11 :: 		num[0] = 0x3F;
	MOVLW      63
	MOVWF      _num+0
	MOVLW      0
	MOVWF      _num+1
;Lab5Compiler.c,12 :: 		num[1] = 0x06;
	MOVLW      6
	MOVWF      _num+2
	MOVLW      0
	MOVWF      _num+3
;Lab5Compiler.c,13 :: 		num[2] = 0x5B;
	MOVLW      91
	MOVWF      _num+4
	MOVLW      0
	MOVWF      _num+5
;Lab5Compiler.c,14 :: 		num[3] = 0x4F;
	MOVLW      79
	MOVWF      _num+6
	MOVLW      0
	MOVWF      _num+7
;Lab5Compiler.c,15 :: 		num[4] = 0x66;
	MOVLW      102
	MOVWF      _num+8
	MOVLW      0
	MOVWF      _num+9
;Lab5Compiler.c,16 :: 		num[5] = 0x6D;
	MOVLW      109
	MOVWF      _num+10
	MOVLW      0
	MOVWF      _num+11
;Lab5Compiler.c,17 :: 		num[6] = 0x7D;
	MOVLW      125
	MOVWF      _num+12
	MOVLW      0
	MOVWF      _num+13
;Lab5Compiler.c,18 :: 		num[7] = 0x07;
	MOVLW      7
	MOVWF      _num+14
	MOVLW      0
	MOVWF      _num+15
;Lab5Compiler.c,19 :: 		num[8] = 0x7F;
	MOVLW      127
	MOVWF      _num+16
	MOVLW      0
	MOVWF      _num+17
;Lab5Compiler.c,20 :: 		num[9] = 0x6F;
	MOVLW      111
	MOVWF      _num+18
	MOVLW      0
	MOVWF      _num+19
;Lab5Compiler.c,23 :: 		while(1)
L_main0:
;Lab5Compiler.c,25 :: 		for(i = 0; i < 10; ++i)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      10
	SUBWF      _i+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Lab5Compiler.c,27 :: 		for(j = 0; j < 10; ++j)
	CLRF       _j+0
	CLRF       _j+1
L_main5:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      10
	SUBWF      _j+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Lab5Compiler.c,29 :: 		PORTC = num[i]; // Display the first digit
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _num+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Lab5Compiler.c,30 :: 		PORTB = num[j]; // Display the second digit
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _num+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Lab5Compiler.c,32 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;Lab5Compiler.c,27 :: 		for(j = 0; j < 10; ++j)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Lab5Compiler.c,33 :: 		}
	GOTO       L_main5
L_main6:
;Lab5Compiler.c,25 :: 		for(i = 0; i < 10; ++i)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Lab5Compiler.c,34 :: 		}
	GOTO       L_main2
L_main3:
;Lab5Compiler.c,35 :: 		}
	GOTO       L_main0
;Lab5Compiler.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
