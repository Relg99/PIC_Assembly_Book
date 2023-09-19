;-----------------------------------------------;
;Author: 	Relg99				;
;Date:		19/09/23			;
;						;
;						;
;Program:	Tables				;
;						;
;Description:					;
;						;
;Using the directive DT for the first time.	;
;Creating a truth table with subroutines.	;
;						;
;		C B A | S5 S4 S3 S2 S1 S0	;
;		-------------------------	;
;		0 0 0 | 0  0  0  0  0  0	;
;		0 0 1 | 0  0  0  0  0  1	;
;		0 1 0 | 0  0  0  0  1  0	;
;		0 1 1 | 0  0  0  1  0  0	;
;		1 0 0 | 0  0  1  0  0  0	;
;		1 0 1 | 0  1  0  0  0  0	;
;		1 1 0 | 1  0  0  0  0  0	;
;		1 1 1 | 1  1  1  1  1  1	;
;						;
;-----------------------------------------------;



#include "p16f628a.inc"


	__CONFIG _CP_OFF & _CPD_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_ON & _PWRTE_OFF & _WDTE_OFF & _FOSC_INTOSCIO


	LIST	P=16F628A

	ORG	0x00

	MOVLW	0x07
	MOVWF	CMCON
	
	BSF	STATUS,RP0

	MOVLW	0x1F
	MOVWF	TRISA

	MOVLW	0x00
	MOVWF	TRISB

	BCF	STATUS,RP0

main:

	GOTO	main

	END

