;** ***************************************************************************************
;*    File Name   :Bootloader後的初始化.asm
;*    Create Date :2022-10-27
;*    Modufy Date :
;*    Auther      :
;*    Information :
;*
;** ***************************************************************************************
;*    Include
;* 
#include "p16f1947.inc"
;=================================
;==========   IO 設定 ============
;=================================
CODE_INIT_AF_IO MACRO DAT01,DAT02,DAT03,DAT04,DAT05,DAT06,DAT07
INIT_AFTER_IO:
BANKSEL     LATA
    CLRF    LATA
    CLRF    LATB
    CLRF    LATC
    CLRF    LATD
    CLRF    LATE
BANKSEL     LATF
    CLRF    LATF
    CLRF    LATG
;------------------------------------
BANKSEL     PORTA
    CLRF    PORTA
    CLRF    PORTB
    CLRF    PORTC
    CLRF    PORTD
    CLRF    PORTE
BANKSEL     PORTF
    CLRF    PORTF
    CLRF    PORTG
;------------------------------------
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
;========== 比較器 設定 ==========
;=================================
;DAT1:FVRCON
;DAT2:DACCON0
;DAT3:DACCON1
;DAT4:CM1CON0
;DAT5:CM1CON1
CODE_INITIALIZE_COMPARE	MACRO	DAT01,DAT02,DAT03,DAT04,DAT05
INIT_AFTER_COMPARE:
BANKSEL     FVRCON
    MOVLW   DAT01
    MOVWF   FVRCON
BANKSEL     DACCON0
    MOVLW   DAT02
    MOVWF 	DACCON0
BANKSEL     DACCON1
    MOVLW   DAT03
    MOVWF   DACCON1
BANKSEL     CM1CON0
    MOVLW   DAT04
    MOVWF   CM1CON0
BANKSEL     CM1CON1
    MOVLW   DAT05
    MOVWF   CM1CON1
BANKSEL     PORTA
    RETURN
ENDM

;=================================
;========== UART設定 =============
;=================================
;DAT01:決定使用UART1或是UART2
;DAT02:SPXBRGH
;DAT03:SPXBRGL
;DAT04:BAUDXCON
;DAT05:TXXSTA
;DAT06:RCXSTA
CODE_INIT_AF_UART1	MACRO	DAT01,DAT02,DAT03,DAT04,DAT05
INIT_UART1_SETTING:
BANKSEL       SP1BRGH
    MOVLW     DAT01
    MOVWF     SP1BRGH
    MOVLW     DAT02
    MOVWF     SP1BRGL
BANKSEL       BAUD1CON
    MOVLW     DAT03
    MOVWF     BAUD1CON
BANKSEL       TX1STA
    MOVLW     DAT04
    MOVWF     TX1STA
BANKSEL       RC1STA
    MOVLW     DAT05
    MOVWF     RC1STA
BANKSEL       PORTA
    RETURN
ENDM
;---------------------------------
CODE_INIT_AF_UART2	MACRO	DAT01,DAT02,DAT03,DAT04,DAT05
INIT_UART2_SETTING:
BANKSEL       SP2BRGH
    MOVLW     DAT01
    MOVWF     SP2BRGH
    MOVLW     DAT02
    MOVWF     SP2BRGL
BANKSEL       BAUD2CON
    MOVLW     DAT03
    MOVWF     BAUD2CON
BANKSEL       TX2STA
    MOVLW     DAT04
    MOVWF     TX2STA
BANKSEL       RC2STA
    MOVLW     DAT05
    MOVWF     RC2STA
BANKSEL       PORTA
    RETURN
ENDM

CODE_INIT_AF_IOC    MACRO DAT01,DAT02
INIT_AF_IOC_SETTING:
BANKSEL       IOCBP
    MOVLW     DAT01
    MOVWF     IOCBN
    MOVLW     DAT02
    MOVWF     IOCBP
BANKSEL       TRISB
    BSF       TRISB,0X00
    BSF       TRISB,0X01
    MOVLW     0XC8
    MOVWF     INTCON
BANKSEL       PORTA
    RETURN
ENDM
;---------------------------------
CODE_INIT_AF_TIMER2	MACRO	DAT01,DAT02,DAT03
INIT_TIMER2_SETTING:
BANKSEL       T2CON
    MOVLW     DAT01
    MOVWF     T2CON
BANKSEL       TMR2
    MOVLW     DAT02
    MOVWF     TMR2
BANKSEL       PR2
    MOVLW     DAT03
    MOVWF     PR2
BANKSEL       PIE1
    BSF       PIE1,TMR2IE
BANKSEL       PORTA
    RETURN
ENDM

;---------------------------------
CODE_INIT_AF_TIMER4	MACRO	DAT01,DAT02,DAT03
INIT_TIMER4_SETTING:
BANKSEL       T4CON
    MOVLW     DAT01
    MOVWF     T4CON
BANKSEL       TMR4
    MOVLW     DAT02
    MOVWF     TMR4
BANKSEL       PR4
    MOVLW     DAT03
    MOVWF     PR4
BANKSEL       PIE3
    BSF       PIE3,TMR4IE
BANKSEL       PORTA
    RETURN
ENDM

;---------------------------------
CODE_INIT_AF_ADC	MACRO	DAT01,DAT02,DAT03
INIT_ADC_SETTING:
BANKSEL       FVRCON
    MOVLW     DAT01
    MOVWF     FVRCON
BANKSEL       ADCON0
    MOVLW     DAT02
    MOVWF     ADCON0
BANKSEL       ADCON1
    MOVLW     DAT03
    MOVWF     ADCON1
BANKSEL       PORTA
    RETURN
ENDM