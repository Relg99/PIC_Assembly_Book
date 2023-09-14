	processor 16f84
	include <p16f84.inc>
	__config _RC_OSC & _WDT_OFF & _PWRTE_ON


; Program


	org 0 			; start at address 0

	; At startup, all ports are inputs.
	; Set Port B to all outputs.

	BCF	STATUS,6
	BSF	STATUS,5

	MOVLW	b'00000000' ; w := binary 00000000
	MOVWF	TRISB ; copy w to port B control reg

	BCF	STATUS,6
	BCF	STATUS,5

	; Put a 1 in the lowest bit of port B.

	MOVLW	b'00000001'; w := binary 00000001
	MOVWF	PORTB ; copy w to port B itself

	; Stop by going into an endless loop

fin:
	goto	fin
	end 	; program ends here
