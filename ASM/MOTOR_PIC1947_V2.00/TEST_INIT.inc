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

;-----------------------------------------------------------
;-----------------------------------------------------------
INITIALIZE_OSC11 MACRO 

INITIALIZE_OSC22:

BANKSEL		OSCCON
    MOVLW	0X72
    MOVWF	OSCCON
    MOVLW	0X00
    MOVWF	OSCTUNE
    MOVLW	0X11
    MOVWF	OSCSTAT		;高頻振盪精度0.5% 
;=================================
;========== OPTION 設定 ==========
;=================================

    MOVLW	0X80
    MOVWF	OPTION_REG
    MOVLW	0X00
    MOVWF	INTCON
BANKSEL		PIE1
    MOVWF	0X00
    MOVWF	PIE1
    MOVLW	0X00
    MOVWF	PIE2
    MOVLW	0X00
    MOVWF	PIE3
    MOVLW	0X00
    MOVWF	PIE4
BANKSEL		TRISA
    MOVLW	0X00
    MOVWF	TRISA
    MOVLW	0X00
    MOVWF	TRISB
    MOVLW	0X00
    MOVWF	TRISC
    MOVLW	0X00
    MOVWF	TRISD
    MOVLW	0X00
    MOVWF	TRISE
BANKSEL		TRISF
    MOVLW	0XFF
    MOVWF	TRISF
    MOVLW	0X00
    MOVWF	TRISG
;=================================
;==========  ADC 設定 ============
;=================================
BANKSEL		ADCON0
    MOVLW	0X00
    MOVWF	ADCON0
    MOVLW	0X01
    MOVWF	ADCON1		;全關閉
;=================================
;========  ADC PIN 設定 ==========
;=================================
BANKSEL		ANSELA
    CLRF	ANSELA
    CLRF	ANSELE
BANKSEL		ANSELF
    CLRF	ANSELF
    CLRF	ANSELG
BANKSEL		PORTA
    RETURN
ENDM




