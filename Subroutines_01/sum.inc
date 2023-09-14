; This is a library
; It gets a value from PORTA and adds it to W (previous value of PORTA).

	ADDWF	PORTA,W
	RETURN
