;
;
;		c b a | s0 s1 s2 s3 s4 s5
;		-------------------------
;		0 0 0 | 1  0  0  0  0  1
;		0 0 1 | 1  0  0  0  0  0
;		0 1 0 | 1  1  1  1  1  1 
;		0 1 1 | 0  1  0  1  0  1 
;		1 0 0 | 1  0  0  1  0  0 
;		1 0 1 | 0  0  1  0  0  1 
;		1 1 0 | 1  1  1  0  0  0 
;		1 1 1 | 0  0  0  1  1  1
;
;
;

#include "p16f628a.inc"

	__CONFIG _FOSC_INTOSCIO & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

	ORG	0

	CLRF	PORTA
	CLRF	PORTB


	MOVLW	0x07
	MOVWF	CMCON

	BCF	STATUS,RP1
	BSF	STATUS,RP0

	MOVLW	0x1F

	MOVWF	TRISA

	MOVLW	0x00
	
	MOVWF	TRISB
	
	BCF	STATUS,RP1
	BCF	STATUS,RP0

main:

	MOVF	PORTA,W
	
	ADDWF	PCL,F

options:

	GOTO	config_01
	GOTO	config_02
	GOTO	config_03
	GOTO	config_04
	GOTO	config_05
	GOTO	config_06
	GOTO	config_07
	GOTO	config_08

config_01:

	MOVLW	b'100001'
	GOTO	show

config_02:

	MOVLW	b'100000'
	GOTO	show

config_03:

	MOVLW	b'111111'
	GOTO	show

config_04:

	MOVLW	b'010101'
	GOTO	show

config_05:

	MOVLW	b'100100'
	GOTO	show

config_06:

	MOVLW	b'001001'
	GOTO	show

config_07:

	MOVLW	b'111000'
	GOTO	show

config_08:

	MOVLW	b'000111'
	GOTO	show

show:
	MOVWF	PORTB
	GOTO	main

	END	

