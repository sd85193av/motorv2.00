;========================================================
;================ Project Information ===================
;========================================================   
;Project Name   : MODBUS_COMMAND
;-------------------------------------------------------        
;Project Version: 2.00
;Edit Date      : 2023/09/28
;Function Info  : 
;               : 
;               : 
;-------------------------------------------------------
#include    "p16f1947.inc"
#include    "MOTOR_16F1947_PA.inc"
#include    "MODBUS_COMMAND.inc"
PSECT cmd, class=CODE, delta=2 
;******************************************************************************
;****************************TABLE表區域***************************************
;******************************************************************************
;========================================================
;==================中斷UART2 FUNCTION====================
;========================================================
MODBUS_ADR_FUNCTION:
BANKSEL     PORTA
    CLRF    MODBUS_ERROR_FLAG
    MOVLW   0X08
    MOVWF   PCLATH
    MOVF    MODBUS_TABLE_ADR_TEMP,W
    BRW     
    GOTO    MODBUS_ADR_A0_FUNCTION          ;00
    GOTO    MODBUS_ADR_A1_FUNCTION          ;01
    GOTO    MODBUS_ADR_A2_FUNCTION          ;02
    GOTO    MODBUS_ADR_A3_FUNCTION          ;03
    GOTO    MODBUS_ADR_A4_FUNCTION          ;04
    GOTO    MODBUS_BUS_02_ERROR_0800        ;05
    GOTO    MODBUS_BUS_02_ERROR_0800        ;06
    GOTO    MODBUS_BUS_02_ERROR_0800        ;07
    GOTO    MODBUS_BUS_02_ERROR_0800        ;08
    GOTO    MODBUS_BUS_02_ERROR_0800        ;09
    GOTO    MODBUS_BUS_02_ERROR_0800        ;0A
    GOTO    MODBUS_BUS_02_ERROR_0800        ;0B
    GOTO    MODBUS_BUS_02_ERROR_0800        ;0C
    GOTO    MODBUS_BUS_02_ERROR_0800        ;0D
    GOTO    MODBUS_BUS_02_ERROR_0800        ;0E
    GOTO    MODBUS_BUS_02_ERROR_0800        ;0F
;-----------------------------
    GOTO    MODBUS_ADR_B0_FUNCTION          ;10
    GOTO    MODBUS_ADR_B1_FUNCTION          ;11
    GOTO    MODBUS_ADR_B2_FUNCTION          ;12
    GOTO    MODBUS_ADR_B3_FUNCTION          ;13
    GOTO    MODBUS_ADR_B4_FUNCTION          ;14
    GOTO    MODBUS_ADR_B5_FUNCTION          ;15
    GOTO    MODBUS_ADR_B6_FUNCTION          ;16
    GOTO    MODBUS_ADR_B7_FUNCTION          ;17
    GOTO    MODBUS_ADR_B8_FUNCTION          ;18
    GOTO    MODBUS_ADR_B9_FUNCTION          ;19
    GOTO    MODBUS_BUS_02_ERROR_0800        ;1A
    GOTO    MODBUS_BUS_02_ERROR_0800        ;1B
    GOTO    MODBUS_BUS_02_ERROR_0800        ;1C
    GOTO    MODBUS_BUS_02_ERROR_0800        ;1D
    GOTO    MODBUS_BUS_02_ERROR_0800        ;1E
    GOTO    MODBUS_BUS_02_ERROR_0800        ;1F
;-----------------------------
    GOTO    MODBUS_ADR_C0_FUNCTION          ;20
    GOTO    MODBUS_ADR_C1_FUNCTION          ;21
    GOTO    MODBUS_ADR_C2_FUNCTION          ;22
    GOTO    MODBUS_ADR_C3_FUNCTION          ;23
    GOTO    MODBUS_ADR_C4_FUNCTION          ;24
    GOTO    MODBUS_ADR_C5_FUNCTION          ;25
    GOTO    MODBUS_ADR_C6_FUNCTION          ;26
    GOTO    MODBUS_ADR_C7_FUNCTION          ;27
    GOTO    MODBUS_BUS_02_ERROR_0800        ;28
    GOTO    MODBUS_BUS_02_ERROR_0800        ;29
    GOTO    MODBUS_BUS_02_ERROR_0800        ;2A
    GOTO    MODBUS_BUS_02_ERROR_0800        ;2B
    GOTO    MODBUS_BUS_02_ERROR_0800        ;2C
    GOTO    MODBUS_BUS_02_ERROR_0800        ;2D
    GOTO    MODBUS_BUS_02_ERROR_0800        ;2E
    GOTO    MODBUS_BUS_02_ERROR_0800        ;2F
;-----------------------------
    GOTO    MODBUS_ADR_D0_FUNCTION          ;30
    GOTO    MODBUS_ADR_D1_FUNCTION          ;31
    GOTO    MODBUS_ADR_D2_FUNCTION          ;32
    GOTO    MODBUS_ADR_D3_FUNCTION          ;33
    GOTO    MODBUS_ADR_D4_FUNCTION          ;34
    GOTO    MODBUS_ADR_D5_FUNCTION          ;35
    GOTO    MODBUS_ADR_D6_FUNCTION          ;36
    GOTO    MODBUS_BUS_02_ERROR_0800        ;37
    GOTO    MODBUS_BUS_02_ERROR_0800        ;38
    GOTO    MODBUS_BUS_02_ERROR_0800        ;39
    GOTO    MODBUS_BUS_02_ERROR_0800        ;3A
    GOTO    MODBUS_BUS_02_ERROR_0800        ;3B
    GOTO    MODBUS_BUS_02_ERROR_0800        ;3C
    GOTO    MODBUS_BUS_02_ERROR_0800        ;3D
    GOTO    MODBUS_BUS_02_ERROR_0800        ;3E
    GOTO    MODBUS_BUS_02_ERROR_0800        ;3F
;-----------------------------
    GOTO    MODBUS_ADR_E0_FUNCTION          ;40
    GOTO    MODBUS_ADR_E1_FUNCTION          ;41
    GOTO    MODBUS_ADR_E2_FUNCTION          ;42
    GOTO    MODBUS_ADR_E3_FUNCTION          ;43
    GOTO    MODBUS_ADR_E4_FUNCTION          ;44
    GOTO    MODBUS_ADR_E5_FUNCTION          ;45
    GOTO    MODBUS_ADR_E6_FUNCTION          ;46
    GOTO    MODBUS_BUS_02_ERROR_0800        ;47
    GOTO    MODBUS_BUS_02_ERROR_0800        ;48
    GOTO    MODBUS_BUS_02_ERROR_0800        ;49
    GOTO    MODBUS_BUS_02_ERROR_0800        ;4A
    GOTO    MODBUS_BUS_02_ERROR_0800        ;4B
    GOTO    MODBUS_BUS_02_ERROR_0800        ;4C
    GOTO    MODBUS_BUS_02_ERROR_0800        ;4D
    GOTO    MODBUS_BUS_02_ERROR_0800        ;4E
    GOTO    MODBUS_BUS_02_ERROR_0800        ;4F
;-----------------------------
;-----------------------------

;===================================================
;============MODBUS的功能碼錯誤=====================OK
;===================================================
;MODBUS RTU ERROR CODE 01
;非法功能，表示非授權的功能碼
MODBUS_BUS_01_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_01_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 02
;非法暫存器地址
MODBUS_BUS_02_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_02_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 03
;非法資料數值
MODBUS_BUS_03_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_03_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 04
;裝置故障，像是自我檢測出現異常
MODBUS_BUS_04_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_04_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 05
;確認，有收到指令並且立即執行
MODBUS_BUS_05_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_05_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 06
;裝置BUSY，(有收到指令，但因為正在執行其他指令而無法執行)
MODBUS_BUS_06_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_06_F
    RETURN
;******************************************************************
;******************************************************************
;========================================================
;==================MODBUS 恢復出廠設定===================
;========================================================
MODBUS_ADR_A0_FUNCTION:
BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;這邊只能用寫，讀的話算是異常碼02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A0_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;這邊主要是確保功能碼的部分只能有0X03和0X06之外的
;--------------------------------
;前面確認過暫存器位址，後面要確認資料格式是否符合
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A0_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;資料都是0X00表示異常
MODBUS_ADR_A0_LV1:
;將所有參數設定為預設值
;直接設定TX輸出暫存器就直接使用RX陣列
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;實際要做的事:
    BSF     FLAG6_BANK0,A0_F
    RETURN
;--------------------------------------------------
;----ADR 0XA0功能碼0X10 先確認輸入的資料是否合法---
;--------------------------------------------------
MODBUS_ADR_A0_LV0:
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X05
    ADDWF   FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料數量大於1個WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE數和WORD數不符合
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A0_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料都是0X00表示異常
    GOTO    MODBUS_ADR_A0_LV1
;========================================================
;==================MODBUS 整機初始化=====================
;========================================================
MODBUS_ADR_A1_FUNCTION:
BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;這邊只能用寫，讀的話算是異常碼02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A1_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;這邊主要是確保功能碼的部分只能有0X03和0X06之外的
;--------------------------------
;前面確認過暫存器位址，後面要確認資料格式是否符合
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A1_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;資料都是0X00表示異常
MODBUS_ADR_A1_LV1:
;將所有參數設定為預設值
;直接設定TX輸出暫存器就直接使用RX陣列
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;實際要做的事:
    BSF     FLAG6_BANK0,A1_F
    RETURN
;--------------------------------------------------
;----ADR 0XA1功能碼0X10 先確認輸入的資料是否合法---
;--------------------------------------------------
MODBUS_ADR_A1_LV0:
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X05
    ADDWF   FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料數量大於1個WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE數和WORD數不符合
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A1_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料都是0X00表示異常
    GOTO    MODBUS_ADR_A1_LV1
;========================================================
;==================MODBUS 換向閥初始化===================
;========================================================
MODBUS_ADR_A2_FUNCTION:
 BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;這邊只能用寫，讀的話算是異常碼02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A2_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;這邊主要是確保功能碼的部分只能有0X03和0X06之外的
;--------------------------------
;前面確認過暫存器位址，後面要確認資料格式是否符合
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A2_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;資料都是0X00表示異常
MODBUS_ADR_A2_LV1:
;將所有參數設定為預設值
;直接設定TX輸出暫存器就直接使用RX陣列
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;實際要做的事:
    BSF     FLAG6_BANK0,A2_F
    RETURN
;--------------------------------------------------
;----ADR 0XA2功能碼0X10 先確認輸入的資料是否合法---
;--------------------------------------------------
MODBUS_ADR_A2_LV0:
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X05
    ADDWF   FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料數量大於1個WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE數和WORD數不符合
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A2_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料都是0X00表示異常
    GOTO    MODBUS_ADR_A2_LV1
;========================================================
;==================MODBUS 活塞初始化=====================
;========================================================
MODBUS_ADR_A3_FUNCTION:
 BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;這邊只能用寫，讀的話算是異常碼02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A3_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;這邊主要是確保功能碼的部分只能有0X03和0X06之外的
;--------------------------------
;前面確認過暫存器位址，後面要確認資料格式是否符合
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A3_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;資料都是0X00表示異常
MODBUS_ADR_A3_LV1:
;將所有參數設定為預設值
;直接設定TX輸出暫存器就直接使用RX陣列
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;實際要做的事:
    BSF     FLAG6_BANK0,A3_F
    RETURN
;--------------------------------------------------
;----ADR 0XA3功能碼0X10 先確認輸入的資料是否合法---
;--------------------------------------------------
MODBUS_ADR_A3_LV0:
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X05
    ADDWF   FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料數量大於1個WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE數和WORD數不符合
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A3_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料都是0X00表示異常
    GOTO    MODBUS_ADR_A3_LV1
;========================================================
;==================MODBUS 醒目提示=======================
;========================================================
MODBUS_ADR_A4_FUNCTION:
 BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;這邊只能用寫，讀的話算是異常碼02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A4_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;這邊主要是確保功能碼的部分只能有0X03和0X06之外的
;--------------------------------
;前面確認過暫存器位址，後面要確認資料格式是否符合
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A4_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;資料都是0X00表示異常
MODBUS_ADR_A4_LV1:
;將所有參數設定為預設值
;直接設定TX輸出暫存器就直接使用RX陣列
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;實際要做的事:
    BSF     FLAG6_BANK0,A4_F
    RETURN
;--------------------------------------------------
;----ADR 0XA4功能碼0X10 先確認輸入的資料是否合法---
;--------------------------------------------------
MODBUS_ADR_A4_LV0:
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X05
    ADDWF   FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料數量大於1個WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE數和WORD數不符合
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A4_LV1                           ;資料不為0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;資料都是0X00表示異常
    GOTO    MODBUS_ADR_A4_LV1
;-----------------------------------------------------------------------------
;-----------------------------------------------------------------------------
;-----------------------------------------------------------------------------
;========================================================
;==================MODBUS 閥換向=========================
;========================================================
;DATA只會有0X0000和0X0001如果出現其他的數值表示異常發生
MODBUS_ADR_B0_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_ADR_B0_03_LOOP                           ;ADR 為閥換向，使用READ 1 BYTE 功能碼
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_ADR_B0_06_LOOP                           ;ADR 為閥換向，使用WRITE 1 BYTE 功能碼
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_B0_10_LOOP                           ;寫MORE BYTE
;--------------------------------
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;表示功能碼都不是
;-----------------------------------------------------------
;--------------------MODBUS B0 寫1BYTE----------------------
;-----------------------------------------------------------
MODBUS_ADR_B0_06_LOOP:
;前面確認過暫存器位址，後面要確認資料格式是否符合
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F                                     ;將位置指向DATA_HBYTE
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;DATA的HBYTE必須為0X00，其他數值表示異常
;-----------------------
    INCF    FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_0800                   ;資料不是0X00就是0X01，超過範圍就算是異常碼03
;------------------------
;資料範圍正確，將資料存放到相應的馬達模組存放資料地方，並回覆485
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X03
    ADDWF   FSR0L,F                                     ;這邊資料要確認INC那邊的馬達參數
    MOVF    INDF1,W
    MOVWF   INDF0
;------------------------
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
    RETURN
;-----------------------------------------------------------
;--------------------MODBUS B0 讀1BYTE----------------------
;-----------------------------------------------------------
;先將WORD數*2當作BYTE數並放在+2[FSR]
;重新計算CRC並且把資料重新整理送出TX
MODBUS_ADR_B0_03_LOOP:
;設定好要讀取的位置之後用485功能碼0X03就可以了
    CALL    MODBUS_FUNC_03_BEFORE_LOOP
;---------------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
;---------------------------------                        ;03差異點在於說要讀取哪個位置的資料
    GOTO    MODBUS_FUNC_03_AFTER_LOOP
;-----------------------------------------------------------
;--------------------MODBUS B0 寫MORE BYTE------------------
;-----------------------------------------------------------
MODBUS_ADR_B0_10_LOOP:
    CALL    MODBUS_FUNC_10_CHECK_WORD_BYTE_LOOP            ;先判斷WORD是否和BYTE相同
    MOVF    MODBUS_ERROR_FLAG,W
    BTFSC   STATUS,Z
    RETURN
;----------------------------------------                  ;表示MODBUS有錯誤碼發生
    MOVLW   0X02
    MOVWF   MODBUS_TOP_DAT_L                               ;先將該資料數量可以允許的設定出來
    CALL    MODBUS_FUNC_10_BYTE_NUMBER_LOP
    MOVF    MODBUS_ERROR_FLAG,W
    BTFSC   STATUS,Z
    RETURN
;----------------------------------------                  ;表示MODBUS有錯誤碼發生
    CLRF    MODBUS_TOP_DAT_H
    MOVLW   0X01
    MOVWF   MODBUS_TOP_DAT_L
    CLRF    MODBUS_BTN_DAT_H
    CLRF    MODBUS_BTN_DAT_L                                ;設定上下限數值
    BCF     FLAG1_BANK0,DATA_IS_NEGATIVE_FLAG               ;0表示下限數值為0X00/1:表示下限數值是負數
    CALL    MODBUS_FUNC_10_DATA_CHECK_LOOP
    MOVF    MODBUS_ERROR_FLAG,W
    BTFSC   STATUS,Z
    RETURN



    RETURN




;*****************************************************************************
;*****************************************************************************
;========================================================
;=====MODBUS 功能碼0X10先檢查數量WORD和BYTE是否正確======
;========================================================
MODBUS_FUNC_10_CHECK_WORD_BYTE_LOOP:
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X05
    ADDWF   FSR1L,F 
    MOVWF   CAL_TEMP_LBYTE
    INCF    FSR1L,F
    BCF     STATUS,C
    RLF     CAL_TEMP_LBYTE,F
    MOVF    CAL_TEMP_LBYTE,W
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    BSF     MODBUS_ERROR_FLAG,ERROR_02_F
    RETURN
;========================================================
;=====MODBUS 功能碼0X10先檢查數量是否正確================
;========================================================
;MODBUS_TOP_DAT_L       根據每個不同的ADR決定不同NUMBER數的

MODBUS_FUNC_10_BYTE_NUMBER_LOP:
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X06
    ADDWF   FSR1L,F
    MOVF    MODBUS_TOP_DAT_L,W
    BTFSS   STATUS,Z
    BSF     MODBUS_ERROR_FLAG,ERROR_02_F
    RETURN
;========================================================
;=====MODBUS 功能碼0X10先檢查資料範圍是否正確============
;========================================================
;MODBUS_TOP_DAT_H        上限HBYTE
;MODBUS_TOP_DAT_L        上限LBYTE
;MODBUS_BTN_DAT_H        下限HBYTE
;MODBUS_BTN_DAT_L        下限LBYTE
MODBUS_FUNC_10_DATA_CHECK_LOOP:




    RETURN


















;========================================================
;=========MODBUS 功能碼0X03後面準備的資料================
;========================================================
;將03前面要讀取的資料數先確認出來
MODBUS_FUNC_03_AFTER_LOOP:
    MOVF    INDF0,W
    MOVWF   INDF1
    INCF    FSR0L,F
    INCF    FSR1L,F
    DECFSZ  CAL_TEMP_LBYTE,F
    GOTO    MODBUS_FUNC_03_AFTER_LOOP                         
;----------
    MOVF    RTU_COUNTER_DATA,W
    MOVWF   CAL_TEMP_LBYTE
    MOVLW   0X03
    ADDWF   RTU_COUNTER_DATA,F
PAGESEL     0X0000
    CALL    MODBUS_RTU_READ_LV2
PAGESEL     0X0800
    MOVF    CAL_TEMP_LBYTE,W
    MOVWF   TX_DATA_COUNTER
    MOVLW   0X05
    ADDWF   TX_DATA_COUNTER,F
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    RETURN

;========================================================
;=========MODBUS 功能碼0X03前面準備的資料================
;========================================================
MODBUS_FUNC_03_BEFORE_LOOP:
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X05
    ADDWF   FSR1L,F  
    MOVF    INDF1,W
    MOVWF   CAL_TEMP_LBYTE                              ;紀錄要讀取的WORD數量
;---------------------------------
    BCF     STATUS,C
    RLF     CAL_TEMP_LBYTE,F
    MOVF    CAL_TEMP_LBYTE,W
    MOVWF   RTU_COUNTER_DATA
;---------------------------------
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
    MOVLW   0X02
    ADDWF   FSR1L,F
    MOVF    RTU_COUNTER_DATA,W
    MOVWF   INDF1
    INCF    FSR1L,F
    RETURN
;*****************************************************************************
;*****************************************************************************







;========================================================
;==================MODBUS 活塞移動-絕對位置==============
;========================================================
;這邊的資料主要是4個BYTE，所以要執行動作的話，需要等到ADR_B2被寫入才會動作
MODBUS_ADR_B1_FUNCTION:








MODBUS_ADR_B2_FUNCTION:
























;========================================================
;==================MODBUS 活塞移動-相對位置==============
;========================================================
MODBUS_ADR_B3_FUNCTION:
MODBUS_ADR_B4_FUNCTION:
;========================================================
;==================MODBUS 活塞移動-向量-CW===============
;========================================================
MODBUS_ADR_B5_FUNCTION:
MODBUS_ADR_B6_FUNCTION:
;========================================================
;==================MODBUS 活塞移動-向量-CCW==============
;========================================================
MODBUS_ADR_B7_FUNCTION:
MODBUS_ADR_B8_FUNCTION:
;========================================================
;==================MODBUS 活塞移動-極限==================
;========================================================
MODBUS_ADR_B9_FUNCTION:
;========================================================
;==================MODBUS 零點偏移量設定=================
;========================================================
MODBUS_ADR_C0_FUNCTION:
;========================================================
;==================MODBUS 累計步數=======================
;========================================================
MODBUS_ADR_C1_FUNCTION:
MODBUS_ADR_C2_FUNCTION:
;========================================================
;==================MODBUS 相對零點設定===================
;========================================================
MODBUS_ADR_C3_FUNCTION:
MODBUS_ADR_C4_FUNCTION:
;========================================================
;==================MODBUS  反向間隙設定-CW===============
;========================================================
MODBUS_ADR_C5_FUNCTION:
;========================================================
;==================MODBUS  反向間隙設定-CCW==============
;========================================================
MODBUS_ADR_C6_FUNCTION:
;========================================================
;==================MODBUS  自動校正反向間隙==============
;========================================================
MODBUS_ADR_C7_FUNCTION:
;========================================================
;==================MODBUS  安全模式======================
;========================================================
MODBUS_ADR_D0_FUNCTION:
;========================================================
;==================MODBUS  設備狀態======================
;========================================================
MODBUS_ADR_D1_FUNCTION:
;========================================================
;==================MODBUS  設備辨識資料==================
;========================================================
MODBUS_ADR_D2_FUNCTION:
;========================================================
;==================MODBUS  溫度檢測======================
;========================================================
MODBUS_ADR_D3_FUNCTION:
;========================================================
;==================MODBUS  電流檢測======================
;========================================================
MODBUS_ADR_D4_FUNCTION:
;========================================================
;==================MODBUS  電壓檢測======================
;========================================================
MODBUS_ADR_D5_FUNCTION:
;========================================================
;==================MODBUS  上電初始化設定================
;========================================================
MODBUS_ADR_D6_FUNCTION:
;========================================================
;==================MODBUS  開發人員權限啟動==============
;========================================================
MODBUS_ADR_E0_FUNCTION:
;========================================================
;==================MODBUS  活塞最大行程設定==============
;========================================================
MODBUS_ADR_E1_FUNCTION:
MODBUS_ADR_E2_FUNCTION:
;========================================================
;==================MODBUS  微步進模式====================
;========================================================
MODBUS_ADR_E3_FUNCTION:
;========================================================
;==================MODBUS  活塞移動-光耦合===============
;========================================================
MODBUS_ADR_E4_FUNCTION:



;========================================================
;==================MODBUS  速度設定======================
;========================================================
MODBUS_ADR_E5_FUNCTION:
;========================================================
;==================MODBUS  速度==========================
;========================================================
MODBUS_ADR_E6_FUNCTION:
    RETFIE

