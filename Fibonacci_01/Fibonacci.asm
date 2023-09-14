;---------------------------------------------------------------;
;								;
;								;
;Author:	Relg99						;
;Date:		22/08/23					;
;								;
;								;
;Program:	Fibonacci					;
;								;
;Description:							;
;								;
;Show the Fibonacci sequence in PORTB with leds.		;
;The flow will be controlled by a button placed in A4.		;
;								;
;								;
;								;
;								;
;								;
;								;
;								;
;								;
;---------------------------------------------------------------;


#include "p16f628a.inc"


	__CONFIG _CP_OFF & _CPD_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_ON & _PWRTE_OFF & _WDTE_OFF & _FOSC_INTOSCIO

	LIST	P=16F628A

TMP1	EQU	0x20
TMP2	EQU	0x21
TMP3	EQU	0x22

	ORG	0x00

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


	MOVLW	0x01
	MOVWF	TMP1
	MOVWF	TMP2

main:

	MOVLW	0xFF
	MOVWF	PORTB

loop:

	MOVF	TMP2,W
	MOVWF	PORTB	
	MOVF	TMP1,W
	ADDWF	TMP2,W
	MOVWF	TMP3
	MOVF	TMP2,W
	MOVWF	TMP1
	MOVF	TMP3,W
	MOVWF	TMP2

	GOTO	btn

btn:

	BTFSC	PORTA,4
	GOTO	btn
	GOTO	wait

wait:

	BTFSS	PORTA,4
	GOTO	wait
	GOTO	loop	

	END
