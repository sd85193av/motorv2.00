;** ***************************************************************************************
;*    File Name   :initialize.asm
;*    Create Date :2022-10-26
;*    Modufy Date :
;*    Auther      :Danny Chang
;*    Information :
;*
;** ***************************************************************************************
;*    Include
;* 
#include "p16f1947.inc"
 
;**
;* @brief CODE_INITIALIZE
;* 
;**

IOPORT MACRO  AA,AB,AC,AD
 PLPL:

 BANKSEL PORTE
	BSF PORTE,0X06
	NOP
	BCF PORTE,0X06
	NOP
	BSF PORTE,0X06
	NOP
	BCF PORTE,0X06
	NOP
	

;------------------------
 RETURN
ENDM


TEST_RENEW_DATA MACRO  ARG0,ARG1
    MOVLW   ARG0
    MOVWF   0X30
    MOVLW   ARG1
    MOVWF   0X31
    NOP
    NOP
    CALL    PLPL
ENDM




