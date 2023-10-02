;** ***************************************************************************************
;*    File Name   :io測試副程式.asm
;*    Create Date :2022-10-26
;*    Modufy Date :
;*    Auther      :
;*    Information :
;*
;** ***************************************************************************************
;*    Include
;* 
#include "p16f1947.inc"

;--------------------------------------------------------------
;=================================
;==========測試SERIAL動作=========
;=================================
SEND_DATA_TEMP      EQU       0X30
SEND_COUNTER        EQU       0X31
SEND_DAT1           EQU       0X32
SEND_DAT2           EQU       0X33

SERIAL_IO_LOOP MACRO DAT1, DAT2
BANKSEL     PORTA
    MOVLW   DAT1
    MOVWF   SEND_DATA_TEMP
    MOVLW   DAT2
    MOVWF   SEND_COUNTER
    CALL    TRANS_SERIAL_LEVEL1
ENDM


CODE_SERIAL_IO_LOOP MACRO
TRANS_SERIAL_LEVEL1:
BANKSEL     PORTA
    BTFSC   SEND_DATA_TEMP,0X07
    BSF     PORTD,0X05
    BTFSS   SEND_DATA_TEMP,0X07
    BCF     PORTD,0X05
    RLF     SEND_DATA_TEMP,F
    DECFSZ  SEND_COUNTER,F
    GOTO    TRANS_SERIAL_LEVEL1
    BCF     PORTD,0X05 
BANKSEL     PORTA
    RETURN
ENDM
;-----------------------------------------------------------
SOFT_UART1_BEFORE MACRO DAT01
BANKSEL PORTC
BSF PORTC,0X00

BANKSEL     TX1REG
    MOVLW   DAT01
    MOVWF   TX1REG
    CALL    SOFT_WAIT_UART1
 ENDM
CODE_SOFT_UART1_LOOP MACRO
SOFT_WAIT_UART1:
BANKSEL     PIR1
    BTFSS   PIR1,0X04
    GOTO    SOFT_WAIT_UART1
    BCF     PIR1,0X04
BANKSEL     PORTA
BCF PORTC,0X00
    RETURN
ENDM    
;---------------------------------------------------------


;-----------------------------------------------------------
SOFT_UART2_BEFORE_NUMBER MACRO  DAT01
BANKSEL     TX2REG
    MOVLW   DAT01
    MOVWF   TX2REG
    CALL    SOFT_WAIT_UART2
 ENDM

CODE_SOFT_UART2_LOOP MACRO
SOFT_WAIT_UART2:
BANKSEL     PIR4
    BTFSS   PIR4,0X04
    GOTO    SOFT_WAIT_UART2
    BCF     PIR4,0X04
BANKSEL     PORTA
    RETURN
ENDM    
;-----------------------------------------------------------



SOFT_UART2_BEFORE_REG MACRO DAT01
BANKSEL     TX2REG
    MOVF    DAT01,W
    MOVWF   TX2REG
    CALL    SOFT_WAIT_UART2
 ENDM
;---------------------------------------------------------
