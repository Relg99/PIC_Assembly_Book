;---------------------------------------------------------;
;							  ;
;Author: 	@Relg99					  ;
;Date:		21/08/23				  ;
;							  ;
;Programm:	Jumps_06				  ;
;							  ;
;Description:						  ;
;							  ;
;Take an input number form PORTA (A0, A1, A2) and light	  ;
;up the same number of leds at PORTB.			  ;
;EXAMPLE:						  ;
;Input at PORTA: 	A0(1), A1(0), A2(1)		  ;
;Output at PORTB: 	B0(1), B1(1), B2(1), B3(1),	  ;
;			B4(1), B5(0), B6(0), B7(0)	  ;
;---------------------------------------------------------;


#include "p16f628a.inc"

	__CONFIG	_CP_OFF & _CPD_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_ON & _PWRTE_OFF & _WDTE_OFF & _FOSC_INTOSCIO

	LIST P=16F628A

count	EQU	0x20			; Create memory for variables.
input	EQU	0x21
leds	EQU	0x22

	ORG	0x00

	CLRF	PORTA			; Initialize ports.
	CLRF	PORTB

	MOVLW	0x07
	MOVWF	CMCON

	BSF	STATUS,RP0		; Change to bank 1.
	BCF	STATUS,RP1

	MOVLW	0x1F
	MOVWF	TRISA			; PORTA as input.

	MOVLW	0x00
	MOVWF	TRISB			; PORTB as output.

	BCF	STATUS,RP0		; Change to bank 0.
	BCF	STATUS,RP1

main:

	CLRF	input
	
	MOVF	PORTA,W			; Get user input.
	MOVWF	input

	MOVLW	0x07			; Discard unused data.
	ANDWF	input,F

	MOVLW	0x07			; Reset counter.
	MOVWF	count

	MOVLW	0x7F			; Reset output.
	MOVWF	leds

cicle:		

	MOVF	count,W
	SUBWF	input,W

	BTFSS	STATUS,Z	

	GOTO	rotate
	GOTO	finish

rotate:

	DECF	count,F
	RRF	leds,F			; Rotate to decrease used leds.
	GOTO	cicle	

finish:
	
	MOVF	leds,W			; Show results.
	MOVWF	PORTB
	GOTO	main

	END
