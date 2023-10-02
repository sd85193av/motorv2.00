;** ***************************************************************************************
;*    File Name   :筿玡init.asm
;*    Create Date :2022-10-26
;*    Modufy Date :
;*    Auther      :
;*    Information :
;*
;** ***************************************************************************************
#include "p16f1947.inc"
;=================================
;========筿OSC把计砞﹚========
;=================================
CODE_INITIALIZE_OSC MACRO DAT01,DAT02,DAT03
INITIALIZE_OSC:
BANKSEL     OSCCON
    MOVLW   DAT01
    MOVWF   OSCCON
    MOVLW   DAT02
    MOVWF   OSCTUNE
    MOVLW   DAT03
    MOVWF   OSCSTAT		;蔼繵历弘0.5%
BANKSEL     PORTA
    RETURN
ENDM
;=================================
;========== い耞把计砞﹚ =========
;=================================
CODE_INITIALIZE_INT1 MACRO DAT01,DAT02,DAT03,DAT04,DAT05,DAT06
INITIALIZE_INT:
    MOVLW   DAT01
    MOVWF   OPTION_REG
    MOVLW   DAT02
    MOVWF   INTCON
BANKSEL     PIE1
    MOVLW   DAT03
    MOVWF   PIE1
BANKSEL     PIE2
    MOVLW   DAT04
    MOVWF   PIE2
BANKSEL     PIE3
    MOVLW   DAT05
    MOVWF   PIE3
BANKSEL     PIE4
    MOVLW   DAT06
    MOVWF   PIE4
BANKSEL     PORTA
    RETURN
ENDM


;=================================
;==========  IO砞﹚ ==============
;=================================
CODE_INIT_BE_IO MACRO DAT01,DAT02,DAT03,DAT04,DAT05,DAT06,DAT07
INIT_BEFORE_IO:
BANKSEL     TRISA
    MOVLW   DAT01
    MOVWF   TRISA
    MOVLW   DAT02
    MOVWF   TRISB
    MOVLW   DAT03
    MOVWF   TRISC
    MOVLW   DAT04
    MOVWF   TRISD
    MOVLW   DAT05
    MOVWF   TRISE
BANKSEL     TRISF
    MOVLW   DAT06
    MOVWF   TRISF
    MOVLW   DAT07
    MOVWF   TRISG
BANKSEL     PORTA
    RETURN
ENDM


;=================================
;==========  ADC 砞﹚ ============
;=================================
CODE_INIT_BE_ADC MACRO DAT01,DAT02,DAT03,DAT04,DAT05,DAT06
INIT_BEFORE_ADC:
BANKSEL     ADCON0
    MOVLW   DAT01
    MOVWF   ADCON0
    MOVLW   DAT02
    MOVWF   ADCON1		;闽超
;=================================
;========  ADC PIN 砞﹚ ==========
;=================================
BANKSEL     ANSELA
    MOVLW   DAT03
    MOVWF   ANSELA
;----------
    MOVLW   DAT04
    MOVWF   ANSELE
BANKSEL     ANSELF
    MOVLW   DAT05
    MOVWF   ANSELF
;-----
    MOVLW   DAT06
    MOVWF   ANSELG
BANKSEL     PORTA
    RETURN
ENDM







