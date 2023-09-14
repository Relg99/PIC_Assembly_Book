;---------------------------------------------------------;
;                                                         ;
;Author:	 Relg99                                   ;
;Date:		 21/08/23                                 ;
;                                                         ;
;                                                         ;
;Program:	Indexing_02                               ;
;                                                         ;
;Description:                                             ;
;                                                         ;
;Control level of water inside a tank.                    ;
;Sensors:	Sensor_1(A0), sensor_2(A1), sensor_3(A2). ;
;Water pumps:	WP1(B5), WP2(B6).                         ;
;Indicators: 	Empty(B0), filling up(B1), full(B2),      ;
;		overflow(B3), Alarm(B4).                  ;
;                                                         ;
;                                                         ;
;                     _______________________________     ;
;                    / _____________________________ \    ;
;                   / /      ______________         \ \   ;
;                   | |     / ____________ \	    | |	  ;
;                   | |    / /            \ \       | |   ;
;                   | |    | |            | |       | |   ;
;                                        _|_|_     _|_|_  ;
;	|---------sensor_3------|	/     \   /     \ ;
;       |			|       | WP1 |   | WP2 | ;
;       |---------sensor_2------|       \_____/   \_____/ ;
;       |			|                         ;
;       |			|                         ;
;       |			|                         ;
;       |---------sensor_1------|                         ;
;       |_______________________|                         ;
;                                                         ;
;                                                         ;
;1. If the tank is empty both water pumps will activate.  ;
;   The "Empty" indicator will turn on.                   ;
;2. When the water gets to the empty level and touches    ;
;   the empty sensor the "Filling up" indicator will turn ;
;   on, turning off the "Empty" indicator.                ;
;3. If the water gets to the full sensor the WP2 will turn;
;   off. The "Full" indicator will turn on.               ;
;4. Finally, if the water gets to the overflow sensor     ;
;   both WP1 and WP2 will shut down and the "Overflow"    ;
;   indicator will shine.	                          ;
;                                                         ;
;---------------------------------------------------------;




#include "p16f628a.inc"

	__CONFIG _CP_OFF & _CPD_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_ON & _PWRTE_OFF & _WDTE_OFF & _FOSC_INTOSCIO


	LIST P=16F628A

	ORG	0x00
	
	CLRF	PORTA
	CLRF	PORTB

	MOVLW	0x07
	MOVWF	CMCON

	BSF	STATUS,RP0
	BCF	STATUS,RP1

	MOVLW	0x1F
	MOVWF	TRISA

	MOVLW	0x00
	MOVWF	TRISB

	BCF	STATUS,RP0
	BCF	STATUS,RP1

main:

	MOVF	PORTA,W
	ANDLW	b'00000111'	; We are only interested in
	ADDWF	PCL,F		; 3 bits of the input.


	; It's basically	; O F E
	; a truth table.	; -----
	GOTO	empty		; 0 0 0 
	GOTO	sensor_1	; 0 0 1
	GOTO	alarm		; 0 1 0
	GOTO	sensor_2	; 0 1 1
	GOTO	alarm		; 1 0 0
	GOTO	alarm		; 1 0 1
	GOTO	alarm		; 1 1 0
	GOTO	sensor_3	; 1 1 1

empty:

				; Wp2 Wp1 A O Full Fi-up E
	
	MOVLW	0x61		;  1   1  0 0   0    0   1
	MOVWF	PORTB
	GOTO	main

sensor_1:


	MOVLW	0x62		;  1   1  0 0   0    1   0
	MOVWF	PORTB
	GOTO	main

sensor_2:


	MOVLW	0x24		;  0   1  0 0   1    0   0
	MOVWF	PORTB
	GOTO	main

sensor_3:


	MOVLW	0x08		;  0   0  0 1   0    0   0
	MOVWF	PORTB
	GOTO	main

alarm:


	MOVLW	0x10		;  0   0  1 0   0    0   0
	MOVWF	PORTB
	GOTO	main

	END
