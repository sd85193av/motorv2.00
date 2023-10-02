;========================================================
;================ Project Information ===================
;========================================================   
;Project Name   : Software Timer 
;-------------------------------------------------------        
;Project Version: 1.00
;Edit Date      : 2023/01/11
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
;=>�iBSF TMR_MODULE_FLAG,TMR_BASE1_FLAG�j / TMR_BASE2_FLAG
;-------------------------------------------------------
;4 consecutive triggers Timer (Base on source1,can be adjusted)
;TMR BASE1_01 / TMR BASE1_02 / TMR BASE1_03 / TMR BASE1_04 
;  
;Every time �iTMR BASE FLAG�j is triggered,the timer is continuously
;triggered will automatically add one and automatically restart the timer   
;The continuous trigger timer flag must be manually cleared
;  
;=>  �iBCF TMR_BASE1_01_TRI_F�j/ TMR_BASE1_02_TRI_F 
;          TMR_BASE1_03_TRI_F  / TMR_BASE1_04_TRI_F
;-------------------------------------------------------    
;2 one-shot Timer  (Base on source2,can be adjusted by the program)  
;TMR BASE2_01 / TMR BASE2_02   
;
;When the timer is set to start, each �iTMR BASE FLAG�j will trigger the
;timer,when the set time is met, the specific flag will be set and  the
;timer will be turned off
;  
;Need to set �iBCF TMR_BASE2_STATUS, TMR_BASE2_EV01_DOF�j
;to Start the timing function.
;When the timer ends �iBCF TMR_BASE2_STATUS,TMR_BASE2_EV01_OVER�jwill be set.
;-------------------------------------------------------      
#include "p16f1947.inc"
#include "TIME-OUT.inc"
PSECT tool, class=CODE, delta=2 
;------------------------------------------------------- 
;-------------------------------------------------------
;=======================================================
;===================TIMER2���_�j��======================
;======================================================= 
TIMER2_INT_FUNCTION:
    BCF     PIR1,TMR2IF
    MOVLW   TIMER2_DAT_BUF_ADRH
    MOVWF   FSR1H
    MOVLW   TIMER2_DAT_BUF_ADRL
    MOVWF   FSR1L
;----------------
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    TIMER2_INT_LV1
;----------------
    DECF    INDF1,F
    RETURN
TIMER2_INT_LV1:
    MOVLW   TMR2_BASE_NUM
    MOVWF   INDF1
    RETURN


;=======================================================
;================TIMER2��¦�ɶ��]�w=====================
;======================================================= 
SET_TMR2_BASE_TIME:
BANKSEL       T2CON
    MOVLW     TMR2_DIVIDER_SET
    MOVWF     T2CON  
    MOVLW     TMR2_BASE_SET
    MOVWF     PR2
;---------------------
    MOVLW     TIMER2_DAT_BUF_ADRH
    MOVWF     FSR1H
    MOVLW     TIMER2_DAT_BUF_ADRL
    MOVWF     FSR1L
    MOVLW     TMR2_BASE_NUM
    MOVWF     INDF1
BANKSEL       PORTA
    RETURN
;=======================================================
;===================TIMER2���_�]�w======================
;=======================================================
SET_TMR2_INT_EN:
BANKSEL       PIE1
   BSF        PIE1,TMR2IE
BANKSEL       PORTA
    RETURN
;=======================================================
;===================TIMER2�Ұ�==========================
;=======================================================
SET_TMR2_ON:
BANKSEL       T2CON
    BSF       T2CON,TMR2ON
BANKSEL       PORTA
    RETURN

