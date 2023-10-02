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
;** ***************************************************************************************
;*    Equa List
;* 
DELAY_TEMP1	    EQU	    0X20
DELAY_TEMP2	    EQU	    0X21
DELAY_TEMP3	    EQU	    0X22
PSECT DELAY,class=CODE, delta=2, size=0x0800
;** ***************************************************************************************
;*    Macro
;*
PAGESEL   0X0800
;**
;* @brief CODE_DELAY
;* @program-size 
;**
DELAY_3000ms:
   CALL   DELAY_1000ms
   CALL   DELAY_1000ms
DELAY_1000ms:
   CALL   DELAY_500ms
DELAY_500ms:
   CALL   DELAY_100ms
   CALL   DELAY_100ms
   CALL   DELAY_100ms
   CALL   DELAY_100ms
DELAY_100ms:
   CALL   DELAY_20ms
   CALL   DELAY_40ms
DELAY_40ms:
   CALL   DELAY_20ms
DELAY_20ms:
   CALL   DELAY_10ms
DELAY_10ms:
   CALL   DELAY_5ms
DELAY_5ms:
   CALL   DELAY_1ms
DELAY_4ms:
   CALL   DELAY_1ms
DELAY_3ms:
   CALL   DELAY_1ms
DELAY_2ms:
   CALL   DELAY_1ms
DELAY_1ms:
   MOVLW  0X31
   MOVWF  DELAY_TEMP1  ;49
   MOVWF  DELAY_TEMP2  ;49
   MOVLW  0X0A
   MOVWF  DELAY_TEMP3
   GOTO   DELAY_LOOP_1
DELAY_LOOP_1:
   NOP                   ;1
   DECFSZ DELAY_TEMP1,F  ;2
   GOTO   DELAY_LOOP_1   ;3,4 (0.5*4*49 = 98us)
   MOVF   DELAY_TEMP2,W  ;4
   MOVWF  DELAY_TEMP1    ;1
   DECFSZ DELAY_TEMP3,F  ;2
   GOTO   DELAY_LOOP_1   ;3,4 
   RETURN
;==========================================
DELAY_600us:
    CALL   DELAY_100us
DELAY_500us:
    CALL   DELAY_100us
DELAY_400us:
    CALL   DELAY_100us
DELAY_300us:
    CALL   DELAY_100us
DELAY_200us:
    CALL   DELAY_100us
DELAY_100us:
    CALL   DELAY_10us
DELAY_90us:
    CALL   DELAY_10us
    CALL   DELAY_10us
    CALL   DELAY_10us
DELAY_60us:
    CALL   DELAY_10us
DELAY_50us:
    CALL   DELAY_10us
DELAY_40us:
    CALL   DELAY_10us
DELAY_30us:
    CALL   DELAY_10us
DELAY_20us:
    CALL   DELAY_10us
DELAY_10us:
    NOP 
    NOP 
DELAY_9us:
    NOP 
    NOP 
DELAY_8us:
    NOP 
    NOP 
DELAY_7us:
    NOP 
    NOP 
DELAY_6us:
    NOP 
    NOP 
DELAY_5us:
    NOP 
    NOP 
DELAY_4us:
    NOP 
    NOP 
DELAY_3us:
    NOP 
    NOP
DELAY_2us: 
    RETURN



