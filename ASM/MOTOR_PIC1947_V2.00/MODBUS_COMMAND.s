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
;****************************TABLE��ϰ�***************************************
;******************************************************************************
;========================================================
;==================���_UART2 FUNCTION====================
;========================================================
MODBUS_ADR_FUNCTION:
BANKSEL     PORTA
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
;============MODBUS���\��X���~=====================OK
;===================================================
;MODBUS RTU ERROR CODE 01
;�D�k�\��A��ܫD���v���\��X
MODBUS_BUS_01_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_01_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 02
;�D�k�Ȧs���a�}
MODBUS_BUS_02_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_02_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 03
;�D�k��Ƽƭ�
MODBUS_BUS_03_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_03_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 04
;�˸m�G�١A���O�ۧ��˴��X�{���`
MODBUS_BUS_04_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_04_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 05
;�T�{�A��������O�åB�ߧY����
MODBUS_BUS_05_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_05_F
    RETURN
;----------------------------------------
;MODBUS RTU ERROR CODE 06
;�˸mBUSY�A(��������O�A���]�����b�����L���O�ӵL�k����)
MODBUS_BUS_06_ERROR_0800:
    BSF     MODBUS_ERROR_FLAG,ERROR_06_F
    RETURN
;******************************************************************
;******************************************************************
;========================================================
;==================MODBUS ��_�X�t�]�w===================
;========================================================
MODBUS_ADR_A0_FUNCTION:
BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A0_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;�o��D�n�O�T�O�\��X�������u�঳0X03�M0X06���~��
;--------------------------------
;�e���T�{�L�Ȧs����}�A�᭱�n�T�{��Ʈ榡�O�_�ŦX
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A0_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;��Ƴ��O0X00��ܲ��`
MODBUS_ADR_A0_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
;�����]�wTX��X�Ȧs���N�����ϥ�RX�}�C
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    BSF     FLAG6_BANK0,A0_F
    RETURN
;--------------------------------------------------
;----ADR 0XA0�\��X0X10 ���T�{��J����ƬO�_�X�k---
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
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƽƶq�j��1��WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE�ƩMWORD�Ƥ��ŦX
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A0_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƴ��O0X00��ܲ��`
    GOTO    MODBUS_ADR_A0_LV1
;========================================================
;==================MODBUS �����l��=====================
;========================================================
MODBUS_ADR_A1_FUNCTION:
BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A1_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;�o��D�n�O�T�O�\��X�������u�঳0X03�M0X06���~��
;--------------------------------
;�e���T�{�L�Ȧs����}�A�᭱�n�T�{��Ʈ榡�O�_�ŦX
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A1_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;��Ƴ��O0X00��ܲ��`
MODBUS_ADR_A1_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
;�����]�wTX��X�Ȧs���N�����ϥ�RX�}�C
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    BSF     FLAG6_BANK0,A1_F
    RETURN
;--------------------------------------------------
;----ADR 0XA1�\��X0X10 ���T�{��J����ƬO�_�X�k---
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
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƽƶq�j��1��WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE�ƩMWORD�Ƥ��ŦX
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A1_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƴ��O0X00��ܲ��`
    GOTO    MODBUS_ADR_A1_LV1
;========================================================
;==================MODBUS ���V�֪�l��===================
;========================================================
MODBUS_ADR_A2_FUNCTION:
 BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A2_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;�o��D�n�O�T�O�\��X�������u�঳0X03�M0X06���~��
;--------------------------------
;�e���T�{�L�Ȧs����}�A�᭱�n�T�{��Ʈ榡�O�_�ŦX
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A2_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;��Ƴ��O0X00��ܲ��`
MODBUS_ADR_A2_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
;�����]�wTX��X�Ȧs���N�����ϥ�RX�}�C
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    BSF     FLAG6_BANK0,A2_F
    RETURN
;--------------------------------------------------
;----ADR 0XA2�\��X0X10 ���T�{��J����ƬO�_�X�k---
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
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƽƶq�j��1��WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE�ƩMWORD�Ƥ��ŦX
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A2_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƴ��O0X00��ܲ��`
    GOTO    MODBUS_ADR_A2_LV1
;========================================================
;==================MODBUS �����l��=====================
;========================================================
MODBUS_ADR_A3_FUNCTION:
 BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A3_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;�o��D�n�O�T�O�\��X�������u�঳0X03�M0X06���~��
;--------------------------------
;�e���T�{�L�Ȧs����}�A�᭱�n�T�{��Ʈ榡�O�_�ŦX
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A3_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;��Ƴ��O0X00��ܲ��`
MODBUS_ADR_A3_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
;�����]�wTX��X�Ȧs���N�����ϥ�RX�}�C
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    BSF     FLAG6_BANK0,A3_F
    RETURN
;--------------------------------------------------
;----ADR 0XA3�\��X0X10 ���T�{��J����ƬO�_�X�k---
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
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƽƶq�j��1��WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE�ƩMWORD�Ƥ��ŦX
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A3_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƴ��O0X00��ܲ��`
    GOTO    MODBUS_ADR_A3_LV1
;========================================================
;==================MODBUS ���ش���=======================
;========================================================
MODBUS_ADR_A4_FUNCTION:
 BANKSEL PORTA
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_0800                       ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_A4_LV0
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;�o��D�n�O�T�O�\��X�������u�঳0X03�M0X06���~��
;--------------------------------
;�e���T�{�L�Ȧs����}�A�᭱�n�T�{��Ʈ榡�O�_�ŦX
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A4_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800             ;��Ƴ��O0X00��ܲ��`
MODBUS_ADR_A4_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
;�����]�wTX��X�Ȧs���N�����ϥ�RX�}�C
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    BSF     FLAG6_BANK0,A4_F
    RETURN
;--------------------------------------------------
;----ADR 0XA4�\��X0X10 ���T�{��J����ƬO�_�X�k---
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
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƽƶq�j��1��WORD
;----------------------------------------
    INCF    FSR1L,F
    MOVLW   0X02
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;BYTE�ƩMWORD�Ƥ��ŦX
;-----------------------------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_ADR_A4_LV1                           ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                    ;��Ƴ��O0X00��ܲ��`
    GOTO    MODBUS_ADR_A4_LV1























;========================================================
;==================MODBUS �ִ��V=========================
;========================================================
MODBUS_ADR_B0_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_ADR_B0_03_LOOP                           ;ADR ���ִ��V�A�ϥ�READ 1 BYTE �\��X
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_ADR_B0_06_LOOP                           ;ADR ���ִ��V�A�ϥ�WRITE 1 BYTE �\��X
;--------------------------------
    BTFSC   FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    MODBUS_ADR_B0_10_LOOP                           ;�gMORE BYTE
;--------------------------------
    GOTO    MODBUS_BUS_01_ERROR_0800                        ;��ܥ\��X�����O
MODBUS_ADR_B0_10_LOOP:
;-----------------------------------------------------------
;--------------------MODBUS B0 �g1BYTE----------------------
;-----------------------------------------------------------
MODBUS_ADR_B0_06_LOOP:
;�e���T�{�L�Ȧs����}�A�᭱�n�T�{��Ʈ榡�O�_�ŦX
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L
    MOVLW   0X04
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_0800                   ;DATA��HBYTE������0X00
;-----------------------
    INCF    FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_0800                   ;��Ƥ��O0X00�N�O0X01�A�W�L�d��N��O���`�X03
;------------------------
;��ƽd�򥿽T�A�N��Ʀs�����������F�Ҳզs���Ʀa��A�æ^��485
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X04
    ADDWF   FSR0L,F 
    MOVF    INDF1,W
    MOVWF   INDF0
;------------------------
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
    RETFIE
;-----------------------------------------------------------
;--------------------MODBUS B0 Ū1BYTE----------------------
;-----------------------------------------------------------
MODBUS_ADR_B0_03_LOOP:
;�]�w�n�nŪ������m�����485�\��X0X03�N�i�H�F




    RETFIE



















;========================================================
;==================MODBUS ���벾��-�����m==============
;========================================================
;�o�䪺��ƥD�n�O4��BYTE�A�ҥH�n����ʧ@���ܡA�ݭn����ADR_B2�Q�g�J�~�|�ʧ@
MODBUS_ADR_B1_FUNCTION:
MODBUS_ADR_B2_FUNCTION:
;========================================================
;==================MODBUS ���벾��-�۹��m==============
;========================================================
MODBUS_ADR_B3_FUNCTION:
MODBUS_ADR_B4_FUNCTION:
;========================================================
;==================MODBUS ���벾��-�V�q-CW===============
;========================================================
MODBUS_ADR_B5_FUNCTION:
MODBUS_ADR_B6_FUNCTION:
;========================================================
;==================MODBUS ���벾��-�V�q-CCW==============
;========================================================
MODBUS_ADR_B7_FUNCTION:
MODBUS_ADR_B8_FUNCTION:
;========================================================
;==================MODBUS ���벾��-����==================
;========================================================
MODBUS_ADR_B9_FUNCTION:
;========================================================
;==================MODBUS �s�I�����q�]�w=================
;========================================================
MODBUS_ADR_C0_FUNCTION:
;========================================================
;==================MODBUS �֭p�B��=======================
;========================================================
MODBUS_ADR_C1_FUNCTION:
MODBUS_ADR_C2_FUNCTION:
;========================================================
;==================MODBUS �۹�s�I�]�w===================
;========================================================
MODBUS_ADR_C3_FUNCTION:
MODBUS_ADR_C4_FUNCTION:
;========================================================
;==================MODBUS  �ϦV���س]�w-CW===============
;========================================================
MODBUS_ADR_C5_FUNCTION:
;========================================================
;==================MODBUS  �ϦV���س]�w-CCW==============
;========================================================
MODBUS_ADR_C6_FUNCTION:
;========================================================
;==================MODBUS  �۰ʮե��ϦV����==============
;========================================================
MODBUS_ADR_C7_FUNCTION:
;========================================================
;==================MODBUS  �w���Ҧ�======================
;========================================================
MODBUS_ADR_D0_FUNCTION:
;========================================================
;==================MODBUS  �]�ƪ��A======================
;========================================================
MODBUS_ADR_D1_FUNCTION:
;========================================================
;==================MODBUS  �]�ƿ��Ѹ��==================
;========================================================
MODBUS_ADR_D2_FUNCTION:
;========================================================
;==================MODBUS  �ū��˴�======================
;========================================================
MODBUS_ADR_D3_FUNCTION:
;========================================================
;==================MODBUS  �q�y�˴�======================
;========================================================
MODBUS_ADR_D4_FUNCTION:
;========================================================
;==================MODBUS  �q���˴�======================
;========================================================
MODBUS_ADR_D5_FUNCTION:
;========================================================
;==================MODBUS  �W�q��l�Ƴ]�w================
;========================================================
MODBUS_ADR_D6_FUNCTION:
;========================================================
;==================MODBUS  �}�o�H���v���Ұ�==============
;========================================================
MODBUS_ADR_E0_FUNCTION:
;========================================================
;==================MODBUS  ����̤j��{�]�w==============
;========================================================
MODBUS_ADR_E1_FUNCTION:
MODBUS_ADR_E2_FUNCTION:
;========================================================
;==================MODBUS  �L�B�i�Ҧ�====================
;========================================================
MODBUS_ADR_E3_FUNCTION:
;========================================================
;==================MODBUS  ���벾��-�����X===============
;========================================================
MODBUS_ADR_E4_FUNCTION:



;========================================================
;==================MODBUS  �t�׳]�w======================
;========================================================
MODBUS_ADR_E5_FUNCTION:
;========================================================
;==================MODBUS  �t��==========================
;========================================================
MODBUS_ADR_E6_FUNCTION:
    RETFIE

