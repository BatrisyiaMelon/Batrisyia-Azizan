 			#include<p18F4550.inc>

loop_cnt1	set 0x00
loop_cnt2	set	0x01

			org	0x00
			goto	start
			org	0x08
			retfie
			org	0x18
			retfie

dup_nop		macro	kk
			variable	i

i=0
			while	i < kk
			nop

i+=1
			endw
			endm

start		CLRF	TRISD,A
			CALL	CLEAR
			CALL	TOGGLE
			CALL	INCREMENT

CLEAR		CLRF 	PORTD,A
			RETURN

TOGGLE		MOVLW	B'00101010'
			XORWF	PORTD,F,A
			RETURN

INCREMENT	INCFSZ	PORTD, 1, A
			RETURN
			
			END	 

			
			
		