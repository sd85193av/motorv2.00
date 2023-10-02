;========================================================
;================ Project Information ===================
;========================================================   
;Project Name   : TIMER2 BASE 
;-------------------------------------------------------        
;Project Version: 1.00   
;Edit Date      : 2023/04/18
;Function Info  :
;-------------------------------------------------------
;Description of Register Informatione (use FSR)

;TIMER2_DAT_BUF_ADRL+0    : TIMER byte count ( min = 1 ) 

;-------------------------------------------------------
;-------------------------------------------------------  
GLOBAL        SET_TMR2_BASE_TIME  
GLOBAL        SET_TMR2_INT_EN  
GLOBAL        SET_TMR2_ON  
GLOBAL        TIMER2_INT_FUNCTION
;-------------------------------------------------------       
;須被定義的部分
;-------------------------------------------------------
TIMER2_DAT_BUF_ADRH     EQU   0X20
TIMER2_DAT_BUF_ADRL     EQU   0X50
           


;-------------------------------------------------------
;暫存器ONLY NUM(TIMER BASE TIME IS 1mS)
TMR2_DIVIDER_SET        EQU   0X15
TMR2_BASE_SET           EQU   0XA7
TMR2_BASE_NUM           EQU   0X04

;-------------------------------------------------------