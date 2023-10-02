;** ***************************************************************************************
;*    File Name   :main.asm
;*    Create Date :
;*    Modufy Date :
;*    Auther      :
;*    Information :
;** ***************************************************************************************
;*    Include
;* 
#include  "config.inc"
#include  "p16f1947.inc"
#include  "delay.inc"
#include	"initialize-first.inc"
#include	"system_initialize.inc"
#include  "io_control.inc"

;#define GEN_TIME_TICK_LOW(num)    ((200 * num) - 100)	
;#define GEN_TIME_TICK_HIGH(num)   (GEN_TIME_TICK_LOW(num) >> 8)
;** ***************************************************************************************
;*    Label Main
;* 
psect  main, abs, class=CODE, delta=2
ORG 0X0000
MAIN:
    GOTO START
ORG 0X0004
PAGESEL 0X0000
    GOTO INTERRUPT_SUB_AREA
  


;* ****************************************************************************************
;*    Label Start
;* 

;=================================
;======上電後先執行的參數設定=====
;=================================
START:
    CALL    INITIALIZE_OSC
    CALL    INITIALIZE_INT
    CALL    INIT_BEFORE_IO
    CALL    INIT_BEFORE_ADC
    GOTO    BOOTLOADER_LOOP
;=================================
;========BOOTLOADER副程式=========
;=================================
BOOTLOADER_LOOP:
    GOTO    SYSTEM_START_SETTING
;========================================================
;================== 中斷副程式起始位址 ==================
;========================================================
INTERRUPT_SUB_AREA:
BANKSEL     PORTA
    BTFSC   PIR4,TX2IF
    GOTO    UART2_TX_INT_LOOP
;-------
    BTFSC   PIR3,TMR4IF
    GOTO    TIMER4_INT_LOOP
;;------
;    BTFSC   PIR1,RC1IF
;    GOTO    INT_UART1_LOOP
;;------
    BTFSC   INTCON,IOCIF
    GOTO    INTERRUPT_FUNCTION_LOOP
    BTFSC   PIR1,TMR1IF
    GOTO    TIMER1_INT_LOOP
    RETFIE
;=================================
;=======TIMER4中斷副程式==========
;=================================
;TIMER4 BASE IS NEAR 1ms
TIMER4_INT_LOOP:
    BCF     PIR3,TMR4IF
    MOVF    TIMER4_10MS_TEMP,W
    BTFSC   STATUS,Z
    CALL    TIMER4_10MS_RELOAD_LOOP
    DECF    TIMER4_10MS_TEMP,F
;-----------------------------
    MOVF    TIMER4_100MS_TEMP,W
    BTFSC   STATUS,Z
    CALL    TIMER4_100MS_RELOAD_LOOP
    DECF    TIMER4_100MS_TEMP,F
;-----------------------------------------------------
    MOVLW   0X01
    ADDWF   TIME_MFG_L_TEMP,F
    MOVLW   0X00
    ADDWFC  TIME_MFG_H_TEMP,F

;-------------------
    MOVLW   0X68
    SUBWF   TIME_MFG_L_TEMP,W
    MOVLW   0X01
    SUBWFB  TIME_MFG_H_TEMP,W
    BTFSS   STATUS,C
    RETFIE                                    ;W>F
;-----------------------------
;BSF PA,0X00
;BCF PA,0X00
    CLRF    TIME_MFG_L_TEMP
    CLRF    TIME_MFG_H_TEMP
    CLRF    OI_MFG_OK_COUNT
    BTFSC   FLAG3_BANK0,MFG_FAIL_DONE_F
    RETFIE
    INCF    OI_MFG_FAIL_COUNT,F
    MOVLW   0XFB
    ADDWF   OI_MFG_FAIL_COUNT,W
    BTFSS   STATUS,C
    RETFIE
;----------------------------------------
    BCF     FLAG3_BANK0,MFG_CAL_EN_F
    BCF     FLAG3_BANK0,MFG_OK_DONE_F
    BSF     FLAG3_BANK0,MFG_FAIL_DONE_F
    BCF     FLAG3_BANK0,OI_MODE_MFG_F
    BSF     FLAG1_BANK0,OI_HMI_F
    BCF     FLAG2_BANK0,OI_HIGH_DONE_F
    BCF     FLAG2_BANK0,OI_LOW_DONE_F
BSF FLAG3_BANK0,MFG_CLOSE_DONE_F
BCF FLAG3_BANK0,TYPE_OUTPUT_EN_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XE4
    MOVLW   0X34
    MOVWF   0XE5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
    RETFIE
;-----------------------------------------------------------------------
TIMER4_100MS_RELOAD_LOOP:                 ;100ms時間參數放回
    MOVLW   0X65
    MOVWF   TIMER4_100MS_TEMP
    BSF     FLAG0_BANK0,TIMER4_100ms_F
    RETURN
TIMER4_10MS_RELOAD_LOOP:                 ;10ms時間參數放回
    MOVLW   0X0A
    MOVWF   TIMER4_10MS_TEMP
    BSF     FLAG0_BANK0,TIMER4_10ms_F
    RETURN
;=================================
;=======TIMER1中斷副程式==========
;=================================
;TIMER1 BASE IS NEAR 20ms
TIMER1_INT_LOOP:
    BCF     PIR1,TMR1IF
BANKSEL     OSSD_IN_STATUS_TEMP
    MOVF    OSSD_IN_STATUS_TEMP,F
    BTFSS   STATUS,Z
    GOTO    OSSD_ERROR
    BSF     OSSD_IN_STATUS_TEMP,OSSD_IN_L1_F
    RETFIE
OSSD_ERROR:
BANKSEL     IOCBF
    BCF     IOCBF,IOCBF1
    BCF     IOCBF,IOCBF2
BANKSEL     PORTA
    BTFSC   FLAG2_BANK0,OSSD_FAIL_DONE_F                 ;當有執行過送OSSD FAIL給人機，之後不會再送
    GOTO    OSSD_ERROR_LEVEL1
    BSF     FLAG2_BANK0,OSSD_FAIL_DONE_F
    BCF     FLAG2_BANK0,OSSD_PASS_DONE_F
    BSF     FLAG1_BANK0,OSSD_HMI_F
BANKSEL     BANK1
    MOVLW   0X39
    MOVWF   0XB4
    MOVLW   0X39
    MOVWF   0XB5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
OSSD_ERROR_LEVEL1:
BANKSEL     PORTA
    CLRF    OSSD_IN_STATUS_TEMP
    BSF     OSSD_IN_STATUS_TEMP,OSSD_IN_L1_F
    CALL    SET_TMR1_MODULE_17800us_BASE
    BSF     SP_FLAG,OSSD_IN_ERR_F
BANKSEL     IOCBF
    BSF     IOCBN,0X01
    BSF     IOCBN,0X02
    BCF     IOCBP,0X01
    BCF     IOCBP,0X02
    RETFIE
;=================================
;========IOC中斷副程式============
;=================================
INTERRUPT_FUNCTION_LOOP:
    BCF     INTCON,IOCIF
BANKSEL     IOCBF
    BTFSC   IOCBF,IOCBF3
    GOTO    IOCBF3_INT_LOOP
BANKSEL     PORTA
;-------------------------------------------------
    BTFSC   OSSD_IN_STATUS_TEMP,OSSD_IN_L5_F
    GOTO    OSSD_IN_L5_EVENT
    BTFSC   OSSD_IN_STATUS_TEMP,OSSD_IN_L4_F
    GOTO    OSSD_IN_L4_EVENT
    BTFSC   OSSD_IN_STATUS_TEMP,OSSD_IN_L3_F
    GOTO    OSSD_IN_L3_EVENT
    BTFSC   OSSD_IN_STATUS_TEMP,OSSD_IN_L2_F
    GOTO    OSSD_IN_L2_EVENT
    BTFSC   OSSD_IN_STATUS_TEMP,OSSD_IN_L1_F
    GOTO    OSSD_IN_L1_EVENT
    GOTO    OSSD_ERROR
;-----------------
OSSD_IN_L1_EVENT:
;BSF PA,0X05
;BCF PA,0X05
BANKSEL     IOCBF
    BTFSS   IOCBF,IOCBF1  
    GOTO    OSSD_ERROR
    BCF     IOCBN,0X01
    BSF     IOCBP,0X01
    BCF     IOCBF,IOCBF1
BANKSEL     PORTA
    BCF     OSSD_IN_STATUS_TEMP,OSSD_IN_L1_F
    BSF     OSSD_IN_STATUS_TEMP,OSSD_IN_L2_F
    CALL    SET_TMR1_MODULE_600us_BASE
    RETFIE
;-----------------
OSSD_IN_L2_EVENT:
;BSF PA,0X05
;BCF PA,0X05
;BSF PA,0X05
;BCF PA,0X05
BANKSEL     IOCBF
    BTFSS   IOCBF,IOCBF1  
    GOTO    OSSD_ERROR
    BSF     IOCBN,0X01
    BCF     IOCBP,0X01
    BCF     IOCBF,IOCBF1
BANKSEL     PORTA
    BCF     OSSD_IN_STATUS_TEMP,OSSD_IN_L2_F
    BSF     OSSD_IN_STATUS_TEMP,OSSD_IN_L3_F
    CALL    SET_TMR1_MODULE_600us_BASE
    RETFIE   
;-----------------
OSSD_IN_L3_EVENT:
;BSF PA,0X05
;BCF PA,0X05
;BSF PA,0X05
;BCF PA,0X05
;BSF PA,0X05
;BCF PA,0X05
BANKSEL     IOCBF
    BTFSS   IOCBF,IOCBF2  
    GOTO    OSSD_ERROR
    BCF     IOCBN,0X02
    BSF     IOCBP,0X02
    BCF     IOCBF,IOCBF2
BANKSEL     PORTA
    BCF     OSSD_IN_STATUS_TEMP,OSSD_IN_L3_F
    BSF     OSSD_IN_STATUS_TEMP,OSSD_IN_L4_F
    CALL    SET_TMR1_MODULE_600us_BASE
    RETFIE
;-----------------
OSSD_IN_L4_EVENT:
;BSF PA,0X05
;BCF PA,0X05
;BSF PA,0X05
;BCF PA,0X05
;BSF PA,0X05
;BCF PA,0X05
;BSF PA,0X05
;BCF PA,0X05
BANKSEL     IOCBF
    BTFSS   IOCBF,IOCBF2
    GOTO    OSSD_ERROR
    BSF     IOCBN,0X02
    BCF     IOCBP,0X02
    BCF     IOCBF,IOCBF2
BANKSEL     PORTA
    BCF     OSSD_IN_STATUS_TEMP,OSSD_IN_L4_F
    BSF     OSSD_IN_STATUS_TEMP,OSSD_IN_L5_F
    CALL    SET_TMR1_MODULE_17800us_BASE
    CLRF    OSSD_IN_STATUS_TEMP
    BCF     SP_FLAG,OSSD_IN_ERR_F
;---------------------------------------------OSSD PASS
    BTFSC   FLAG2_BANK0,OSSD_PASS_DONE_F
    RETFIE
    BCF     FLAG2_BANK0,OSSD_FAIL_DONE_F
    BSF     FLAG2_BANK0,OSSD_PASS_DONE_F
    BSF     FLAG1_BANK0,OSSD_HMI_F
BANKSEL     BANK1
    MOVLW   0X39
    MOVWF   0XB4
    MOVLW   0X31
    MOVWF   0XB5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
    RETFIE
OSSD_IN_L5_EVENT:   
    GOTO    OSSD_ERROR
    RETFIE
;-------------------------------------------------------------------
;=================================
;=======IOC3中斷副程式============
;=================================
IOCBF3_INT_LOOP:
    BCF     IOCBF,IOCBF3
BANKSEL     PORTA
    BTFSC   FLAG3_BANK0,OI_MFG_LV1_F
    GOTO    IOCBF3_INT_LV1_LOOP
;------------
    BSF     FLAG3_BANK0,OI_MFG_LV1_F
    CLRF    TIME_MFG_H_TEMP
    CLRF    TIME_MFG_L_TEMP
;------------
BANKSEL     IOCBP
    BSF     IOCBP,0X03
    BCF     IOCBN,0X03
    RETFIE
IOCBF3_INT_LV1_LOOP:
    BCF     FLAG3_BANK0,OI_MFG_LV1_F
    MOVF    TIME_MFG_H_TEMP,W
    MOVWF   MFG_H_COUNTER
    MOVF    TIME_MFG_L_TEMP,W
    MOVWF   MFG_L_COUNTER

;MOVF MFG_H_COUNTER,W
;MOVWF 0X79
;CALL AAAAAA
;MOVF MFG_L_COUNTER,W
;MOVWF 0X79
;CALL AAAAAA


BANKSEL     IOCBP
    BCF     IOCBP,0X03
    BSF     IOCBN,0X03
BANKSEL     PORTA
    CLRF    OI_MFG_FAIL_COUNT
;---------------------------------
    BTFSC   FLAG3_BANK0,MFG_OK_DONE_F
    GOTO    IOCBF3_INT_LV2_LOOP
    INCF    OI_MFG_OK_COUNT,F
    MOVLW   0XFB
    ADDWF   OI_MFG_OK_COUNT,W
    BTFSS   STATUS,C
    RETFIE
;------------
;BSF PA,0X00
;BCF PA,0X00
;BSF PA,0X00
;BCF PA,0X00
;BSF PA,0X00
;BCF PA,0X00
    CLRF    OI_MFG_OK_COUNT
    BSF     FLAG3_BANK0,MFG_CAL_EN_F
    BSF     FLAG3_BANK0,MFG_OK_DONE_F
    BCF     FLAG3_BANK0,MFG_FAIL_DONE_F
    BSF     FLAG3_BANK0,OI_MODE_MFG_F
    BSF     FLAG1_BANK0,OI_HMI_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XE4
    MOVLW   0X33
    MOVWF   0XE5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
    RETFIE
;=================================
;=======目前已經在MFG模式下=======
;=================================
IOCBF3_INT_LV2_LOOP:
    BSF     FLAG3_BANK0,MFG_CAL_EN_F
    RETFIE





;=================================
;=======UART2 TX中斷副程式========
;=================================
UART2_TX_INT_LOOP:
;當傳送完資料後要關閉TX的EN
    BCF     PIR4,TX2IF 
    BTFSC   FLAG0_BANK0,UART2_HMI_BUSY_F
    GOTO    TABLE_UART2_HMI_INT
;-------------
    BTFSC   FLAG1_BANK0,ADC_HMI_F
    GOTO    BEFORE_HMI_ADC_LOOP
;-------------
    BTFSC   FLAG1_BANK0,OSSD_HMI_F
    GOTO    BEFORE_HMI_OSSD_LOOP
;-------------
    BTFSC   FLAG1_BANK0,OT_HMI_F
    GOTO    BEFORE_HMI_OT_LOOP
;-------------
    BTFSC   FLAG1_BANK0,OL_HMI_F
    GOTO    BEFORE_HMI_OL_LOOP
;-------------
    BTFSC   FLAG1_BANK0,OI_HMI_F
    GOTO    BEFORE_HMI_OI_LOOP
;-------------
    BTFSC   FLAG1_BANK0,OI_MFG_HMI_F
    GOTO    BEFORE_HMI_OI_MFG_LOOP
;-------------
    BTFSC   FLAG1_BANK0,TYPE_HMI_F
    GOTO    BEFORE_HMI_TYPE_LOOP

;---------------------------------------
BANKSEL     TX2STA
    BTFSS   TX2STA,TRMT
    RETFIE
    BCF     TX2STA,TXEN
BANKSEL     PORTA
BCF FLAG3_BANK0,MFG_CLOSE_DONE_F
    RETFIE
BEFORE_HMI_ADC_LOOP:
    BSF     FLAG0_BANK0,UART2_HMI_BUSY_F
    MOVLW   0X00
    MOVWF   HMI_COUNTER_TABLE
    MOVLW   0X0A 
    MOVWF   HMI_COUNT_TEMP
    GOTO    TABLE_UART2_HMI_INT
;----------------------
BEFORE_HMI_OSSD_LOOP:
    BSF     FLAG0_BANK0,UART2_HMI_BUSY_F
    MOVLW   0X01
    MOVWF   HMI_COUNTER_TABLE
    MOVLW   0X08
    MOVWF   HMI_COUNT_TEMP
    GOTO    TABLE_UART2_HMI_INT
;----------------------
BEFORE_HMI_OT_LOOP:
    BSF     FLAG0_BANK0,UART2_HMI_BUSY_F
    MOVLW   0X02
    MOVWF   HMI_COUNTER_TABLE
    MOVLW   0X08
    MOVWF   HMI_COUNT_TEMP
    GOTO    TABLE_UART2_HMI_INT
;----------------------
BEFORE_HMI_OL_LOOP:
    BSF     FLAG0_BANK0,UART2_HMI_BUSY_F
    MOVLW   0X03
    MOVWF   HMI_COUNTER_TABLE
    MOVLW   0X08
    MOVWF   HMI_COUNT_TEMP
    GOTO    TABLE_UART2_HMI_INT
;----------------------
BEFORE_HMI_OI_LOOP:
    BSF     FLAG0_BANK0,UART2_HMI_BUSY_F
    MOVLW   0X04
    MOVWF   HMI_COUNTER_TABLE
    MOVLW   0X08
    MOVWF   HMI_COUNT_TEMP
    GOTO    TABLE_UART2_HMI_INT
;----------------------
BEFORE_HMI_OI_MFG_LOOP:
    BSF     FLAG0_BANK0,UART2_HMI_BUSY_F
    MOVLW   0X05
    MOVWF   HMI_COUNTER_TABLE
    MOVLW   0X08
    MOVWF   HMI_COUNT_TEMP
    GOTO    TABLE_UART2_HMI_INT
;----------------------
BEFORE_HMI_TYPE_LOOP:
    BSF     FLAG0_BANK0,UART2_HMI_BUSY_F
    MOVLW   0X06
    MOVWF   HMI_COUNTER_TABLE
    MOVLW   0X08
    MOVWF   HMI_COUNT_TEMP
    GOTO    TABLE_UART2_HMI_INT
;----------------------




;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
ORG         0X0200
TABLE_UART2_HMI_INT:
    MOVLW   0X02
    MOVWF   PCLATH
    MOVF    HMI_COUNTER_TABLE,W
    BRW 
    GOTO    UART2_HMI_ADC_LOOP              ;0
    GOTO    UART2_HMI_OSSD_LOOP             ;1
    GOTO    UART2_HMI_OT_LOOP               ;2
    GOTO    UART2_HMI_OL_LOOP               ;3
    GOTO    UART2_HMI_OI_LOOP               ;4
    GOTO    UART2_HMI_OI_MFG_LOOP           ;5
    GOTO    UART2_HMI_TYPE_LOOP             ;6
;---------------------------------------------------------------
TABLE_REGULAR_HI:
    MOVLW   0X02					
    MOVWF   PCLATH					
    MOVF    DEC_TABLE_TEMP,W			
    BRW					
    RETLW 	0X03
    RETLW   0X00
    RETLW   0X00
    RETLW   0X00
	;--------------------------------
TABLE_REGULAR_LO:
    MOVLW   0X02					
    MOVWF   PCLATH					
    MOVF    DEC_TABLE_TEMP,W			
    BRW					
    RETLW 	0XE8
    RETLW   0X64
    RETLW   0X0A
;=================================
;========主程序前參數設定=========
;=================================
SYSTEM_START_SETTING:	
CALL DELAY_100ms
    CALL    INIT_AFTER_IO
    CALL    INIT_AFTER_COMPARE
;----  
    CALL    CLEAN_ALL_REGISTER
    CALL    INIT_UART1_SETTING              ;19200
    CALL    INIT_UART2_SETTING              ;19200
    CALL    INIT_TIMER4_SETTING             ;1ms
  

    CALL    SET_TMR1_MODULE
    CALL    SET_TMR1_MODULE_600us_BASE
    CALL    SET_TMR1_INT_EN                 ;OSSD INPUT 
    CALL    SET_TMR1_MODULE_ON              ;OSSD TIME_OUT 計時器
BANKSEL     IOCBP
    MOVLW   0X0E                            ;RB1 RB2 RB3  負源觸發
    MOVWF   IOCBN
    CLRF    IOCBP
BANKSEL     PORTA

BANKSEL     TX2STA
    BCF     TX2STA,TXEN
BANKSEL     PIE4
    BSF     PIE4,TX2IE
BANKSEL     PIR4
    BCF     PIR4,TX2IF
BANKSEL     PORTA
;--------
    CALL    INIT_ADC_SETTING
SYSTEM_START_SETTING1:
    CALL    PREPARE_HMI_BEFORE_DATA_LOOP
    BCF     FLAG3_BANK0,ADC_UB_IMP_EN_F
    CLRF    FLAG2_BANK0
    MOVLW   0X0B
    MOVWF   HMI_COUNT_TEMP
    MOVLW   0X64
    MOVWF   TIMER4_100MS_TEMP
    MOVLW   0X0A
    MOVWF   TIMER4_10MS_TEMP
    MOVLW   0XC8
    MOVWF   INTCON
;=================================
;========主程序SYSTEM_START=======
;=================================
SYSTEM_START:
BANKSEL     PORTA
    BTFSC   FLAG0_BANK0,TIMER4_100ms_F
    CALL    TIME_100MS_BASE_LOOP
BANKSEL     PORTA
    BTFSC   FLAG0_BANK0,TIMER4_10ms_F
    CALL    TIME_10MS_BASE_LOOP
BANKSEL     PORTA
    BTFSC   FLAG3_BANK0,MFG_CAL_EN_F
    CALL    MFG_WORKING_LOOP
    GOTO    SYSTEM_START
;=================================
;========MFG輸出解碼動作==========
;=================================
MFG_WORKING_LOOP:
    BCF     FLAG3_BANK0,MFG_CAL_EN_F
    CALL    JUDGMENT_OI_STATUS_LOOP
    RETURN
;=================================
;========主程序10ms動作==========
;=================================
;主要判斷OT OL OI
TIME_10MS_BASE_LOOP:
    BCF     FLAG0_BANK0,TIMER4_10ms_F
    BTFSC   PORTD,0X00
    GOTO    OT_STATUS_IS_HI_LOOP
OT_STATUS_IS_LO_LOOP:
    BTFSC   FLAG2_BANK0,OT_LOW_DONE_F
    GOTO    TIME_10MS_BASE_LV1_LOOP
    BCF     FLAG2_BANK0,OT_HIGH_DONE_F
    BSF     FLAG2_BANK0,OT_LOW_DONE_F
    BSF     FLAG1_BANK0,OT_HMI_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XC4
    MOVLW   0X32
    MOVWF   0XC5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
BANKSEL     PORTA
    RETURN
OT_STATUS_IS_HI_LOOP:
    BTFSC   FLAG2_BANK0,OT_HIGH_DONE_F
    GOTO    TIME_10MS_BASE_LV1_LOOP
    BSF     FLAG2_BANK0,OT_HIGH_DONE_F
    BCF     FLAG2_BANK0,OT_LOW_DONE_F
    BSF     FLAG1_BANK0,OT_HMI_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XC4
    MOVLW   0X31
    MOVWF   0XC5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
BANKSEL     PORTA
    RETURN
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
TIME_10MS_BASE_LV1_LOOP:
    BTFSC   PORTD,0X01
    GOTO    OL_STATUS_IS_HI_LOOP
OL_STATUS_IS_LO_LOOP:
    BTFSC   FLAG2_BANK0,OL_LOW_DONE_F
    GOTO    TIME_10MS_BASE_LV2_LOOP
    BCF     FLAG2_BANK0,OL_HIGH_DONE_F
    BSF     FLAG2_BANK0,OL_LOW_DONE_F
    BSF     FLAG1_BANK0,OL_HMI_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XD4
    MOVLW   0X32
    MOVWF   0XD5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
BANKSEL     PORTA
    RETURN
OL_STATUS_IS_HI_LOOP:
    BTFSC   FLAG2_BANK0,OL_HIGH_DONE_F
    GOTO    TIME_10MS_BASE_LV2_LOOP

    BSF     FLAG2_BANK0,OL_HIGH_DONE_F
    BCF     FLAG2_BANK0,OL_LOW_DONE_F
    BSF     FLAG1_BANK0,OL_HMI_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XD4
    MOVLW   0X31
    MOVWF   0XD5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
BANKSEL     PORTA
    RETURN
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
TIME_10MS_BASE_LV2_LOOP:
    BTFSC   FLAG3_BANK0,MFG_OK_DONE_F
    RETURN
BTFSC  FLAG3_BANK0,MFG_CLOSE_DONE_F
RETURN
    BTFSC   PORTB,0X03
    GOTO    OI_STATUS_IS_HI_LOOP
OI_STATUS_IS_LO_LOOP:
    BTFSC   FLAG2_BANK0,OI_LOW_DONE_F
    RETURN
    BCF     FLAG2_BANK0,OI_HIGH_DONE_F
    BSF     FLAG2_BANK0,OI_LOW_DONE_F
    BSF     FLAG1_BANK0,OI_HMI_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XE4
    MOVLW   0X32
    MOVWF   0XE5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
BANKSEL     PORTA
    RETURN
OI_STATUS_IS_HI_LOOP:
    BTFSC   FLAG2_BANK0,OI_HIGH_DONE_F
    RETURN
    BSF     FLAG2_BANK0,OI_HIGH_DONE_F
    BCF     FLAG2_BANK0,OI_LOW_DONE_F
    BSF     FLAG1_BANK0,OI_HMI_F
BANKSEL     BANK1
    MOVLW   0X37
    MOVWF   0XE4
    MOVLW   0X31
    MOVWF   0XE5
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
BANKSEL     PORTA
    RETURN





;=================================
;========主程序100ms動作==========
;=================================
;主要取ADC數值平均
TIME_100MS_BASE_LOOP:
    BCF     FLAG0_BANK0,TIMER4_100ms_F
BANKSEL     ADCON0
    BTFSC   ADCON0,0X01
    RETURN
BANKSEL     PORTA
    BTFSC   FLAG3_BANK0,ADC_UB_IMP_EN_F
    GOTO    IMP_ADC_WORK_LOOP
UB_ADC_WORK_LOOP:
BANKSEL     ADRESH
    MOVF    ADRESH,W
    MOVWF   BASEMENT_H_TEMP
    MOVF    ADRESL,W
    MOVWF   BASEMENT_L_TEMP
BANKSEL     PORTA
    MOVF    BASEMENT_L_TEMP,W
    ADDWF   ADC_AV_L_TEMP,F
    MOVF    BASEMENT_H_TEMP,W
    ADDWFC  ADC_AV_H_TEMP,F
;----------
    MOVLW   0XFD
    ADDWF   ADC_AVERAGE_COUNT,W
    BTFSC   STATUS,C
    GOTO    UB_ADC_WORK_LV1_LOOP
;----------
    INCF    ADC_AVERAGE_COUNT,F
    RETURN
UB_ADC_WORK_LV1_LOOP:
    BCF     STATUS,C
    RRF     ADC_AV_H_TEMP,F
    RRF     ADC_AV_L_TEMP,F    
    BCF     STATUS,C
    RRF     ADC_AV_H_TEMP,F
    RRF     ADC_AV_L_TEMP,F
;---------------------------              /4
    MOVF    ADC_AV_L_TEMP,W
    MOVWF   DEVIDEND_L_TEMP
    MOVF    ADC_AV_H_TEMP,W
    MOVWF   DEVIDEND_H_TEMP
    CALL    HEX_TO_DEC_4BYTE_LOOP
;---------------------------
    CLRF    ADC_AV_H_TEMP
    CLRF    ADC_AV_L_TEMP
    CLRF    ADC_AVERAGE_COUNT
    BSF     FLAG3_BANK0,ADC_UB_IMP_EN_F
    BSF     FLAG1_BANK0,ADC_HMI_F
BANKSEL     BANK1
    MOVLW   0X55
    MOVWF   0XA0
;------
    MOVLW   0X55
    MOVWF   0XA1
;------
    MOVLW   0X42
    MOVWF   0XA2
;----------------------------------------UUB
    MOVF    DEC_THAND_TEMP,W
    MOVWF   0XA4
MOVLW 0X30
ADDWF 0XA4,F
;--------
    MOVF    DEC_HUNDR_TEMP,W
    MOVWF   0XA5
MOVLW 0X30
ADDWF 0XA5,F
;--------
    MOVF    DEC_TEN_TEMP,W
    MOVWF   0XA6
MOVLW 0X30
ADDWF 0XA6,F
;--------
    MOVF    DEC_UNIT_TEMP,W
    MOVWF   0XA7
MOVLW 0X30
ADDWF 0XA7,F
;--------
BANKSEL     ADCON0
    MOVLW		0X19      ;AN6
    MOVWF		ADCON0
    BSF			ADCON0,0X01
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
    RETURN
;------------------------------------------------------------------
IMP_ADC_WORK_LOOP:
BANKSEL     ADRESH
    MOVF    ADRESH,W
    MOVWF   BASEMENT_H_TEMP
    MOVF    ADRESL,W
    MOVWF   BASEMENT_L_TEMP
BANKSEL     PORTA
    MOVF    BASEMENT_L_TEMP,W
    ADDWF   ADC_AV_L_TEMP,F
    MOVF    BASEMENT_H_TEMP,W
    ADDWFC  ADC_AV_H_TEMP,F
    MOVLW   0XFD
    ADDWF   ADC_AVERAGE_COUNT,W
    BTFSC   STATUS,C
    GOTO    IMP_ADC_WORK_LV1_LOOP
;----------
    INCF    ADC_AVERAGE_COUNT,F
    RETURN
IMP_ADC_WORK_LV1_LOOP:
    BCF     STATUS,C
    RRF     ADC_AV_H_TEMP,F
    RRF     ADC_AV_L_TEMP,F                   
    RRF     ADC_AV_H_TEMP,F
    RRF     ADC_AV_L_TEMP,F
;---------------------------              /4
    MOVF    ADC_AV_L_TEMP,W
    MOVWF   DEVIDEND_L_TEMP
    MOVF    ADC_AV_H_TEMP,W
    MOVWF   DEVIDEND_H_TEMP
    CALL    HEX_TO_DEC_4BYTE_LOOP
;---------------------------
    CLRF    ADC_AV_H_TEMP
    CLRF    ADC_AV_L_TEMP
    CLRF    ADC_AVERAGE_COUNT
    BCF     FLAG3_BANK0,ADC_UB_IMP_EN_F
    BSF     FLAG1_BANK0,ADC_HMI_F
BANKSEL     BANK1
    MOVLW   0X49
    MOVWF   0XA0
;------
    MOVLW   0X4D
    MOVWF   0XA1
;------
    MOVLW   0X50
    MOVWF   0XA2
;----------------------------------------IMP
    MOVF    DEC_THAND_TEMP,W
    MOVWF   0XA4
MOVLW 0X30
ADDWF 0XA4,F
;--------
    MOVF    DEC_HUNDR_TEMP,W
    MOVWF   0XA5
MOVLW 0X30
ADDWF 0XA5,F
;--------
    MOVF    DEC_TEN_TEMP,W
    MOVWF   0XA6
MOVLW 0X30
ADDWF 0XA6,F
;--------
    MOVF    DEC_UNIT_TEMP,W
    MOVWF   0XA7
MOVLW 0X30
ADDWF 0XA7,F
;--------
BANKSEL     ADCON0
    MOVLW		0X41      ;AN6
    MOVWF		ADCON0
    BSF			ADCON0,0X01
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
    RETURN

;=================================
;========16進制轉10進制副程式=====OK
;=================================
HEX_TO_DEC_4BYTE_LOOP:
    CLRF    DEC_THAND_TEMP
    CLRF    DEC_HUNDR_TEMP
    CLRF    DEC_TEN_TEMP
    CLRF    DEC_UNIT_TEMP
    CLRF    FSR0H
    MOVLW   DEC_THAND_TEMP
    MOVWF   FSR0L
    CLRF    DEC_TABLE_TEMP
    CALL    TABLE_REGULAR_HI
    MOVWF   OPRATION_H_TEMP
    CALL    TABLE_REGULAR_LO
    MOVWF   OPRATION_L_TEMP
;------------------------------
 HEX_TO_DEC_LEVEL1:
    MOVF    OPRATION_L_TEMP,W
    SUBWF   DEVIDEND_L_TEMP,W
    MOVF    OPRATION_H_TEMP,W
    SUBWFB  DEVIDEND_H_TEMP,W
    BTFSS   STATUS,C
    GOTO    HEX_TO_DEC_PREPARE_LEVEL       ;W>F
;-------------------
    MOVF    OPRATION_L_TEMP,W
    SUBWF   DEVIDEND_L_TEMP,F
    MOVF    OPRATION_H_TEMP,W
    SUBWFB  DEVIDEND_H_TEMP,F
    INCF    INDF0,F
    GOTO    HEX_TO_DEC_LEVEL1
HEX_TO_DEC_PREPARE_LEVEL:
    INCF    FSR0L,F
    MOVLW   0XFE
    ADDWF   DEC_TABLE_TEMP,W
    BTFSC   STATUS,C
    GOTO    HEX_TO_DEC_END_LOOP
    INCF    DEC_TABLE_TEMP,F
    CALL    TABLE_REGULAR_HI
    MOVWF   OPRATION_H_TEMP
    CALL    TABLE_REGULAR_LO
    MOVWF   OPRATION_L_TEMP
    GOTO    HEX_TO_DEC_LEVEL1
HEX_TO_DEC_END_LOOP:
    MOVF    DEVIDEND_L_TEMP,W
    MOVWF   INDF0
    RETURN

;**********************************************************
;**********************************************************
;=================================
;========傳送資料給HMI_ADC========
;=================================
UART2_HMI_ADC_LOOP:

    MOVLW   ADC_HMI_DATA_H
    MOVWF   FSR1H
    MOVLW   ADC_HMI_DATA_L
    MOVWF   FSR1L
    MOVF    HMI_FSR_TEMP,W
    ADDWF   FSR1L,F
;------------------
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    MOVF    HMI_COUNT_TEMP,W
    BTFSS   STATUS,Z
    GOTO    PREPARE_NEXT_HMI_ADC_LOOP
;------------------------
    BCF     FLAG1_BANK0,ADC_HMI_F
    BCF     FLAG0_BANK0,UART2_HMI_BUSY_F
    CLRF    HMI_FSR_TEMP
    RETFIE
;=================================
;========準備下一次給HMI_ADC======
;=================================
PREPARE_NEXT_HMI_ADC_LOOP:
    DECF    HMI_COUNT_TEMP,F
    INCF    HMI_FSR_TEMP,F
    RETFIE
;=================================
;========傳送資料給HMI_OSSD=======
;=================================
UART2_HMI_OSSD_LOOP:
;BSF PA,0X02
;BCF PA,0X02
    MOVLW   OSSD_HMI_DATA_H
    MOVWF   FSR1H
    MOVLW   OSSD_HMI_DATA_L
    MOVWF   FSR1L
    MOVF    HMI_FSR_TEMP,W
    ADDWF   FSR1L,F
;------------------
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    MOVF    HMI_COUNT_TEMP,W
    BTFSS   STATUS,Z
    GOTO    PREPARE_NEXT_HMI_OSSD_LOOP
;------------------------
    BCF     FLAG1_BANK0,OSSD_HMI_F
    BCF     FLAG0_BANK0,UART2_HMI_BUSY_F
    CLRF    HMI_FSR_TEMP
    RETFIE
;=================================
;========準備下一次給HMI_OSSD=====
;=================================
PREPARE_NEXT_HMI_OSSD_LOOP:
    DECF    HMI_COUNT_TEMP,F
    INCF    HMI_FSR_TEMP,F
    RETFIE
;=================================
;========傳送資料給HMI_OT=======
;=================================
UART2_HMI_OT_LOOP:
    MOVLW   OT_HMI_DATA_H
    MOVWF   FSR1H
    MOVLW   OT_HMI_DATA_L
    MOVWF   FSR1L
    MOVF    HMI_FSR_TEMP,W
    ADDWF   FSR1L,F
;------------------
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    MOVF    HMI_COUNT_TEMP,W
    BTFSS   STATUS,Z
    GOTO    PREPARE_NEXT_HMI_OT_LOOP
;------------------------
    BCF     FLAG1_BANK0,OT_HMI_F
    BCF     FLAG0_BANK0,UART2_HMI_BUSY_F
    CLRF    HMI_FSR_TEMP
    RETFIE
;=================================
;========準備下一次給HMI_OT=====
;=================================
PREPARE_NEXT_HMI_OT_LOOP:
    DECF    HMI_COUNT_TEMP,F
    INCF    HMI_FSR_TEMP,F
    RETFIE

;=================================
;========傳送資料給HMI_OL=======
;=================================
UART2_HMI_OL_LOOP:
    MOVLW   OL_HMI_DATA_H
    MOVWF   FSR1H
    MOVLW   OL_HMI_DATA_L
    MOVWF   FSR1L
    MOVF    HMI_FSR_TEMP,W
    ADDWF   FSR1L,F
;------------------
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    MOVF    HMI_COUNT_TEMP,W
    BTFSS   STATUS,Z
    GOTO    PREPARE_NEXT_HMI_OL_LOOP
;------------------------
    BCF     FLAG1_BANK0,OL_HMI_F
    BCF     FLAG0_BANK0,UART2_HMI_BUSY_F
    CLRF    HMI_FSR_TEMP
    RETFIE
;=================================
;========準備下一次給HMI_OL=====
;=================================
PREPARE_NEXT_HMI_OL_LOOP:
    DECF    HMI_COUNT_TEMP,F
    INCF    HMI_FSR_TEMP,F
    RETFIE
;=================================
;========傳送資料給HMI_OI=========
;=================================
UART2_HMI_OI_LOOP:
    MOVLW   OI_HMI_DATA_H
    MOVWF   FSR1H
    MOVLW   OI_HMI_DATA_L
    MOVWF   FSR1L
    MOVF    HMI_FSR_TEMP,W
    ADDWF   FSR1L,F
;------------------
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    MOVF    HMI_COUNT_TEMP,W
    BTFSS   STATUS,Z
    GOTO    PREPARE_NEXT_HMI_OI_LOOP
;------------------------
    BCF     FLAG1_BANK0,OI_HMI_F
    BCF     FLAG0_BANK0,UART2_HMI_BUSY_F
    CLRF    HMI_FSR_TEMP
    RETFIE
;=================================
;========準備下一次給HMI_OI=====
;=================================
PREPARE_NEXT_HMI_OI_LOOP:
    DECF    HMI_COUNT_TEMP,F
    INCF    HMI_FSR_TEMP,F
    RETFIE
;=================================
;========傳送資料給HMI_OI_MFG=========
;=================================
UART2_HMI_OI_MFG_LOOP:
    MOVLW   MFG_HMI_DATA_H
    MOVWF   FSR1H
    MOVLW   MFG_HMI_DATA_L
    MOVWF   FSR1L
    MOVF    HMI_FSR_TEMP,W
    ADDWF   FSR1L,F
;------------------
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    MOVF    HMI_COUNT_TEMP,W
    BTFSS   STATUS,Z
    GOTO    PREPARE_NEXT_HMI_OI_MFG_LOOP
;------------------------
    BCF     FLAG1_BANK0,OI_MFG_HMI_F
    BCF     FLAG0_BANK0,UART2_HMI_BUSY_F
    CLRF    HMI_FSR_TEMP
    RETFIE
;=================================
;========準備下一次給HMI_OI_MFG=====
;=================================
PREPARE_NEXT_HMI_OI_MFG_LOOP:
    DECF    HMI_COUNT_TEMP,F
    INCF    HMI_FSR_TEMP,F
    RETFIE






;=================================
;========傳送資料給HMI_TYPE=======
;=================================
UART2_HMI_TYPE_LOOP:
    MOVLW   TYPE_HMI_DATA_H
    MOVWF   FSR1H
    MOVLW   TYPE_HMI_DATA_L
    MOVWF   FSR1L
    MOVF    HMI_FSR_TEMP,W
    ADDWF   FSR1L,F
;------------------
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    MOVF    HMI_COUNT_TEMP,W
    BTFSS   STATUS,Z
    GOTO    PREPARE_NEXT_HMI_TYPE_LOOP
;------------------------
    BCF     FLAG1_BANK0,TYPE_HMI_F
    BCF     FLAG0_BANK0,UART2_HMI_BUSY_F
    CLRF    HMI_FSR_TEMP
    RETFIE
;=================================
;========準備下一次給HMI_TYPE=====
;=================================
PREPARE_NEXT_HMI_TYPE_LOOP:
    DECF    HMI_COUNT_TEMP,F
    INCF    HMI_FSR_TEMP,F
    RETFIE













;**********************************************************

;
;-------------------------------------------------------
;-------------------------------------------------------
SET_TMR1_MODULE:
BANKSEL    T1CON
   MOVLW   0X34
   MOVWF   T1CON   
BANKSEL    T1GCON
   CLRF    T1GCON
   RETURN
;---------------------------------
SET_TMR1_MODULE_600us_BASE:
BANKSEL    TMR1H   
   MOVLW   0X00
   MOVWF   TMR1H  ;0258:600*1us
   MOVLW   0X95
   MOVWF   TMR1L
   COMF    TMR1H,F
   COMF    TMR1L,F
BANKSEL    PORTA
   RETURN
;---------------------------------
SET_TMR1_MODULE_17800us_BASE:
BANKSEL    TMR1H   
   MOVLW   0X11
   MOVWF   TMR1H  ;4588:17800*1us
   MOVLW   0X62 
   MOVWF   TMR1L
   COMF    TMR1H,F
   COMF    TMR1L,F
   RETURN
;---------------------------------
SET_TMR1_MODULE_ON:
BANKSEL    T1CON
   BSF     T1CON,TMR1ON
BANKSEL    PORTA
   RETURN
;---------------------------------
SET_TMR1_MODULE_OFF:
BANKSEL    T1CON
   BCF     T1CON,TMR1ON
BANKSEL    PORTA
   RETURN
;---------------------------------

SET_TMR1_INT_EN:
BANKSEL    PIE1
   BSF     PIE1,TMR1IE
BANKSEL    PORTA
   RETURN
;---------------------------------
SET_TMR1_INT_DIS:
BANKSEL    PIE1
   BCF     PIE1,TMR1IE
BANKSEL    PORTA
   RETURN                
;--------------------------------
;=================================
;=====OI當前模式為MFG要判斷訊號===
;=================================
JUDGMENT_OI_STATUS_LOOP:
    CLRF    COMPARE_TABLE_TEMP
;---------------------------------------------
;----------------------------------------------
JUDGMENT_MFG_LV1:
    MOVLW   0XFF
    ADDWF   MFG_H_COUNTER,W
    BTFSC   STATUS,C
    GOTO    JUDGMENT_MFG_DECTEN
    MOVLW   0XF4
;MOVLW 0XF6  
    ADDWF   MFG_L_COUNTER,W
    BTFSC   STATUS,C
    GOTO    JUDGMENT_MFG_DECTEN
;;;----------------------------------------
INCF COMPARE_TABLE_TEMP,F
MOVLW 0XE6
ADDWF COMPARE_TABLE_TEMP,W
BTFSC STATUS,C
CALL  MAX_COMPARE_IS_26
;----------------------------------------------------------
    CLRF    MFG_H_COUNTER
    CLRF    MFG_L_COUNTER
    CALL    EASY_HEX_TO_DEC
    BSF     FLAG1_BANK0,OI_MFG_HMI_F
BANKSEL     BANK0
    MOVF    HEX_TEN_TEMP,W
BANKSEL     BANK2
    MOVWF   0X24
MOVLW 0X30
ADDWF 0X24,F
BANKSEL     BANK0
    MOVF    HEX_UNIT_TEMP,W
BANKSEL     BANK2
    MOVWF   0X25
MOVLW 0X30
ADDWF 0X25,F
BANKSEL     TX2STA
    BSF     TX2STA,TXEN
BANKSEL     PORTA
;-------------------------------------
    BTFSC   FLAG3_BANK0,TYPE_OUTPUT_EN_F
    RETURN
    BSF     FLAG3_BANK0,TYPE_OUTPUT_EN_F
    BSF     FLAG1_BANK0,TYPE_HMI_F
BANKSEL     BANK2
    MOVF    0X24,W
    MOVWF   0X34
    MOVLW   0X03
    ADDWF   0X34,F
    MOVF    0X25,W
    MOVWF   0X35
BANKSEL     PORTA
    RETURN
;--------------------------------------------------------------

MAX_COMPARE_IS_26:
    MOVLW   0X1A
    MOVWF   COMPARE_TABLE_TEMP
    RETURN
JUDGMENT_MFG_DECTEN:
    MOVLW   0X0A
    SUBWF   MFG_L_COUNTER,F
    MOVLW   0X00
    SUBWFB  MFG_H_COUNTER,F
    INCF    COMPARE_TABLE_TEMP,F
    GOTO    JUDGMENT_MFG_LV1








;=================================
;=====簡易版的HEX轉DEC============
;=================================
EASY_HEX_TO_DEC:
    CLRF    HEX_TEN_TEMP
    CLRF    HEX_UNIT_TEMP
EASY_HEX_TO_DEC_LV1:
    MOVLW   0XF6
    ADDWF   COMPARE_TABLE_TEMP,W
    BTFSC   STATUS,C
    GOTO    EASY_HEX_TO_DEC_LV3
;-------------------
    MOVF    COMPARE_TABLE_TEMP,W
    MOVWF   HEX_UNIT_TEMP
    RETURN
EASY_HEX_TO_DEC_LV3:
    MOVLW   0X0A
    SUBWF   COMPARE_TABLE_TEMP,F
    INCF    HEX_TEN_TEMP,F
    GOTO    EASY_HEX_TO_DEC_LV1
;===============================================
;============將REG內資料全部清空================
;===============================================							  
CLEAN_ALL_REGISTER:
    MOVLW   0X20
    MOVWF   FSR1H
    MOVLW   0X00
    MOVWF   FSR1L
    MOVLW   0X03
    MOVWF   0X71
    MOVLW   0XFF
    MOVWF   0X70   
CLEAN_ALL_REGISTER_LOOP:
    CLRF    INDF1
    BCF     STATUS,C
    MOVLW   0X01
    ADDWF   FSR1L,F
    MOVLW   0X00
    ADDWFC  FSR1H,F
    DECFSZ	0X70,F
    GOTO    CLEAN_ALL_REGISTER_LOOP
    MOVLW   0XFF
    MOVWF   0X70
    DECFSZ	0X71,F
    GOTO    CLEAN_ALL_REGISTER_LOOP
BANKSEL     PORTA
    RETURN








AAAAAA:
    MOVLW   0X08
    MOVWF   0X78
AAA_LOOP:
BANKSEL     PORTA
    BCF     PORTA,0X03
    NOP
    NOP
    BTFSC   0X79,0X07
    BSF     PORTA,0X04
    BTFSS   0X79,0X07
    BCF     PORTA,0X04
    RLF     0X79,F
    BSF     PORTA,0X03
    NOP
    NOP
    DECFSZ  0X78,F
    GOTO    AAA_LOOP
    BCF     PORTA,0X03
    BCF     PORTA,0X04
    RETURN



;11000000 10000000  00000000  01000000    BIT 7 6
;01000000 00100000  00000000  01100000    BIT 6 5
;00100000 00010000  00000000  00110000    BIT 5 4 
;00010000 00001000  00000000  00011000    BIT 4 3 
;00001000 00000000  00000100  00001100    BIT 3 2
;00000100 00000010  00000000  00000110    BIT 2 1
;00000010 00000001  00000000  00000011    BIT 1 0
;有效位的BIT不可連續並排
;-----------------------------------------------------------
;將有效資料放在兩個(分開的BIT位置)   19200   
;00100000 00000000  00000100  00100100    BIT 5 2     OK
;00100000 00000000  00001000  00101000    BIT 5 3     OK
;(52us*8)*4=2ms取一次BYTE
;OSSD OUT 可送出20BYTE資料
;資料如果SHIFT那會有辨識錯誤的風險
;----------------------------------------------------------------------------
;每10ms內一定要送一個資料出來，否則電容會放電到LO
;BIT 2-5 多數是1的話，表示這次UART的資料為SET BIT HI
;BIT 2-5 多數是0的話，表示這次UART的資料為SET BIT LO
;傳送端送HI:送0XFC/傳送端送LO:送0X00
;每筆UART資料與資料之間的間隔時間為1us-20ms
;接收端收到完整的一個BYTE時間為:(52us*8)*8=3.3ms
;表示每次OSSD OUT(40ms)可以輸出10-11BYTE的資料
;---------------------------------------------------------------------------
;11111100----->11111110
;11000000----->11100000
;00001100----->10001110
;---------------------------------------------------------------------------
;最終版本
;判斷有效資料位置:BIT 6 5 4 為HI BIT/BIT 3 2 1 為LO BIT
;發送端         接收端
;00000000----->10000000     00
;00001100----->10001110     01
;11100000----->11110000     10
;11111100----->11111110     11
;接收端收到完整的一個BYTE時間為:(52us*9)*4=2.4ms
;表示每次OSSD OUT(40ms)可以輸出23個BYTE的資料
;接收端判斷有效資料bit 在 bit 4   bit1
;baud:19200
;----------------------------------------------------------------











PREPARE_HMI_BEFORE_DATA_LOOP:
BANKSEL       BANK1
;-------------------------------------------ADC參數設定
    MOVLW     0X55
    MOVWF     0XA0
;------
    MOVLW     0X55
    MOVWF     0XA1
;------
    MOVLW     0X42
    MOVWF     0XA2
;-------------------------HMI位置
    MOVLW     0X3D
    MOVWF     0XA3
;--------------------------等於
    MOVLW     0X31
    MOVWF     0XA4

    MOVLW     0X35
    MOVWF     0XA5

    MOVLW     0X3D
    MOVWF     0XA6

    MOVLW     0X30
    MOVWF     0XA7
;------;--------------------------4BYTE資料
    MOVLW     0XFF
    MOVWF     0XA8
;------
    MOVLW     0XFF
    MOVWF     0XA9
;------
    MOVLW     0XFF
    MOVWF     0XAA



;-----------------------------------------------------------OSSD設定參數
    MOVLW     0X53
    MOVWF     0XB0
;------
    MOVLW     0X30
    MOVWF     0XB1
;------
    MOVLW     0X30
    MOVWF     0XB2
;-------------------------HMI位置
    MOVLW     0X3D
    MOVWF     0XB3
;--------------------------等於
    MOVLW     0X31
    MOVWF     0XB4

    MOVLW     0X35
    MOVWF     0XB5
;--------------------------------2BYTE資料
    MOVLW     0XFF
    MOVWF     0XB6

    MOVLW     0XFF
    MOVWF     0XB7

    MOVLW     0XFF
    MOVWF     0XB8






;-----------------------------------------------------------OT設定參數
    MOVLW     0X53
    MOVWF     0XC0
;------
    MOVLW     0X30
    MOVWF     0XC1
;------
    MOVLW     0X31
    MOVWF     0XC2
;-------------------------HMI位置
    MOVLW     0X3D
    MOVWF     0XC3
;--------------------------等於
    MOVLW     0X31
    MOVWF     0XC4

    MOVLW     0X35
    MOVWF     0XC5
;--------------------------------2BYTE資料
    MOVLW     0XFF
    MOVWF     0XC6

    MOVLW     0XFF
    MOVWF     0XC7

    MOVLW     0XFF
    MOVWF     0XC8








;-----------------------------------------------------------OL設定參數
    MOVLW     0X53
    MOVWF     0XD0
;------
    MOVLW     0X30
    MOVWF     0XD1
;------
    MOVLW     0X32
    MOVWF     0XD2
;-------------------------HMI位置
    MOVLW     0X3D
    MOVWF     0XD3
;--------------------------等於
    MOVLW     0X31
    MOVWF     0XD4

    MOVLW     0X35
    MOVWF     0XD5
;--------------------------------2BYTE資料
    MOVLW     0XFF
    MOVWF     0XD6

    MOVLW     0XFF
    MOVWF     0XD7

    MOVLW     0XFF
    MOVWF     0XD8






;-----------------------------------------------------------OI設定參數
    MOVLW     0X53
    MOVWF     0XE0
;------
    MOVLW     0X30
    MOVWF     0XE1
;------
    MOVLW     0X33
    MOVWF     0XE2
;-------------------------HMI位置
    MOVLW     0X3D
    MOVWF     0XE3
;--------------------------等於
    MOVLW     0X31
    MOVWF     0XE4

    MOVLW     0X35
    MOVWF     0XE5
;--------------------------------2BYTE資料
    MOVLW     0XFF
    MOVWF     0XE6

    MOVLW     0XFF
    MOVWF     0XE7

    MOVLW     0XFF
    MOVWF     0XE8

BANKSEL       BANK2
;-----------------------------------------------------------MFG設定參數
    MOVLW     0X53
    MOVWF     0X20
;------
    MOVLW     0X30
    MOVWF     0X21
;------
    MOVLW     0X34
    MOVWF     0X22
;-------------------------HMI位置
    MOVLW     0X3D
    MOVWF     0X23
;--------------------------等於
    MOVLW     0X31
    MOVWF     0X24

    MOVLW     0X35
    MOVWF     0X25
;--------------------------------2BYTE資料
    MOVLW     0XFF
    MOVWF     0X26

    MOVLW     0XFF
    MOVWF     0X27

    MOVLW     0XFF
    MOVWF     0X28
;-------------------------------------------------------------------
;-----------------------------------------------------------TYPE設定參數
    MOVLW     0X53
    MOVWF     0X30
;------
    MOVLW     0X30
    MOVWF     0X31
;------
    MOVLW     0X38
    MOVWF     0X32
;-------------------------HMI位置
    MOVLW     0X3D
    MOVWF     0X33
;--------------------------等於
    MOVLW     0X31
    MOVWF     0X34

    MOVLW     0X35
    MOVWF     0X35
;--------------------------------2BYTE資料
    MOVLW     0XFF
    MOVWF     0X36

    MOVLW     0XFF
    MOVWF     0X37

    MOVLW     0XFF
    MOVWF     0X38






BANKSEL       BANK0
    RETURN

;* ****************************************************************************************
;*    EXTERN CODE
;* 
CODE_SOFT_UART2_LOOP
CODE_SOFT_UART1_LOOP
CODE_DELAY
CODE_SERIAL_IO_LOOP
;--------------------------------------------------------
;上電前ADC參數設定
;DAT01:ADCON0
;DAT02:ADCON1
;DAT03:ANSELA
;DAT04:ANSELE
;DAT05:ANSELF
;DAT06:ANSELG
CODE_INIT_BE_ADC  0X00,0X01,0X00,0X00,0X03,0X00
;--------------------------------------------------------
;--------------------------------------------------------
;上電前IO參數設定
;DAT01:TRISA
;DAT02:TRISB
;DAT03:TRISC
;DAT04:TRISD
;DAT05:TRISE
;DAT06:TRISF
;DAT07:TRISG
CODE_INIT_BE_IO 0X00,0X00,0X00,0X00,0X00,0XFF,0X00
;--------------------------------------------------------
;--------------------------------------------------------
;上電前中斷參數設定
;DAT01:OPTION_REG
;DAT02:INTOCN
;DAT03:PIE1
;DAT04:PIE2
;DAT05:PIE3
;DAT06:PIE4
CODE_INITIALIZE_INT1 0X40,0X00,0X00,0X00,0X00,0X00
;--------------------------------------------------------
;--------------------------------------------------------
;上電前OSC參數設定
;DAT01:OSCCON
;DAT02:OSCTUNE
;DAT03:OSCSTAT
CODE_INITIALIZE_OSC	0X72,0X00,0X11
;--------------------------------------------------------
;--------------------------------------------------------
;BOOTLOADER後 比較器參數設定
;DAT01:FVRCON
;DAT02:DACCON0
;DAT03:DACCON1
;DAT04:CM1CON0
;DAT05:CM1CON1
CODE_INITIALIZE_COMPARE		0X00,0XC0,0X02,0XB0,0X12
;--------------------------------------------------------
;--------------------------------------------------------
;BOOTLOADER後 IO參數設定
;DAT01:TRISA
;DAT02:TRISB
;DAT03:TRISC
;DAT04:TRISD
;DAT05:TRISE
;DAT06:TRISF
;DAT07:TRISG
CODE_INIT_AF_IO 0X00,0X1E,0X80,0X03,0X00,0XFB,0X06
;--------------------------------------------------------
;--------------------------------------------------------
;BOOTLOADER後 UART HW參數設定
;DAT01:決定使用UART1或是UART2
;DAT02:SPXBRGH
;DAT03:SPXBRGL
;DAT04:BAUDXCON
;DAT05:TXXSTA
;DAT06:RCXSTA
CODE_INIT_AF_UART1 0X00,0X19,0X00,0X24,0X90
;--------------------------------------------------------
;--------------------------------------------------------
;BOOTLOADER後 UART HW參數設定
;DAT01:決定使用UART1或是UART2
;DAT02:SPXBRGH
;DAT03:SPXBRGL
;DAT04:BAUDXCON
;DAT05:TXXSTA
;DAT06:RCXSTA
CODE_INIT_AF_UART2 0X00,0X19,0X00,0X24,0X90
;--------------------------------------------------------
;--------------------------------------------------------
;BOOTLOADER後 TIMER2 HW參數設定 50us
;DAT01:T2CON
;DAT02:TMR2
;DAT03:PR2
CODE_INIT_AF_TIMER2 0X05,0X00,0X19
;--------------------------------------------------------
;BOOTLOADER後 TIMER4 HW參數設定 1ms
;DAT01:T4CON
;DAT02:TMR4
;DAT03:PR4
CODE_INIT_AF_TIMER4 0X0D,0X00,0XFA
;--------------------------------------------------------
;--------------------------------------------------------
;BOOTLOADER後 ADC HW參數設定 1ms
;DAT01:FVCON
;DAT02:ADCON0
;DAT03:ADCON1
CODE_INIT_AF_ADC 0XC3,0X41,0XF3
;--------------------------------------------------------

