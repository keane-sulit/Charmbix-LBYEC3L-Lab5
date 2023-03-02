
_inc:

;Lab5Compiler.c,6 :: 		void inc() {
;Lab5Compiler.c,7 :: 		if(PORTB.F7 == 0) {
	BTFSC      PORTB+0, 7
	GOTO       L_inc0
;Lab5Compiler.c,8 :: 		a++;
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;Lab5Compiler.c,9 :: 		delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_inc1:
	DECFSZ     R13+0, 1
	GOTO       L_inc1
	DECFSZ     R12+0, 1
	GOTO       L_inc1
	DECFSZ     R11+0, 1
	GOTO       L_inc1
	NOP
	NOP
;Lab5Compiler.c,10 :: 		}
L_inc0:
;Lab5Compiler.c,11 :: 		if(a == 10) {
	MOVLW      0
	XORWF      _a+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__inc7
	MOVLW      10
	XORWF      _a+0, 0
L__inc7:
	BTFSS      STATUS+0, 2
	GOTO       L_inc2
;Lab5Compiler.c,12 :: 		a = 0;
	CLRF       _a+0
	CLRF       _a+1
;Lab5Compiler.c,13 :: 		b++;
	INCF       _b+0, 1
	BTFSC      STATUS+0, 2
	INCF       _b+1, 1
;Lab5Compiler.c,14 :: 		}
L_inc2:
;Lab5Compiler.c,15 :: 		}
L_end_inc:
	RETURN
; end of _inc

_reset:

;Lab5Compiler.c,17 :: 		void reset() {
;Lab5Compiler.c,18 :: 		if(b == 10) {
	MOVLW      0
	XORWF      _b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__reset9
	MOVLW      10
	XORWF      _b+0, 0
L__reset9:
	BTFSS      STATUS+0, 2
	GOTO       L_reset3
;Lab5Compiler.c,19 :: 		a = 0;
	CLRF       _a+0
	CLRF       _a+1
;Lab5Compiler.c,20 :: 		b = 0;
	CLRF       _b+0
	CLRF       _b+1
;Lab5Compiler.c,21 :: 		}
L_reset3:
;Lab5Compiler.c,22 :: 		}
L_end_reset:
	RETURN
; end of _reset

_main:

;Lab5Compiler.c,24 :: 		void main() {
;Lab5Compiler.c,25 :: 		TRISB = 0x80;
	MOVLW      128
	MOVWF      TRISB+0
;Lab5Compiler.c,26 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Lab5Compiler.c,27 :: 		while(1) {
L_main4:
;Lab5Compiler.c,28 :: 		PORTB = count[a];
	MOVF       _a+0, 0
	MOVWF      R0+0
	MOVF       _a+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _count+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Lab5Compiler.c,29 :: 		PORTC = count[b];
	MOVF       _b+0, 0
	MOVWF      R0+0
	MOVF       _b+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _count+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Lab5Compiler.c,30 :: 		inc();
	CALL       _inc+0
;Lab5Compiler.c,31 :: 		reset();
	CALL       _reset+0
;Lab5Compiler.c,32 :: 		}
	GOTO       L_main4
;Lab5Compiler.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
