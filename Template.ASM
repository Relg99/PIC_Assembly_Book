;-----------------------------------------------;
;						;
;Author:		Relg99			;
;Date:						;
;						;
;						;
;Program:					;
;						;
;Description:					;
;						;
;						;
;						;
;						;
;						;
;						;
;						;
;						;
;-----------------------------------------------;



#include "p16f628a.inc"

	__CONFIG _CP_OFF & _CPD_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_ON & _PWRTE_OFF & _WDTE_OFF & _FOSC_INTOSCIO


	LIST	P=16F628A

	ORG	0x00

	MOVLW	0x07
	MOVWF	CMCON

	BSF	STATUS,RP0

	MOVLW	0x00
	MOVWF	TRISB

	MOVLW	0x1F
	MOVWF	TRISA

	BCF	STATUS,RP0

main:

	GOTO	main
	
	END
