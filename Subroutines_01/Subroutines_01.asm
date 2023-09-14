;---------------------------------------------------------;
;Author:	Relg99					  ;
;Date:		14/09/23				  ;
;							  ;
;							  ;
;Program:	Subroutines				  ;
;							  ;
;							  ;
;Description:						  ;
;							  ;
;In this program is used the reserved keyword "call"	  ;
;and "return" used to create subroutines.		  ;
;This subroutine calls are stored inside the stack.	  ;
;Is important to remember that the author of the program  ;
;should keep track of the stack overflow limit.		  ;
;							  ;
;							  ;
;							  ;
;---------------------------------------------------------;



#include "p16f628a.inc"


	__CONFIG _CP_OFF & _CPD_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_ON & _PWRTE_OFF & _WDTE_OFF & _FOSC_INTOSCIO

	LIST	P=16F628A


	ORG	0x00

	CLRF	PORTA
	CLRF	PORTB

	MOVLW	0x07
	MOVWF	CMCON

	BSF	STATUS,RP0

	MOVLW	0x1F
	MOVWF	TRISA
	
	MOVLW	0x00
	MOVWF	TRISB

	BCF	STATUS,RP0

main:

	CALL	sum
	MOVWF	PORTB
	GOTO	main	

sum:

	MOVLW	0x0A
	ADDWF	PORTA,W
	; This is just a demo, 
	; you can do more with subroutines.
	RETURN


	END
