;========================================================
;================ Project Information ===================
;========================================================   
;Project Name   : Software Timer 
;-------------------------------------------------------        
;Project Version: 2.00
;Edit Date      : 2023/09/28
;Function Info  : 2 source time bases
;               : 4 consecutive triggers Timer  (can be adjusted)
;               : 2 one-shot Timer
;-------------------------------------------------------
;Register
; 2 register for set status
; 6 register for data used
; 2 register for set one-shot Timer
;-------------------------------------------------------  
;Content details:                
  
;2 source time bases : 
;Two sources are BASE1,BASE2 
;  
;BASE1/2 : Need to set Register
;The module will automatically clear the relevant flags
;=>【BSF TMR_MODULE_FLAG,TMR_BASE1_FLAG】 / TMR_BASE2_FLAG
;-------------------------------------------------------
;4 consecutive triggers Timer (Base on source1,can be adjusted)
;TMR BASE1_01 / TMR BASE1_02 / TMR BASE1_03 / TMR BASE1_04 
;  
;Every time 【TMR BASE FLAG】 is triggered,the timer is continuously
;triggered will automatically add one and automatically restart the timer   
;The continuous trigger timer flag must be manually cleared
;  
;=>  【BCF TMR_BASE1_01_TRI_F】/ TMR_BASE1_02_TRI_F 
;          TMR_BASE1_03_TRI_F  / TMR_BASE1_04_TRI_F
;-------------------------------------------------------    
;2 one-shot Timer  (Base on source2,can be adjusted by the program)  
;TMR BASE2_01 / TMR BASE2_02   
;
;When the timer is set to start, each 【TMR BASE FLAG】 will trigger the
;timer,when the set time is met, the specific flag will be set and  the
;timer will be turned off
;  
;Need to set 【BCF TMR_BASE2_STATUS, TMR_BASE2_EV01_DOF】
;to Start the timing function.
;When the timer ends 【BCF TMR_BASE2_STATUS,TMR_BASE2_EV01_OVER】will be set.
;-------------------------------------------------------      
#include "p16f1947.inc"
#include "MODBUS-RTU.inc"
PSECT tool, class=CODE, delta=2 
;------------------------------------------------------- 
;------------------------------------------------------- 
;=======================================================
;====================== UART2 TX設定 ===================
;=======================================================
;傳送資料給UART
MODBUS_OUTPUT_FUNCTION:
    MOVLW   MODBUS_DAT_BUF_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_BUF_ADRL
    MOVWF   FSR1L
;------------------
    MOVF    BSR,W
    MOVWI   +2[FSR1]                                ;先將進入前的BANK存起來
BANKSEL     PORTA
    GOTO    MODBUS_INT_EXIT_FUNCTION
;=======================================================
;====================== UART2 MODULE ===================OK
;=======================================================
SET_MODBUS_MODE_ENABLE:
BANKSEL     SP2BRGH
    MOVLW   0X00
    MOVWF   SP2BRGH
    MOVLW   0X33                    ;9600
    MOVWF   SP2BRGL
BANKSEL     BAUD2CON
    MOVLW   0X00
    MOVWF   BAUD2CON
BANKSEL     TX2STA
    MOVLW   0X24
    MOVWF   TX2STA
BANKSEL     RC2STA
    MOVLW   0X90                                                                          
    MOVWF   RC2STA
BANKSEL     TRISG
    BCF     TRISG,MODBUS_EN                     ;設定MODBUS ENABLE為輸出
BANKSEL     MODBUS_OUT_P
    BCF     MODBUS_OUT_P,MODBUS_EN              ;設定MODBUS IC為接收
BANKSEL     PORTA
    RETURN
;=======================================================
;====================== UART2 離開 =====================
;=======================================================
MODBUS_INT_EXIT_FUNCTION:
    MOVIW   +2[FSR1]
    MOVWF   BSR
    RETURN
;=======================================================
;====================== UART2 RX設定 ===================OK
;=======================================================
MODBUS_INTPUT_FUNCTION:
    MOVLW   MODBUS_DAT_BUF_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_BUF_ADRL
    MOVWF   FSR1L
;------------------
    MOVF    BSR,W
    MOVWI   +2[FSR1]                                ;先將進入前的BANK存起來
;---------------------------------------------------
BANKSEL     PIR4
    BCF     PIR4,RC2IF
    MOVLW   0X0A
    ADDWF   FSR1L,F                                 ;將FSR指到存放資料的地方
;---------------------------------------------------
    MOVLW   MODBUS_DAT_BUF_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_BUF_ADRL
    MOVWF   FSR0L
    MOVLW   0X03
    ADDWF   FSR0L,F                                 ;從最低點加上OFFSET到達存放目前的資料位置
;---------------------------------------------------
    MOVF    INDF0,W
    ADDWF   FSR1L,F


    ;MOVIW   +3[FSR1]                                ;FSR1L再加上目前資料的OFFSET
    ;ADDWF   FSR1L,F
BANKSEL     RC2REG
    MOVF    RC2REG,W
    MOVWF   INDF1
;-------------------
    MOVLW   MODBUS_DAT_BUF_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_BUF_ADRL
    MOVWF   FSR1L
    MOVLW   0X03
    ADDWF   FSR1L,F
    INCF    INDF1,F
;--------------------                               ;將資料OFFSET的暫存器+1
    MOVLW   MODBUS_DAT_BUF_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_BUF_ADRL
    MOVWF   FSR1L
    MOVLW   0X07
    ADDWF   FSR1L,F
    BSF     INDF1,0X00
;--------------------                               ;清除TIME OUT COUNT
    MOVLW   MODBUS_DAT_BUF_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_BUF_ADRL
    MOVWF   FSR1L
    MOVLW   0X08
    ADDWF   FSR1L,F
    BSF     INDF1,0X00                                ;RX FIRST DATA FLAG SET
;-------------------- 
BANKSEL     PORTA
    GOTO    MODBUS_INT_EXIT_FUNCTION

