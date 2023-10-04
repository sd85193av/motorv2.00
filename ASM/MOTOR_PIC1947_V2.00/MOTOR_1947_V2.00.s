;========================================================
;================ Project Information ===================
;========================================================
;Project Name   : MOTOR-MODULE_V2.00 
;Project Version: 
;Project object : 
;Project number : 
;Edit Date      : 
;--------------------------------------------------------
;========================================================
;========================================================
;========================================================
;========================================================
;======== PIC16F1947 Configuration Bit Settings =========
;========================================================  
; PIC16F1947 Configuration Bit Settings
; Assembly source line config statements
; CONFIG1
  CONFIG  FOSC = INTOSC         ; Oscillator Selection (INTOSC oscillator: I/O function on CLKIN pin)
  CONFIG  WDTE = OFF            ; Watchdog Timer Enable (WDT disabled)
  CONFIG  PWRTE = OFF           ; Power-up Timer Enable (PWRT disabled)
  CONFIG  MCLRE = OFF           ; MCLR Pin Function Select (MCLR/VPP pin function is digital input)
  CONFIG  CP = OFF              ; Flash Program Memory Code Protection (Program memory code protection is disabled)
  CONFIG  CPD = OFF             ; Data Memory Code Protection (Data memory code protection is disabled)
  CONFIG  BOREN = OFF           ; Brown-out Reset Enable (Brown-out Reset disabled)
  CONFIG  CLKOUTEN = OFF        ; Clock Out Enable (CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin)
  CONFIG  IESO = OFF            ; Internal/External Switchover (Internal/External Switchover mode is disabled)
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is disabled)

; CONFIG2
  CONFIG  WRT = OFF             ; Flash Memory Self-Write Protection (Write protection off)
  CONFIG  VCAPEN = OFF          ; Voltage Regulator Capacitor Enable (VCAP pin functionality is disabled)
  CONFIG  PLLEN = OFF           ; PLL Enable (4x PLL disabled)
  CONFIG  STVREN = OFF          ; Stack Overflow/Underflow Reset Enable (Stack Overflow or Underflow will not cause a Reset)
  CONFIG  BORV = HI             ; Brown-out Reset Voltage Selection (Brown-out Reset Voltage (Vbor), high trip point selected.)
  CONFIG  LVP = OFF             ; Low-Voltage Programming Enable (High-voltage on MCLR/VPP must be used for programming)
;** ***************************************************************************************
#include    "p16f1947.inc"
#include    "MOTOR_16F1947_PA.inc"
PSECT main, class=CODE,delta=2,SIZE=0800H
   ORG    0X0000
   GOTO   BOOTLOADER_LOOP 
   ORG    0X0004
   GOTO   INTERRUPT_SUB_AREA
;* ****************************************************************************************
;*    Label Start
;* 
;========================================================
;================== BOOTLOADER�Ƶ{�� ====================
;========================================================
BOOTLOADER_LOOP:
    GOTO    SYSTEM_START_SETTING
;========================================================
;================== ���_�Ƶ{���_�l��} ==================
;========================================================
INTERRUPT_SUB_AREA:
PAGESEL     0X0000
BANKSEL     PORTA
;--------------------------
    BTFSC   PIR4,RC2IF
    GOTO    RC2IF_FUNCTION_LOOP                          ;�w��UART2�����
;--------------------------
    BTFSC   PIR1,TMR2IF
    GOTO    TMR2IF_FUNCTION_LOOP                         ;TIMER2��Ǭ�1mS
;--------------------------





;    BTFSC   INTCON,INTF
;    GOTO    INT_INTF_FUNCTION                       ;PWM INT
;;-----------
;    BTFSC   INTCON,IOCIF
;    GOTO    IOC_INT_FUNCTION                        ;���B�_��Ĳ�o
    RETFIE

;******************************************************************************
;****************************TABLE��ϰ�***************************************
;******************************************************************************
;========================================================
;==================���_UART2 FUNCTION====================
;========================================================
MODBUS_ADR_FUNCTION:
    MOVLW   0X00
    MOVWF   PCLATH
    MOVF    MODBUS_TABLE_ADR_TEMP,W
    BRW     
    GOTO    MODBUS_ADR_A0_FUNCTION          ;00
    GOTO    MODBUS_ADR_A1_FUNCTION          ;01
    GOTO    MODBUS_ADR_A2_FUNCTION          ;02
    GOTO    MODBUS_ADR_A3_FUNCTION          ;03
    GOTO    MODBUS_ADR_A4_FUNCTION          ;04
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;05
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;06
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;07
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;08
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;09
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;0A
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;0B
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;0C
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;0D
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;0E
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;0F
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
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;1A
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;1B
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;1C
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;1D
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;1E
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;1F
;-----------------------------
    GOTO    MODBUS_ADR_C0_FUNCTION          ;20
    GOTO    MODBUS_ADR_C1_FUNCTION          ;21
    GOTO    MODBUS_ADR_C2_FUNCTION          ;22
    GOTO    MODBUS_ADR_C3_FUNCTION          ;23
    GOTO    MODBUS_ADR_C4_FUNCTION          ;24
    GOTO    MODBUS_ADR_C5_FUNCTION          ;25
    GOTO    MODBUS_ADR_C6_FUNCTION          ;26
    GOTO    MODBUS_ADR_C7_FUNCTION          ;27
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;28
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;29
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;2A
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;2B
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;2C
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;2D
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;2E
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;2F
;-----------------------------
    GOTO    MODBUS_ADR_D0_FUNCTION          ;30
    GOTO    MODBUS_ADR_D1_FUNCTION          ;31
    GOTO    MODBUS_ADR_D2_FUNCTION          ;32
    GOTO    MODBUS_ADR_D3_FUNCTION          ;33
    GOTO    MODBUS_ADR_D4_FUNCTION          ;34
    GOTO    MODBUS_ADR_D5_FUNCTION          ;35
    GOTO    MODBUS_ADR_D6_FUNCTION          ;36
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;37
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;38
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;39
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;3A
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;3B
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;3C
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;3D
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;3E
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;3F
;-----------------------------
    GOTO    MODBUS_ADR_E0_FUNCTION          ;40
    GOTO    MODBUS_ADR_E1_FUNCTION          ;41
    GOTO    MODBUS_ADR_E2_FUNCTION          ;42
    GOTO    MODBUS_ADR_E3_FUNCTION          ;43
    GOTO    MODBUS_ADR_E4_FUNCTION          ;44
    GOTO    MODBUS_ADR_E5_FUNCTION          ;45
    GOTO    MODBUS_ADR_E6_FUNCTION          ;46
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;47
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;48
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;49
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;4A
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;4B
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;4C
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;4D
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;4E
    GOTO    MODBUS_BUS_02_ERROR_LOOP        ;4F
;-----------------------------


;******************************************************************
;******************************************************************

;========================================================
;==================MODBUS ��_�X�t�]�w===================
;========================================================
MODBUS_ADR_A0_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_01_ERROR_LOOP                  ;�o��D�n�O�T�O�\��X�������u�঳0X03�M0X06���~��
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
    GOTO    MODBUS_ADR_A0_LV1                       ;��Ƥ���0
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_LOOP                ;��Ƴ��O0X00��ܲ��`
MODBUS_ADR_A0_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
;�����]�wTX��X�Ȧs���N�����ϥ�RX�}�C
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    BSF     FLAG6_BANK0,A0_F
    RETFIE

;========================================================
;==================MODBUS �����l��=====================
;========================================================
MODBUS_ADR_A1_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;�p�G�\��X���O06��ܲ��`
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
    GOTO    MODBUS_BUS_03_ERROR_LOOP                    ;��Ƴ��O0X00
MODBUS_ADR_A1_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    RETFIE

;========================================================
;==================MODBUS ���V�֪�l��===================
;========================================================
MODBUS_ADR_A2_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;
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
    GOTO    MODBUS_ADR_A2_LV1
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_LOOP                ;��Ƴ��O0X00
MODBUS_ADR_A2_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    RETFIE
;========================================================
;==================MODBUS �����l��=====================
;========================================================
MODBUS_ADR_A3_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;
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
    GOTO    MODBUS_ADR_A3_LV1
;-----------------------
    INCF    FSR1L,F
    MOVF    INDF1,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_LOOP                ;��Ƴ��O0X00
MODBUS_ADR_A3_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    RETFIE
;========================================================
;==================MODBUS ���ش���=======================
;========================================================
MODBUS_ADR_A4_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;�o��u��μg�AŪ���ܺ�O���`�X02
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_BUS_02_ERROR_LOOP                  ;
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
    GOTO    MODBUS_BUS_03_ERROR_LOOP
;-----------------------
    INCF    FSR1L,F
    MOVLW   0X01
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_03_ERROR_LOOP                ;��Ƴ��O0X00
MODBUS_ADR_A4_LV1:
;�N�Ҧ��ѼƳ]�w���w�]��
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    MOVLW   0X08
    MOVWF   TX_DATA_COUNTER
;------------------------------------------
;��ڭn������:
    RETFIE
;========================================================
;==================MODBUS �ִ��V=========================
;========================================================
MODBUS_ADR_B0_FUNCTION:
    BTFSC   FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    MODBUS_ADR_B0_03_LOOP                           ;ADR ���ִ��V�A�ϥ�READ 1 BYTE �\��X
;--------------------------------
    BTFSS   FLAG5_BANK0,MODBUS_IN_06_F
    GOTO    MODBUS_ADR_B0_06_LOOP                           ;ADR ���ִ��V�A�ϥ�WRITE 1 BYTE �\��X
;--------------------------------
    GOTO    MODBUS_BUS_01_ERROR_LOOP                        ;��ܥ\��X�����O
    RETFIE
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
    GOTO    MODBUS_BUS_03_ERROR_LOOP
;-----------------------
    INCF    FSR1L,F
    MOVLW   0XFE
    ADDWF   INDF1,W
    BTFSC   STATUS,C
    GOTO    MODBUS_BUS_03_ERROR_LOOP                ;��Ƥ��O0X00�N�O0X01�A�W�L�d��N��O���`�X03
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
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L



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








;========================================================
;=============MODBUS TIMEOUT��n�i����R���ʧ@===========
;========================================================
;���TIMEOUT��F�A�i�H�i����R���ʧ@
MODBUS_TIMEOUT_IS_FINISH_LOOP:
    MOVLW   TMR2_BASE_NUM
    MOVWF   TMR2_BASE_TEMP
BANKSEL     RC2STA
    BCF     RC2STA,CREN                           ;�n�i����R��ƫe�A����UART RX�����T�O��Ƥ��|���~
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_EXTRA_ADRH                 ;20B0
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X08                                  ;MODBUS_FLAG
    ADDWF   FSR1L,F
    CLRF    INDF1
;----------------------------------------------------------
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X03                                  ;MODBUS��DATA OFFSET
    ADDWF   FSR1L,F
    MOVF    INDF1,W
    MOVWF   RTU_COUNTER_DATA                      ;�o��o��MODBUS�Ҧ�����Ƽƶq
    MOVWF   MODBUS_DAT_COUNT
    MOVWF   MODBUS_ERROR_COUNTER
    MOVLW   0X02
    SUBWF   RTU_COUNTER_DATA,F
    CLRF    INDF1
;----------------------------------------------------------
;    GOTO    CHECK_CRC16_IS_RIGHT                  ;���Ҧ���CRC-16�O�_���T
GOTO MODBUS_CRC16_CHECK_IS_OK
;===================================================
;============�ƻs485�ǰe����Ƥ@���ѦҰѦ�==========OK
;===================================================
COPY_485_DATA_LOOP:
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F 
;-------------------------
    MOVLW   MODBUS_DAT_WORK_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_WORK_ADRL
    MOVWF   FSR0L  
    MOVF    MODBUS_DAT_COUNT,W
    MOVWF   RTU_COUNTER_DATA                        ;�T�{����`�ƶq
;-------------------------
COPY_485_DATA_LV1:
    MOVF    INDF1,W
    MOVWF   INDF0
    INCF    FSR1L,F
    INCF    FSR0L,F
    DECFSZ  RTU_COUNTER_DATA,F
    GOTO    COPY_485_DATA_LV1
    RETURN
;===================================================
;============MODBUS��CRC16���ҥ��T==================OK
;===================================================
;�o�q��CRC16���Ҥw�g�q�L�F�A�����ư��ӽƻs���ʧ@
MODBUS_CRC16_CHECK_IS_OK:
    CALL    COPY_485_DATA_LOOP
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                        ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                        ;E0
    MOVWF   FSR1L              
;----------------------------------------------------------
    MOVF    INDF1,W
    XORWF   MODULE_ID_DAT,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_ID_ERROR_LOOP          
;----------------------------------------------------------���DEVICE ID ����
;    MOVLW   0X08
;    XORWF   MODBUS_DAT_COUNT,W
;    BTFSS   STATUS,Z
;    GOTO    MODBUS_BUS_ID_ERROR_LOOP                      ;���Ѧ��쪺��Ƽƶq�j��8��ܲ��`
;---------------
    INCF    FSR1L,F                                       ;��Ƭ��\��X
    MOVLW   0X03
    XORWF   INDF1,W
    BTFSC   STATUS,Z
    GOTO    ANAY_MODBUS_CMD_03_LOOP                       ;�\��X�OREAD ONE BYTE
;---------------
    MOVLW   0X06
    XORWF   INDF1,W
    BTFSC   STATUS,Z
    GOTO    ANAY_MODBUS_CMD_06_LOOP                       ;�\��X�OWRITE ONE BYTE
;---------------
    MOVLW   0X10
    XORWF   INDF1,W
    BTFSC   STATUS,Z
    GOTO    ANAY_MODBUS_CMD_10_LOOP                       ;�\��X�OWRITE MORE BYTE
;�ثe�\��X�u����0X03 0X06 0X10�A��L����OERROR CODE 0X01
;===================================================
;============MODBUS���\��X���~=====================OK
;===================================================
;MODBUS RTU ERROR CODE 01
;�D�k�\��A��ܫD���v���\��X
MODBUS_BUS_01_ERROR_LOOP:
    BSF     MODBUS_ERROR_FLAG,ERROR_01_F
    RETFIE
;----------------------------------------
;MODBUS RTU ERROR CODE 02
;�D�k�Ȧs���a�}
MODBUS_BUS_02_ERROR_LOOP:
    BSF     MODBUS_ERROR_FLAG,ERROR_02_F
    RETFIE
;----------------------------------------
;MODBUS RTU ERROR CODE 03
;�D�k��Ƽƭ�
MODBUS_BUS_03_ERROR_LOOP:
    BSF     MODBUS_ERROR_FLAG,ERROR_03_F
    RETFIE
;----------------------------------------
;MODBUS RTU ERROR CODE 04
;�˸m�G�١A���O�ۧ��˴��X�{���`
MODBUS_BUS_04_ERROR_LOOP:
    BSF     MODBUS_ERROR_FLAG,ERROR_04_F
    RETFIE
;----------------------------------------
;MODBUS RTU ERROR CODE 05
;�T�{�A��������O�åB�ߧY����
MODBUS_BUS_05_ERROR_LOOP:
    BSF     MODBUS_ERROR_FLAG,ERROR_05_F
    RETFIE
;----------------------------------------
;MODBUS RTU ERROR CODE 06
;�˸mBUSY�A(��������O�A���]�����b�����L���O�ӵL�k����)
MODBUS_BUS_06_ERROR_LOOP:
    BSF     MODBUS_ERROR_FLAG,ERROR_06_F
    RETFIE
;===================================================
;============MODBUS��ID�άO��Ƽƿ��~===============OK
;===================================================
;�NRX�s���ƪ��Ŷ��M��
MODBUS_BUS_ID_ERROR_LOOP:
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F  
MODBUS_BUS_ID_ERROR_LV1:
    CLRF    INDF1
    INCF    FSR1L,F
    DECFSZ  MODBUS_ERROR_COUNTER,F
    GOTO    MODBUS_BUS_ID_ERROR_LV1
BANKSEL     RC2STA
    BSF     RC2STA,CREN                               ;���s�Ұ�UART RX�\��
    RETFIE
;===================================================
;================����CRC16�O�_���T?=================OK
;===================================================
;�o�q����CRC���ɶ��j����380uS
CHECK_CRC16_IS_RIGHT:
BANKSEL     PORTA
    MOVLW   0XFF
    MOVWF   CRC_HIBYTE
    MOVLW   0XFF
    MOVWF   CRC_LOBYTE
    MOVLW   MODBUS_DAT_EXTRA_ADRH             ;0X20
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL             ;0XB0
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F                          ;�o�̬O�Ĥ@����ƪ���m
CHECK_CRC16_IS_RIGHT_LV1:
    MOVF    INDF1,W
    MOVWF   CAL_DATA_TEMP
    CALL    CRC_16_FUNCTION_LOOP
    INCF    FSR1L,F
    DECFSZ  RTU_COUNTER_DATA,F
    GOTO    CHECK_CRC16_IS_RIGHT_LV1
;----------------------------
    MOVF    CRC_LOBYTE,W
    XORWF   INDF1,W
    BTFSS   STATUS,Z
    GOTO    MODBUS_BUS_ID_ERROR_LOOP          ;CRC16���~�A�Ҳդ����^��
;----------------------------
    INCF    FSR1L,F
    MOVF    CRC_HIBYTE,W
    XORWF   INDF1,W
    BTFSS   STATUS,Z 
    GOTO    MODBUS_BUS_ID_ERROR_LOOP          ;CRC16���~�A�Ҳդ����^��
    GOTO    MODBUS_CRC16_CHECK_IS_OK          ;CRC16���ҥ��T

;========================================================
;=============MODBUS �\��X��0X03========================
;========================================================
;�\��X:0X03��ܭnREAD
;���T�{ADR�O�_�������X�k
ANAY_MODBUS_CMD_03_LOOP:
BANKSEL     PORTA
    MOVLW   0XF1
    ANDWF   FLAG5_BANK0,F
    BSF     FLAG5_BANK0,MODBUS_IN_03_F
    GOTO    ANAY_MODBUS_CMD_COMMON_LOOP  
;========================================================
;=============MODBUS �\��X��0X10========================
;========================================================
;�\��X:0X10�A�o�ӳ������i��g�J�@��WORD����ƩM�\��X0X06�ۦP
;�ҥH�n�h�T�{�O�_�X�k
;���T�{ADR�O�_�������X�k
ANAY_MODBUS_CMD_10_LOOP:
BANKSEL     PORTA
    MOVLW   0XF1
    ANDWF   FLAG5_BANK0,F
    BSF     FLAG5_BANK0,MODBUS_IN_10_F
    GOTO    ANAY_MODBUS_CMD_COMMON_LOOP 
;========================================================
;=============MODBUS �\��X��0X06========================
;========================================================
;�\��X:0X06��ܭnWRITE
;���T�{ADR�O�_�������X�k
ANAY_MODBUS_CMD_06_LOOP:
BANKSEL     PORTA
    MOVLW   0XF1
    ANDWF   FLAG5_BANK0,F
    BSF     FLAG5_BANK0,MODBUS_IN_06_F                        ;���NMODBUS FLAG���s�]�w���\��X06
    ;GOTO    ANAY_MODBUS_CMD_COMMON_LOOP
ANAY_MODBUS_CMD_COMMON_LOOP:
;----------------
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_WORK_ADRH                              ;21
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_WORK_ADRL                              ;E0
    MOVWF   FSR1L                                             ;�o�̬O�Ĥ@����ƪ���m
    MOVLW   0X02                                              
    ADDWF   FSR1L,F
;---------------------------------------------------
    MOVF    INDF1,W
    MOVWF   STANDBY_HBYTE_DAT                                 ;ADR��m��HBYTE
    INCF    FSR1L,F
    MOVF    INDF1,W
    MOVWF   STANDBY_LBYTE_DAT                                 ;ADR��m��LBYTE
;----------------------------------------------------         �N��m��ƥ��ƻs�X��
    MOVLW   0XA0
    SUBWF   STANDBY_LBYTE_DAT,F
    MOVLW   0X00
    SUBWFB  STANDBY_HBYTE_DAT,F
;----------------------------------------------------         �ѩ�᭱�|��TABLE�A�ҥH�q0�}�l�|����n
    MOVF    STANDBY_LBYTE_DAT,W
    MOVWF   MODBUS_TABLE_ADR_TEMP
    GOTO    MODBUS_ADR_FUNCTION                              ;MODBUS ADR TABLE
;----------------------------------------------------------------------------------------------------


;�U���O���e�\��X0X06���ʧ@�Ƶ{��
;;------------------------------------------------
;    MOVLW   0X09
;    XORWF   CAL_TEMP_LBYTE,W
;    BTFSC   STATUS,Z
;    GOTO    STRONG_STOP_FUNCTION
;;------------------------
;    MOVLW   0X00
;    XORWF   CAL_TEMP_LBYTE,W
;    BTFSC   STATUS,Z
;    GOTO    CW_STEP_FUNCTION
;;------------------------
;    MOVLW   0X01
;    XORWF   CAL_TEMP_LBYTE,W
;    BTFSC   STATUS,Z
;    GOTO    CCW_STEP_FUNCTION
;;------------------------
;    MOVLW   0X04
;    XORWF   CAL_TEMP_LBYTE,W
;    BTFSC   STATUS,Z    
;    GOTO    RESET_STEP_FUNCTION
;
;;------------------------------------------------
;ANAY_MODBUS_CMD_06_EXIT:
;    BCF     FLAG2_BANK0,NOW_MOTOR_1_FLAG
;    BCF     FLAG2_BANK0,NOW_MOTOR_2_FLAG
;    BCF     FLAG2_BANK0,NOW_MOTOR_3_FLAG
;    BCF     FLAG2_BANK0,NOW_MOTOR_4_FLAG
;    RETFIE
;
;
;
;;-------------------------------------------
;;-------------0X80�H�W��WRITE CMD-----------
;;-------------------------------------------
;ANAY_MODBUS_WRITE_0X80_LOOP:
;    MOVLW   0X08
;    MOVWF   TX_DATA_COUNTER
;    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
;    MOVLW   0X83
;    XORWF   INDF1,W
;    BTFSC   STATUS,Z
;    CALL    COMMON_CMD_0X83_LOOP
;    GOTO    ANAY_MODBUS_CMD_06_EXIT
;COMMON_CMD_0X83_LOOP:
;    INCF    FSR1L,F
;    INCF    FSR1L,F
;    MOVF    INDF1,W
;    BTFSC   STATUS,Z
;    GOTO    RECOVER_MODULE_LOOP
;BANKSEL     BANK7
;    MOVLW   0X02
;    MOVWF   ADR_83_L_DAT
;    MOVLW   0X02
;    MOVWF   ADR_81_L_DAT
;
;
;RECOVER_MODULE_LOOP_LV1:
;BANKSEL     MOTOR_CONTROL_PORT
;    BCF     MOTOR_CONTROL_PORT,M1_ST
;    BCF     MOTOR_CONTROL_PORT,M2_ST
;BANKSEL     PORTA
;    BSF     FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
;    BCF     MOTOR2_FLAG0,MOTOR_2_RESET
;    BCF     MOTOR1_FLAG0,MOTOR_1_RESET
;    BCF     MOTOR1_FLAG0,MOTOR_1_HI_ZERO
;    BCF     MOTOR1_FLAG0,MOTOR_1_ING_ZERO
;    BCF     FLAG1_BANK0,CAN_WORK_FLAG
;
;    BCF     MOTOR2_FLAG0,MOTOR_2_WORK
;    BCF     MOTOR2_FLAG1,MOTOR2_IN_ZERO_FLAG
;    BCF     MOTOR2_FLAG1,MOTOR2_IN_ROAT_FLAG
;    BCF     FLAG3_BANK0,TEN_TIME_EN
;    BCF     MOTOR1_FLAG1,MOTOR1_IN_ROAT_FLAG
;    BCF     MOTOR1_FLAG1,MOTOR1_IN_ZERO_FLAG
;    BCF     MOTOR1_FLAG0,MOTOR_1_WORK
;
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X07                                      ;CMD 0X13�߰ݥثeMOTOR1���A
;    ADDWF   FSR0L,F
;    MOVLW   0X00
;    MOVWF   INDF0
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X15
;    ADDWF   FSR0L,F
;    MOVLW   0X07
;    ADDWF   FSR0L,F
;    MOVLW   0X00
;    MOVWF   INDF0
;;---------------------------------------------------------------------------
;
;
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;;=============================================
;
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X15
;    ADDWF   FSR0L,F
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;    CLRF    INDF0
;    INCF    FSR0L,F
;;-------------
;    RETURN
;;-----------------------------------------------------
;;����ʧ@
;RECOVER_MODULE_LOOP:
;BANKSEL     BANK7
;    MOVLW   0X00
;    MOVWF   ADR_83_L_DAT
;    MOVLW   0X00
;    MOVWF   ADR_81_L_DAT
;BANKSEL     PORTA
;CALL RECOVER_MODULE_LOOP_LV1
;    BCF     FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
;    RETURN
; 
;
;
;
;
;;--------------------------------------------------------------------------
;;---------------------------------------------------------------------------
;;---------------------------------------------------------------------------
;;========================================================
;;=============ADDR IS 0X04===============================
;;========================================================
;RESET_STEP_FUNCTION:
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_1_FLAG
;    CALL    STRONG_RESET_MOTOR_1_FUNC
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_2_FLAG
;    CALL    STRONG_RESET_MOTOR_2_FUNC
;    GOTO    ANAY_MODBUS_CMD_06_EXIT
;STRONG_RESET_MOTOR_1_FUNC:
;BANKSEL MOTOR_CONTROL_PORT
;BCF     MOTOR_CONTROL_PORT,M1_FR
;BANKSEL PORTA
;    BSF     MOTOR1_FLAG0,MOTOR_1_RESET
;    RETURN
;STRONG_RESET_MOTOR_2_FUNC:
;    BSF     MOTOR2_FLAG0,MOTOR_2_RESET
;    RETURN
;
;
;;========================================================
;;=============ADDR IS 0X00===============================
;;========================================================
;CW_STEP_FUNCTION:
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_1_FLAG
;    CALL    STRONG_CW_MOTOR_1_FUNC
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_2_FLAG
;    CALL    STRONG_CW_MOTOR_2_FUNC
;    GOTO    ANAY_MODBUS_CMD_06_EXIT
;STRONG_CW_MOTOR_1_FUNC:
;BANKSEL MOTOR_CONTROL_PORT
;BCF     MOTOR_CONTROL_PORT,M1_FR
;BANKSEL PORTA
;BSF FLAG5_BANK0,RESET_IN_NORMAL_FALG
;    BSF     MOTOR1_FLAG0,MOTOR_1_RESET
;    BSF     FLAG1_BANK0,CAN_WORK_FLAG
;    BSF     MOTOR1_FLAG0,MOTOR_1_WORK
;    RETURN
;STRONG_CW_MOTOR_2_FUNC:
;    BSF     FLAG1_BANK0,CAN_WORK_FLAG
;    BSF     MOTOR2_FLAG0,MOTOR_2_WORK
;    RETURN
;;========================================================
;;=============ADDR IS 0X01===============================
;;========================================================
;CCW_STEP_FUNCTION:
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_1_FLAG
;    CALL    STRONG_CCW_MOTOR_1_FUNC
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_2_FLAG
;    CALL    STRONG_CCW_MOTOR_2_FUNC
;    GOTO    ANAY_MODBUS_CMD_06_EXIT
;STRONG_CCW_MOTOR_1_FUNC:
;BANKSEL MOTOR_CONTROL_PORT
;BSF     MOTOR_CONTROL_PORT,M1_FR
;BANKSEL PORTA
;BSF FLAG5_BANK0,RESET_IN_NORMAL_FALG
;    BSF     MOTOR1_FLAG0,MOTOR_1_RESET
;    BSF     FLAG1_BANK0,CAN_WORK_FLAG
;    BSF     MOTOR1_FLAG0,MOTOR_1_WORK
;    RETURN
;STRONG_CCW_MOTOR_2_FUNC:
;    BSF     FLAG1_BANK0,CAN_WORK_FLAG
;    BSF     MOTOR2_FLAG0,MOTOR_2_WORK
;    RETURN
;;========================================================
;;=============ADDR IS 0X09===============================
;;========================================================
;STRONG_STOP_FUNCTION:
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_1_FLAG
;    CALL    STRONG_STOP_MOTOR_1_FUNC
;    BTFSC   FLAG2_BANK0,NOW_MOTOR_2_FLAG
;    CALL    STRONG_STOP_MOTOR_2_FUNC
;;    BTFSC   FLAG2_BANK0,NOW_MOTOR_1_FLAG
;;    CALL    STRONG_STOP_MOTOR_1_FUNC
;;    BTFSC   FLAG2_BANK0,NOW_MOTOR_1_FLAG
;;    CALL    STRONG_STOP_MOTOR_1_FUNC
;
;
;    GOTO    ANAY_MODBUS_CMD_06_EXIT
;
;STRONG_STOP_MOTOR_1_FUNC:
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X07
;    ADDWF   FSR0L,F
;    MOVLW   0X04
;    MOVWF   INDF0
;;----------
;    MOVLW   0X01
;    MOVWF   STRONG_STOP_TEMP1
;BANKSEL     MOTOR_CONTROL_PORT
;    BCF     MOTOR_CONTROL_PORT,M1_ST
;BANKSEL     PORTA
;    RETURN
;STRONG_STOP_MOTOR_2_FUNC:
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X15
;    ADDWF   FSR0L,F
;    MOVLW   0X07
;    ADDWF   FSR0L,F
;    MOVLW   0X04
;    MOVWF   INDF0
;;----------
;    MOVLW   0X01
;    MOVWF   STRONG_STOP_TEMP2
;BANKSEL     MOTOR_CONTROL_PORT
;    BCF     MOTOR_CONTROL_PORT,M2_ST
;BANKSEL     PORTA
;    RETURN
;
;
;
;
;
;
;
;;----------------------------------------------------------
;WRITE_MOTOR_1_SOME_DATA:
;    BSF     FLAG2_BANK0,NOW_MOTOR_1_FLAG
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    GOTO    ANAY_MODBUS_CMD_06_LEVEL1
;WRITE_MOTOR_2_SOME_DATA:
;    BSF     FLAG2_BANK0,NOW_MOTOR_2_FLAG
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X15
;    ADDWF   FSR0L,F
;    GOTO    ANAY_MODBUS_CMD_06_LEVEL1
;WRITE_MOTOR_3_SOME_DATA:
;    BSF     FLAG2_BANK0,NOW_MOTOR_3_FLAG
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X2A
;    ADDWF   FSR0L,F
;    GOTO    ANAY_MODBUS_CMD_06_LEVEL1
;WRITE_MOTOR_4_SOME_DATA:
;    BSF     FLAG2_BANK0,NOW_MOTOR_4_FLAG
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X3F
;    ADDWF   FSR0L,F
;    GOTO    ANAY_MODBUS_CMD_06_LEVEL1
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;








;******************************************************************************
;******************************************************************************

;========================================================
;==================���_UART2 FUNCTION====================
;========================================================
RC2IF_FUNCTION_LOOP:
PAGESEL     0X0800
    CALL    MODBUS_INTPUT_FUNCTION                        ;�N��Ʀs�bINDF1
PAGESEL     0X0000
    RETFIE
;========================================================
;==================���_TIMER2 FUNCTION===================
;========================================================
;TIMER2 BASE IS 1mS
TMR2IF_FUNCTION_LOOP:
    BCF     PIR1,TMR2IF
;---------------------    
    BTFSS   FLAG3_BANK0,TEN_TIME_EN
    GOTO    TMR2IF_FUNCTION_LV0
    MOVF    TEN_MS_TEMP,W
    BTFSC   STATUS,Z
    CALL    TEN_MS_FUNCTION_LOOP
    DECF    TEN_MS_TEMP,F
TMR2IF_FUNCTION_LV0:
    BTFSS   FLAG1_BANK0,INT_TRIG_TIME_FLAG
    GOTO    TMR2IF_FUNC_LV1
;---------
    MOVF    INT_TIMER_TEMP,W
    BTFSC   STATUS,Z
    GOTO    TIMER2_INT_LV1
    DECF    INT_TIMER_TEMP,F
TMR2IF_FUNC_LV1:
;�P�_�O�_MODBUS RTU TIMEOUT �n�Ұ�
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X08
    ADDWF   FSR1L,F
    BTFSS   INDF1,0X00
    RETFIE
BANKSEL     PORTA
;-----------------------------------
    DECF    FSR1L,F
    MOVF    INDF1,W
    BTFSS   STATUS,Z
    GOTO    RESET_MODBUS_TIMEOUT_FUNCTION
;-----------------------------------
BANKSEL     PORTA
    MOVF    TMR2_BASE_TEMP,W
    BTFSC   STATUS,Z
    GOTO    MODBUS_TIMEOUT_IS_FINISH_LOOP
;----------------------------------=
    DECF    TMR2_BASE_TEMP,F
    RETFIE
;-------------------------------------------------------
RESET_MODBUS_TIMEOUT_FUNCTION:
;����٬O���򦳦����ơATIME OUT ��ƭ��s
    CLRF    INDF1
    MOVLW   TMR2_BASE_NUM
    MOVWF   TMR2_BASE_TEMP
    RETFIE
;------------------------------------------------------
;INT �ɶ�
TIMER2_INT_LV1:
    MOVLW   INT_TIMER_NUM
    MOVWF   INT_TIMER_TEMP

    INCF    PWM_2_COUNT_DAT,F
    BCF     FLAG1_BANK0,INT_TRIG_TIME_FLAG
    BCF     INTCON,INTF
    BSF     INTCON,INTE
BTFSS MOTOR2_FLAG0,MOTOR_2_ING_ZERO
RETFIE
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X05
    ADDWF   FSR0L,F
    MOVLW   0X01
    SUBWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    SUBWFB  INDF0,F
    RETFIE




TEN_MS_FUNCTION_LOOP:
    MOVLW   TEN_MS_NUM
    MOVWF   TEN_MS_TEMP
    MOVLW   0X01
    ADDWF   IOC_COUNTER_LBYTE,F
    MOVLW   0X00
    ADDWFC  IOC_COUNTER_HBYTE,F
    RETURN




;========================================================
;==================���_IOC   FUNCTION====================
;========================================================
IOC_INT_FUNCTION:
    BCF     INTCON,IOCIF
BANKSEL     IOCBF
    BTFSC   IOCBF,M1_ENCODER
    CALL    IOCBF1_INT_LOOP
;--------
    BTFSC   IOCBF,M2_ENCODER
    CALL    IOCBF2_INT_LOOP
    RETFIE
;----------------------------------------------------------
IOCBF1_INT_LOOP:
    BCF     IOCBF,M1_ENCODER
BANKSEL     IOCBF
    RETURN
IOCBF2_INT_LOOP:
    BCF     IOCBF,M2_ENCODER
BANKSEL     PORTA
    RETURN
;========================================================
;==================���_INT   FUNCTION====================
;========================================================
INT_INTF_FUNCTION:
    BCF     INTCON,INTF
    BTFSC   FLAG1_BANK0,INT_TRIG_TIME_FLAG
    RETFIE
    BSF     FLAG1_BANK0,INT_TRIG_TIME_FLAG
    BCF     INTCON,INTE
    RETFIE



;========================================================
;=============MODBUS �p���CRC �\��======================
;========================================================
MODBUS_RTU_READ_LV2:
BANKSEL     PORTA
    MOVLW   0XFF
    MOVWF   CRC_HIBYTE
    MOVLW   0XFF
    MOVWF   CRC_LOBYTE
;---------
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F                          ;�o�̬O�Ĥ@����ƪ���m
;---------
MODBUS_RTU_READ_CRC_LOOP:
    MOVF    INDF1,W
    MOVWF   CAL_DATA_TEMP
    CALL    CRC_16_FUNCTION_LOOP
    INCF    FSR1L,F
    DECFSZ  RTU_COUNTER_DATA,F
    GOTO    MODBUS_RTU_READ_CRC_LOOP
    MOVF    CRC_LOBYTE,W
    MOVWF   INDF1
    INCF    FSR1L,F
    MOVF    CRC_HIBYTE,W
    MOVWF   INDF1
    RETURN
;========================================================
;================== �D�{�ǫe�ѼƳ]�w ====================
;========================================================
SYSTEM_START_SETTING:	
;========================================================
;=====================�������]�w=========================
;========================================================
BANKSEL     OSCCON
    MOVLW   0X72
    MOVWF   OSCCON                  ;8MHZ
    MOVLW   0X00 
    MOVWF   OSCTUNE                 ;�ե����W�v
    MOVLW   0X11
    MOVWF   OSCSTAT                 ;���W�������0.5%
;========================================================
;=====================OPTION�]�w=========================
;========================================================
    MOVLW   0XC8
    MOVWF   OPTION_REG              ;BIT6 0->rising  1->falling
;========================================================
;======================���_�]�w==========================
;========================================================
    MOVLW   0X40
    MOVWF   INTCON
BANKSEL     PIE1
    MOVLW   0X00
    MOVWF   PIE1                     ;BIT 3 = MSSP 1 INTERRUPT, BIT 5 = USART 1 RECIEVE INTERRUPT
    MOVLW   0X00
    MOVWF   PIE2
    MOVLW   0X00
    MOVWF   PIE3
    MOVLW   0X00
    MOVWF   PIE4
;========================================================
;========================ADC�]�w=========================
;========================================================
BANKSEL     ADCON0
    MOVLW   0X00
    MOVWF   ADCON0
    MOVLW   0X00
    MOVWF   ADCON1
BANKSEL     ANSELA
    CLRF    ANSELA
    CLRF    ANSELE
BANKSEL     ANSELF
    CLRF    ANSELF
    CLRF    ANSELG
BANKSEL     PORTA
;========================================================
;=====================I/O�]�w============================
;========================================================
BANKSEL     TRISA
    MOVLW   0XC0
    MOVWF   TRISA
    MOVLW   0XFF
    MOVWF   TRISB 
    MOVLW   0X00
    MOVWF   TRISC      
    MOVLW   0X0F
    MOVWF   TRISD
    MOVLW   0XFF
    MOVWF   TRISE
BANKSEL     TRISF 
    MOVLW   0X00
    MOVWF   TRISF
    MOVLW   0XF6
    MOVWF   TRISG
;---------------
BANKSEL     LATA 
    MOVLW   0X00
    MOVWF   LATA
    MOVLW   0X00
    MOVWF   LATB
    MOVLW   0X00
    MOVWF   LATC
    MOVLW   0X00
    MOVWF   LATD
    MOVLW   0X00
    MOVWF   LATE
BANKSEL     LATF
    CLRF    LATF
    CLRF    LATG 
;---------------
BANKSEL     PORTA 
    CLRF    PORTA
    CLRF    PORTB
    CLRF    PORTC
    CLRF    PORTD
    CLRF    PORTE
;---------------
BANKSEL     PORTF
    CLRF    PORTF
    CLRF    PORTG
BANKSEL     PORTA
    CALL    DELAY_1000ms
;========================================================
;=====================�Ȧs���]�w=========================
;========================================================
    CALL    CLEAN_ALL_REGISTER
PAGESEL     0X0800
    CALL    SET_MODBUS_MODE_ENABLE                      ;�]�wuart2�w��
PAGESEL     0X0000
;========================================================
;=====================TIMER2�]�w=========================
;========================================================
    CALL    SET_TMR2_BASE_TIME                          ;�]�wTIMER2��¦�ɶ�
    CALL    SET_TMR2_INT_EN                             ;TIMER2���_�Ұ�
    CALL    SET_TMR2_ON                                 ;�Ұ�TIMER2�\��
;========================================================
;=====================ADC�]�w============================
;========================================================
ADC_HW_SETTING:
BANKSEL     ANSELG
    MOVLW   0X10
    MOVWF   ANSELG
;-------------------------ADC_OPEN-------------------------
BANKSEL     ADCON1
    MOVLW   0X31                    ;AN12�Ұ�
    MOVWF   ADCON0
    MOVLW   0XC0
    MOVWF   ADCON1
BANKSEL     PORTA
    CALL    DELAY_100ms
;========================================================
;=====================PWM��X�]�w========================
;========================================================
SETTING_PWM_HW_LOOP:
;-------------------------------------�]�w�۹������}TIMER
BANKSEL     CCPTMRS0
    MOVLW   0XDF								
    MOVWF   CCPTMRS0
    MOVLW   0X0F								
    MOVWF   CCPTMRS1
;-------------------------------------�M�w�g��
BANKSEL     PR4		
    MOVLW   0X9C
    MOVWF   PR4
;-------------------------------------�Ұ�TIMER
BANKSEL		  T4CON								
	  MOVLW	  0X7F								
	  MOVWF   T4CON
;-------------------------------------�M�wDUTY CYCLE
BANKSEL     CCPR3L								
    MOVLW   0X32			    
    MOVWF   CCPR3L
;-------------------------------------�Ұ�PWM
BANKSEL     CCP3CON
    MOVLW   0X0C
    MOVWF   CCP3CON
;========================================================
;=====================IOC�]�w============================
;========================================================
IOC_HW_SETTING:
BANKSEL     IOCBP
    MOVLW   0X00
    MOVWF   IOCBN
    MOVLW   0X00
    MOVWF   IOCBP                   ;���tĲ�o

;;========================================================
;;=====================DIP SWITCH�P�_=====================
;;========================================================
;DIP_SWITCH_ADR_FUNCTION:
;BANKSEL     ADDR_0_1_2_3_PORT
;    BTFSC   ADDR_0_1_2_3_PORT,ADDSEL_0
;    BSF     MOTOR1_FLAG0,MOTOR_1_EN
;;---------
;    BTFSC   ADDR_0_1_2_3_PORT,ADDSEL_1
;    BSF     MOTOR2_FLAG0,MOTOR_2_EN
;;---------
;    BTFSC   ADDR_0_1_2_3_PORT,ADDSEL_2
;    BSF     MOTOR3_FLAG0,MOTOR_3_EN
;;---------
;    BTFSC   ADDR_0_1_2_3_PORT,ADDSEL_3
;    BSF     MOTOR4_FLAG0,MOTOR_4_EN
;---------
;========================================================
;=====================PWM�W�v����========================
;========================================================
CHECK_PWM_FREQ_FUCNTION:
    ;CALL    ADC_TAKE_DATA_FUNCTION


;========================================================
;=====================ID SELECT==========================
;========================================================
;�o��P�_ID������O��ADC RF0���ƭȨӧP�_
ID_SELECT_LOOP:
BANKSEL     PORTA
    CLRF    MODULE_ID_DAT

;========================================================
;===================POWER LED��X========================
;========================================================
POWER_LED_OUTPUT_FUNCTION:
BANKSEL     POWER_CHECK_PORT
    BTFSS   POWER_CHECK_PORT,PWR_DECTET
    GOTO    POWER_LED_OUTPUT_EXIT
BANKSEL     TEST_PORT
    BSF     TEST_PORT,TP0_PIN
POWER_LED_OUTPUT_EXIT:
BANKSEL     PORTA
;--------------------------------------------------------
;--------------------------------------------------------
;========================================================
;=====================INT�]�w============================
;========================================================
INT_HW_SETTING:
BANKSEL     MAX485_PORT 
    BCF     MAX485_PORT,MAX485_SELECT                 ;�NMAX485�]�w��RX�Ҧ�
    BSF     INTCON,INTE
    BSF     INTCON,IOCIE
BANKSEL     PIE4
    BSF     PIE4,RC2IE
    BSF     PIE1,TMR2IE
    BSF     INTCON,GIE
BANKSEL     PORTA
    MOVLW   TEN_MS_NUM
    MOVWF   TEN_MS_TEMP
    MOVLW   INT_TIMER_NUM
    MOVWF   INT_TIMER_TEMP
   ; MOVLW   0X06
    ;MOVWF   MODULE_ID_DAT
BANKSEL     MOTOR_OE_RST_PORT
    BSF     MOTOR_OE_RST_PORT,M_OE
    BSF     MOTOR_OE_RST_PORT,M_RST
    BCF     MOTOR_CONTROL_PORT,M1_ST
    BCF     MOTOR_CONTROL_PORT,M2_ST
    BCF     MOTOR_CONTROL_PORT,M1_FR
    BCF     MOTOR_CONTROL_PORT,M2_FR
BANKSEL     PORTA
MOVLW 0X04
MOVWF MODULE_ID_DAT
GOTO SYSTEM_START




 



;********************************************************************************
;********************************************************************************
;========================================================
;=====================�D�{�ǰj��=========================
;========================================================
SYSTEM_START:
BANKSEL     PORTA
;    BTFSC   PORTE,0X00
;    GOTO    MOTOR_2_WORK1
;    GOTO    MOTOR_2_STOP
;BANKSEL     PORTA
SYSTEM_START_LV1:
;-------------------------------------------                      �ǰeERROR CODE���a��
    BTFSC   MODBUS_ERROR_FLAG,ERROR_01_F
    CALL    MODBUS_ERROR_CODE_01_LOOP
    BTFSC   MODBUS_ERROR_FLAG,ERROR_02_F
    CALL    MODBUS_ERROR_CODE_02_LOOP
    BTFSC   MODBUS_ERROR_FLAG,ERROR_03_F
    CALL    MODBUS_ERROR_CODE_03_LOOP
    BTFSC   MODBUS_ERROR_FLAG,ERROR_04_F
    CALL    MODBUS_ERROR_CODE_04_LOOP
    BTFSC   MODBUS_ERROR_FLAG,ERROR_05_F
    CALL    MODBUS_ERROR_CODE_05_LOOP
    BTFSC   MODBUS_ERROR_FLAG,ERROR_06_F
    CALL    MODBUS_ERROR_CODE_06_LOOP
;-------------------------------------------
    BTFSC   FLAG1_BANK0,CAN_SEND_TX_FLAG
    CALL    PREPARE_TX_DATA_LOOP                            ;UART TX�ǰe���
;-------------------------------------------
    GOTO    SYSTEM_START










;;-----------
;    BTFSC   FLAG1_BANK0,CAN_WORK_FLAG
;    CALL    MODULE_WORK_LOOP                        ;���f�న�F�ʧ@
;;-----------
;
;    BTFSC   MOTOR2_FLAG0,MOTOR_2_RESET
;    CALL    MOTOR_2_ZERO_FUNCTION
;    BTFSC   MOTOR2_FLAG0,MOTOR_2_ING_ZERO
;    CALL    CHECK_MOTOR2_ZERO_LOOP
;;--------------------------------------
;    BTFSC   MOTOR1_FLAG0,MOTOR_1_RESET
;    CALL    MOTOR_1_ZERO_FUNCTION
;    BTFSC   MOTOR1_FLAG0,MOTOR_1_HI_ZERO
;    CALL    MOTOR1_ZERO_IN_HI_LOOP
;    BTFSC   MOTOR1_FLAG0,MOTOR_1_ING_ZERO
;    CALL    MOTOR1_ZERO_IN_LO_LOOP
;    GOTO    SYSTEM_START
;;--------------------------------------

;MOTOR_2_WORK1:
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X15
;    ADDWF   FSR0L,F
;    MOVLW   0X0F
;    ADDWF   FSR0L,F
;    MOVLW   0X00
;    MOVWF   INDF0
;    GOTO    SYSTEM_START_LV1
;MOTOR_2_STOP:
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X15
;    ADDWF   FSR0L,F
;    MOVLW   0X0F
;    ADDWF   FSR0L,F
;    MOVLW   0XFF
;    MOVWF   INDF0
;    GOTO    SYSTEM_START_LV1




;========================================================
;=====================�`�g���F�_�짹��===================
;========================================================
CHECK_MOTOR2_ZERO_LOOP:
BTFSC FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
RETURN  
BTFSC MOTOR2_FLAG1,MOTOR2_IN_ROAT_FLAG
RETURN
    BTFSC   PORTE,0X00
    RETURN
BANKSEL     MOTOR_CONTROL_PORT
    BCF     MOTOR_CONTROL_PORT,M2_ST
BANKSEL     PORTA
    CLRF    STRONG_STOP_TEMP2
BANKSEL     PORTA
    BCF     MOTOR2_FLAG0,MOTOR_2_ING_ZERO
    BCF     MOTOR2_FLAG1,MOTOR2_IN_ZERO_FLAG
;-----------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X04
    ADDWF   FSR0L,F
    CLRF    INDF0
    INCF    FSR0L,F
    CLRF    INDF0
;---------------------------------------------�M���֥[�B��


    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X00
    MOVWF   INDF0

BANKSEL BANK7
    MOVLW   0X00
    MOVWF   ADR_81_L_DAT
BANKSEL PORTA
    RETURN
;--------------------------------------------
MOTOR1_ZERO_IN_LO_LOOP:
BTFSC FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
RETURN  
BTFSC MOTOR1_FLAG1,MOTOR1_IN_ROAT_FLAG
RETURN
    BTFSS   PORTB,0X02
    GOTO    MOTOR1_TIME_ZERO_LOOP


MOVLW 0X01
ADDWF M1_ZERO_COUNTER_LBYTE,F
MOVLW 0X00
ADDWFC M1_ZERO_COUNTER_HBYTE,F
MOVLW 0XFD
ADDWF M1_ZERO_COUNTER_HBYTE,W
BTFSS STATUS,C
RETURN
MOVLW 0X0C
ADDWF M1_ZERO_COUNTER_LBYTE,W
BTFSS STATUS,C
RETURN

;    MOVF    IOC_COUNTER_HBYTE,W
;    BTFSS   STATUS,Z
;    GOTO    MOTOR1_ZERO_IN_LO_LOOP_LV1
;;------
;    MOVLW   0XFE
;    ADDWF   IOC_COUNTER_LBYTE,W
;    BTFSS   STATUS,C
;    RETURN
MOTOR1_ZERO_IN_LO_LOOP_LV1:
BANKSEL     MOTOR_CONTROL_PORT
    BCF     MOTOR_CONTROL_PORT,M1_ST
BANKSEL     PORTA
    BCF     MOTOR1_FLAG0,MOTOR_1_IOC_FINISH
    BCF     MOTOR1_FLAG0,MOTOR_1_ING_ZERO
    BCF     FLAG3_BANK0,TEN_TIME_EN
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X00
    MOVWF   INDF0
;----------
    MOVLW   0X00
    MOVWF   STRONG_STOP_TEMP1
    BCF MOTOR1_FLAG1,MOTOR1_IN_ZERO_FLAG
BANKSEL BANK7
    MOVLW   0X00
    MOVWF   ADR_81_L_DAT
BANKSEL PORTA
BTFSC FLAG5_BANK0,RESET_IN_NORMAL_FALG
GOTO RESET_END_IN_NORMAL_LOOP
;BANKSEL     IOCBN
;    BSF     IOCBN,0X02
;    BCF     IOCBP,0X02
;BANKSEL     PORTA


    RETURN
;-------------------------------------------------------------
;-------------------------------------------------------------
MOTOR1_ZERO_IN_HI_LOOP:

BTFSC FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
RETURN  


BTFSC MOTOR1_FLAG1,MOTOR1_IN_ROAT_FLAG
RETURN




    BTFSC PORTB,0X02
    GOTO  MOTOR1_TIME_ZERO_LOOP
MOVLW 0X01
ADDWF M1_ZERO_COUNTER_LBYTE,F
MOVLW 0X00
ADDWFC M1_ZERO_COUNTER_HBYTE,F

MOVLW 0XFD
ADDWF M1_ZERO_COUNTER_HBYTE,W
BTFSS STATUS,C
RETURN
MOVLW 0X0C
ADDWF M1_ZERO_COUNTER_LBYTE,W
BTFSS STATUS,C
RETURN


;    MOVF    IOC_COUNTER_HBYTE,W
;    BTFSS   STATUS,Z
;    GOTO    MOTOR1_ZERO_IN_HI_LOOP_LV1
;;------
;    MOVLW   0XFE
;    ADDWF   IOC_COUNTER_LBYTE,W
;    BTFSS   STATUS,C
;    RETURN
MOTOR1_ZERO_IN_HI_LOOP_LV1:
    BCF     MOTOR1_FLAG0,MOTOR_1_IOC_FINISH
    BCF     MOTOR1_FLAG0,MOTOR_1_HI_ZERO
    GOTO    MOTOR_1_NOW_IS_LO
    
MOTOR1_TIME_ZERO_LOOP:
    ;CLRF    IOC_COUNTER_HBYTE
    ;CLRF    IOC_COUNTER_LBYTE
INCF  M1_NOT_COUNTER_TEMP,F
MOVLW 0X9C
ADDWF M1_NOT_COUNTER_TEMP,W
BTFSS STATUS,C
RETURN
CLRF M1_NOT_COUNTER_TEMP
CLRF M1_ZERO_COUNTER_LBYTE
CLRF M1_ZERO_COUNTER_HBYTE
    RETURN
;========================================================
;=====================��V���F�_��=======================
;========================================================
MOTOR_1_ZERO_FUNCTION:
BTFSC FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
RETURN  
BTFSC MOTOR1_FLAG1,MOTOR1_IN_ROAT_FLAG
RETURN
BSF MOTOR1_FLAG1,MOTOR1_IN_ZERO_FLAG
BANKSEL BANK7
    MOVLW   0X01
    MOVWF   ADR_81_L_DAT
BANKSEL PORTA
    BCF     MOTOR1_FLAG0,MOTOR_1_RESET
;-----------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X04
    MOVWF   INDF0
;----------
    MOVLW   0X01
    MOVWF   STRONG_STOP_TEMP1
BANKSEL     MOTOR_CONTROL_PORT
    BSF     MOTOR_CONTROL_PORT,M1_ST
    ;BCF     MOTOR_CONTROL_PORT,M1_FR
; BSF     MOTOR_CONTROL_PORT,M1_FR
BANKSEL     PORTA
    BTFSC   PORTB,0X02
    GOTO    MOTOR_1_NOW_IS_HI                          ;�ثe�OHI
MOTOR_1_NOW_IS_LO:                                     ;�ثe�OLO
BANKSEL     PORTA
    BSF     MOTOR1_FLAG0,MOTOR_1_ING_ZERO
    BCF     MOTOR1_FLAG0,MOTOR_1_HI_ZERO
    BSF     FLAG3_BANK0,TEN_TIME_EN
    CLRF    IOC_COUNTER_HBYTE
    CLRF    IOC_COUNTER_LBYTE
CLRF M1_ZERO_COUNTER_HBYTE
CLRF M1_ZERO_COUNTER_LBYTE
CLRF M1_NOT_COUNTER_TEMP
    RETURN
MOTOR_1_NOW_IS_HI:
BANKSEL     PORTA
    BSF     MOTOR1_FLAG0,MOTOR_1_HI_ZERO
    BCF     MOTOR1_FLAG0,MOTOR_1_ING_ZERO
    BSF     FLAG3_BANK0,TEN_TIME_EN
    CLRF    IOC_COUNTER_HBYTE
    CLRF    IOC_COUNTER_LBYTE
CLRF M1_ZERO_COUNTER_HBYTE
CLRF M1_ZERO_COUNTER_LBYTE
CLRF M1_NOT_COUNTER_TEMP
    RETURN












;========================================================
;=====================�`�g���F�_��i�椤=================
;========================================================
MOTOR_2_ZERO_FUNCTION:
BTFSC FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
RETURN  
BTFSC MOTOR2_FLAG1,MOTOR2_IN_ROAT_FLAG
RETURN
    BCF     MOTOR2_FLAG0,MOTOR_2_RESET
BTFSS PORTE,0X00
RETURN
BANKSEL BANK7
    MOVLW   0X01
    MOVWF   ADR_81_L_DAT
BANKSEL     PORTA
BSF MOTOR2_FLAG1,MOTOR2_IN_ZERO_FLAG
;    MOVLW   MODBUS_DAT_REAL_ADRH
;    MOVWF   FSR0H
;    MOVLW   MODBUS_DAT_REAL_ADRL
;    MOVWF   FSR0L
;    MOVLW   0X15
;    ADDWF   FSR0L,F
;    MOVLW   0X0F
;    ADDWF   FSR0L,F
;    MOVLW   0X00
;    MOVWF   INDF0
;------------------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X01
    MOVWF   INDF0



BANKSEL     MOTOR_CONTROL_PORT
    BCF     MOTOR_CONTROL_PORT,M2_FR
    BSF     MOTOR_CONTROL_PORT,M2_ST
BANKSEL     PORTA
BSF MOTOR2_FLAG0,MOTOR_2_ING_ZERO
    RETURN







;========================================================
;===============MODBUS ERROR CODE IS 01==================
;========================================================
MODBUS_ERROR_CODE_01_LOOP:
    BCF     MODBUS_ERROR_FLAG,ERROR_01_F
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
;---------------------
    INCF    FSR1L,F
    MOVLW   0X80
    IORWF   INDF1,F
    INCF    FSR1L,F
    MOVLW   0X01
    MOVWF   INDF1
;--------------------
MODBUS_ERROR_CODE_END:
    MOVLW   0X03
    MOVWF   RTU_COUNTER_DATA
    CALL    MODBUS_RTU_READ_LV2
    MOVLW   0X05
    MOVWF   TX_DATA_COUNTER
    BSF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    RETURN
;========================================================
;===============MODBUS ERROR CODE IS 02==================
;========================================================
MODBUS_ERROR_CODE_02_LOOP:
    BCF     MODBUS_ERROR_FLAG,ERROR_02_F
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
;---------------------
    INCF    FSR1L,F
    MOVLW   0X80
    IORWF   INDF1,F
    INCF    FSR1L,F
    MOVLW   0X02
    MOVWF   INDF1
;--------------------
    GOTO    MODBUS_ERROR_CODE_END
;========================================================
;===============MODBUS ERROR CODE IS 03==================
;========================================================
MODBUS_ERROR_CODE_03_LOOP:
    BCF     MODBUS_ERROR_FLAG,ERROR_03_F
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
;---------------------
    INCF    FSR1L,F
    MOVLW   0X80
    IORWF   INDF1,F
    INCF    FSR1L,F
    MOVLW   0X03
    MOVWF   INDF1
;--------------------
    GOTO    MODBUS_ERROR_CODE_END
;========================================================
;===============MODBUS ERROR CODE IS 04==================
;========================================================
MODBUS_ERROR_CODE_04_LOOP:
    BCF     MODBUS_ERROR_FLAG,ERROR_04_F
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
;---------------------
    INCF    FSR1L,F
    MOVLW   0X80
    IORWF   INDF1,F
    INCF    FSR1L,F
    MOVLW   0X04
    MOVWF   INDF1
;--------------------
    GOTO    MODBUS_ERROR_CODE_END
;========================================================
;===============MODBUS ERROR CODE IS 05==================
;========================================================
MODBUS_ERROR_CODE_05_LOOP:
    BCF     MODBUS_ERROR_FLAG,ERROR_05_F
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
;---------------------
    INCF    FSR1L,F
    MOVLW   0X80
    IORWF   INDF1,F
    INCF    FSR1L,F
    MOVLW   0X05
    MOVWF   INDF1
;--------------------
    GOTO    MODBUS_ERROR_CODE_END
;========================================================
;===============MODBUS ERROR CODE IS 06==================
;========================================================
MODBUS_ERROR_CODE_06_LOOP:
    BCF     MODBUS_ERROR_FLAG,ERROR_06_F
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
;---------------------
    INCF    FSR1L,F
    MOVLW   0X80
    IORWF   INDF1,F
    INCF    FSR1L,F
    MOVLW   0X06
    MOVWF   INDF1
;--------------------
    GOTO    MODBUS_ERROR_CODE_END
;********************************************************************************
;********************************************************************************
;========================================================
;================����MODULE�ʧ@�Ƶ{��====================
;========================================================
MODULE_WORK_LOOP:
BTFSC FLAG3_BANK0,ALL_MOTOR_STOP_FLAG
RETURN  
;    BTFSC   MOTOR1_FLAG0,MOTOR_1_EN
;    CALL    MOTOR_1_WORKING_LOOP
;;-----
;    BTFSC   MOTOR2_FLAG0,MOTOR_2_EN
;    CALL    MOTOR_2_WORKING_LOOP
;-----
;    BTFSC   FLAG0_BANK0,MOTOR_1_EN
;    CALL    MOTOR_1_WORKING_LOOP
;;-----
;    BTFSC   FLAG0_BANK0,MOTOR_1_EN
;    CALL    MOTOR_1_WORKING_LOOP
;-----
    RETURN
;========================================================
;================���F1�ʧ@�Ƶ{��=========================
;========================================================
MOTOR_1_WORKING_LOOP:
;BTFSC MOTOR1_FLAG1,MOTOR1_IN_ZERO_FLAG
;RETURN
    BTFSS   MOTOR1_FLAG0,MOTOR_1_WORK
    RETURN
;BSF MOTOR1_FLAG1,MOTOR1_IN_ROAT_FLAG
BANKSEL BANK7
    MOVLW   0X01
    MOVWF   ADR_81_L_DAT
BANKSEL PORTA
    RETURN



    BTFSC   MOTOR1_FLAG0,MOTOR_1_CW
    GOTO    MOTOR_1_WORK_CW_LV1
    BTFSC   MOTOR1_FLAG0,MOTOR_1_CCW
    GOTO    MOTOR_1_WORK_CCW_LV1


;----------------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LOOP
;-------------
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LOOP
;-------------
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LOOP
;-------------
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LOOP
;-------------
RESET_END_IN_NORMAL_LOOP:
    BCF     MOTOR1_FLAG0,MOTOR_1_WORK
    BCF     FLAG3_BANK0,TEN_TIME_EN
    CLRF    IOC_COUNTER_HBYTE
    CLRF    IOC_COUNTER_LBYTE
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X07                                      ;CMD 0X13�߰ݥثeMOTOR1���A
    ADDWF   FSR0L,F
    MOVLW   0X00
    MOVWF   INDF0
BCF MOTOR1_FLAG1,MOTOR1_IN_ROAT_FLAG
BANKSEL BANK7
    MOVLW   0X00
    MOVWF   ADR_81_L_DAT
BANKSEL PORTA
;----------
    RETURN
;========================================================
;================���F1���ɰw�Ƶ{��=======================
;========================================================
MOTOR_1_WORK_CW_LOOP:
BANKSEL PORTB
BTFSS PORTB,0X02
RETURN
BANKSEL     MOTOR_CONTROL_PORT
    BSF     MOTOR_CONTROL_PORT,M1_ST
    BCF     MOTOR_CONTROL_PORT,M1_FR
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X01
    MOVWF   INDF0
;----------

    CLRF    PWM_1_COUNT_DAT
    BSF     MOTOR1_FLAG0,MOTOR_1_CW
    BSF     FLAG3_BANK0,TEN_TIME_EN
    CLRF    IOC_COUNTER_HBYTE
    CLRF    IOC_COUNTER_LBYTE


BTFSC PORTB,0X02
GOTO MOTOR_1_CW_IOC_SET_HI
BCF FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
;BTFSC PORTB,0X02
;GOTO MOTOR_1_CW_IOC_SET_HI
;BANKSEL     IOCBN
;    BCF     IOCBN,0X02
;    BSF     IOCBP,0X02
;BANKSEL     PORTA
MOTOR_1_WORK_CW_LV1:
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
;----------------------------------
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LV3
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LV3
    GOTO    MOTOR_1_WORK_CW_FINISH
MOTOR_1_WORK_CW_LV3:
;BANKSEL PORTF
;BSF PORTF,0X01
;BCF PORTF,0X01
;BANKSEL PORTA
;    MOVF    PWM_1_COUNT_DAT,W
;    BTFSC   STATUS,Z
;    RETURN
BTFSS FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
GOTO CHECK_IOC_IS_LO
GOTO CHECK_IOC_IS_HI
MOTOR_1_WORK_CW_LV4:
;BANKSEL PORTF
;BSF PORTF,0X01
;BCF PORTF,0X01
BANKSEL PORTA
    CLRF    PWM_1_COUNT_DAT
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
;----------------------------------
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LV2
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LV2
MOTOR_1_WORK_CW_FINISH:
;BANKSEL PORTF
;BSF PORTF,0X00
;BCF PORTF,0X00
;BANKSEL PORTA
BANKSEL     MOTOR_CONTROL_PORT
    BCF     MOTOR_CONTROL_PORT,M1_ST
BANKSEL     PORTA
    BCF     MOTOR1_FLAG0,MOTOR_1_CW
    RETURN
MOTOR_1_WORK_CW_LV2:
BANKSEL PORTA
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    INCF    FSR0L,F
    MOVLW   0X01
    SUBWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    SUBWFB  INDF0,F
;----------------------------------------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X05
    ADDWF   FSR0L,F
    MOVLW   0X01
    ADDWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    ADDWFC  INDF0,F
    RETURN
;----------------------------------------------------------
MOTOR_1_CW_IOC_SET_HI:
    BSF     FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
    GOTO    MOTOR_1_WORK_CW_LV1
CHECK_IOC_IS_HI:
    BTFSC   PORTB,0X02
    RETURN

    MOVF    IOC_COUNTER_HBYTE,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LV5
;------
    MOVLW   0XFE
    ADDWF   IOC_COUNTER_LBYTE,W
    BTFSS   STATUS,C
    RETURN
    GOTO    MOTOR_1_WORK_CW_LV5
MOTOR_1_WORK_CW_LV5:
;BANKSEL PORTF
;BSF PORTF,0X00
;BCF PORTF,0X00
BANKSEL PORTA
    CLRF    IOC_COUNTER_HBYTE
    CLRF    IOC_COUNTER_LBYTE
    BCF     FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
    RETURN
;-----------------------------------------------
CHECK_IOC_IS_LO:
    BTFSS   PORTB,0X02
    RETURN
    MOVF    IOC_COUNTER_HBYTE,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CW_LV4
;------
    MOVLW   0XFE
    ADDWF   IOC_COUNTER_LBYTE,W
    BTFSS   STATUS,C
    RETURN
    GOTO    MOTOR_1_WORK_CW_LV4

;========================================================
;================���F1�f�ɰw�Ƶ{��=======================
;========================================================
MOTOR_1_WORK_CCW_LOOP:
BANKSEL     MOTOR_CONTROL_PORT
    BSF     MOTOR_CONTROL_PORT,M1_ST
    BSF     MOTOR_CONTROL_PORT,M1_FR
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X01
    MOVWF   INDF0
;----------
BTFSS PORTB,0X02
RETURN
    CLRF    PWM_1_COUNT_DAT
    BSF     MOTOR1_FLAG0,MOTOR_1_CCW
    BSF     FLAG3_BANK0,TEN_TIME_EN
    CLRF    IOC_COUNTER_HBYTE
    CLRF    IOC_COUNTER_LBYTE

BTFSC PORTB,0X02
GOTO MOTOR_1_CCW_IOC_SET_HI
BCF FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
MOTOR_1_WORK_CCW_LV1:
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X02
    ADDWF   FSR0L,F
;----------------------------------
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LV3
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LV3
    GOTO    MOTOR_1_WORK_CCW_FINISH
;----------------------------------
MOTOR_1_WORK_CCW_LV3:
;    MOVF    PWM_1_COUNT_DAT,W
;    BTFSC   STATUS,Z
;    RETURN
BTFSS FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
GOTO CHECKC_IOC_IS_LO
GOTO CHECKC_IOC_IS_HI
MOTOR_1_WORK_CCW_LV4:
    CLRF    PWM_1_COUNT_DAT
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X02
    ADDWF   FSR0L,F
;----------------------------------
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LV2
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LV2
MOTOR_1_WORK_CCW_FINISH:

BANKSEL     MOTOR_CONTROL_PORT
    BCF     MOTOR_CONTROL_PORT,M1_ST
BANKSEL     PORTA
    BCF     MOTOR1_FLAG0,MOTOR_1_CCW
    RETURN
MOTOR_1_WORK_CCW_LV2:
BANKSEL PORTA
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
MOVLW 0X03
ADDWF FSR0L,F
    MOVLW   0X01
    SUBWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    SUBWFB  INDF0,F
;----------------------------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X05
    ADDWF   FSR0L,F
    MOVLW   0X01
    SUBWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    SUBWFB  INDF0,F
    RETURN


MOTOR_1_CCW_IOC_SET_HI:
BSF FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
    GOTO    MOTOR_1_WORK_CCW_LV1

CHECKC_IOC_IS_HI:
    BTFSC   PORTB,0X02
    RETURN
    MOVF    IOC_COUNTER_HBYTE,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LV5
;------
    MOVLW   0XFE
    ADDWF   IOC_COUNTER_LBYTE,W
    BTFSS   STATUS,C
    RETURN
    GOTO    MOTOR_1_WORK_CCW_LV5
MOTOR_1_WORK_CCW_LV5:
BCF FLAG3_BANK0,ROAT_MOTOR_IS_HI_FLAG
RETURN


CHECKC_IOC_IS_LO:
    BTFSS   PORTB,0X02
    RETURN
    MOVF    IOC_COUNTER_HBYTE,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_1_WORK_CCW_LV4
;------
    MOVLW   0XFE
    ADDWF   IOC_COUNTER_LBYTE,W
    BTFSS   STATUS,C
    RETURN
    GOTO    MOTOR_1_WORK_CCW_LV4
;========================================================
;================���F2�ʧ@�Ƶ{��=========================
;========================================================
MOTOR_2_WORKING_LOOP:
BTFSC MOTOR2_FLAG1,MOTOR2_IN_ZERO_FLAG
RETURN
    BTFSS   MOTOR2_FLAG0,MOTOR_2_WORK
    RETURN
BANKSEL BANK7
    MOVLW   0X01
    MOVWF   ADR_81_L_DAT
BANKSEL PORTA
BSF MOTOR2_FLAG1,MOTOR2_IN_ROAT_FLAG
    BTFSC   MOTOR2_FLAG0,MOTOR_2_CW
    GOTO    MOTOR_2_WORK_CW_LV1
    BTFSC   MOTOR2_FLAG0,MOTOR_2_CCW
    GOTO    MOTOR_2_WORK_CCW_LV1
;----------------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
;----------
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CW_LOOP
;-------------
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CW_LOOP
;-------------
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CCW_LOOP
;-------------
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CCW_LOOP
;-------------
MOTOR_2_IOC_STOP_LOOP:
BANKSEL PORTA
    BCF     MOTOR2_FLAG0,MOTOR_2_WORK
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X00
    MOVWF   INDF0
;----------
BCF MOTOR2_FLAG1,MOTOR2_IN_ROAT_FLAG
BANKSEL BANK7
    MOVLW   0X00
    MOVWF   ADR_81_L_DAT
BANKSEL PORTA
    RETURN


;========================================================
;================���F2���ɰw�Ƶ{��=======================
;========================================================
MOTOR_2_WORK_CW_LOOP:
BANKSEL     MOTOR_CONTROL_PORT
    BSF     MOTOR_CONTROL_PORT,M2_ST
    BCF     MOTOR_CONTROL_PORT,M2_FR
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X01                            ;MOTOR 2 IS WORKING
    MOVWF   INDF0
;----------
    CLRF    PWM_2_COUNT_DAT
    BSF     MOTOR2_FLAG0,MOTOR_2_CW
MOTOR_2_WORK_CW_LV1:

    BTFSS   PORTE,0X00
    GOTO    MOTOR_2_WORK_CW_FINISH


    MOVF    PWM_2_COUNT_DAT,W
    BTFSC   STATUS,Z
    RETURN
    CLRF    PWM_2_COUNT_DAT
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
;----------------------------------
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CW_LV2
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CW_LV2
MOTOR_2_WORK_CW_FINISH:
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
;----------
    CLRF    INDF0
    INCF    FSR0L,F
    CLRF    INDF0
;-------------------------------
BANKSEL     MOTOR_CONTROL_PORT
    BCF     MOTOR_CONTROL_PORT,M2_ST
BANKSEL     PORTA
    BCF     MOTOR2_FLAG0,MOTOR_2_CW
    RETURN
MOTOR_2_WORK_CW_LV2:
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
;------------
    INCF    FSR0L,F
    MOVLW   0X01
    SUBWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    SUBWFB  INDF0,F
;------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X05
    ADDWF   FSR0L,F
    MOVLW   0X01
    SUBWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    SUBWFB  INDF0,F
    RETURN
;========================================================
;================���F2�f�ɰw�Ƶ{��=======================
;========================================================
MOTOR_2_WORK_CCW_LOOP:
BANKSEL     MOTOR_CONTROL_PORT
    BSF     MOTOR_CONTROL_PORT,M2_ST
    BSF     MOTOR_CONTROL_PORT,M2_FR
BANKSEL     PORTA
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X07
    ADDWF   FSR0L,F
    MOVLW   0X01                                        ;���F���b�B�@��
    MOVWF   INDF0
;----------
    CLRF    PWM_2_COUNT_DAT
    BSF     MOTOR2_FLAG0,MOTOR_2_CCW
MOTOR_2_WORK_CCW_LV1:

    MOVF    PWM_2_COUNT_DAT,W
    BTFSC   STATUS,Z
    RETURN
    CLRF    PWM_2_COUNT_DAT
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X02
    ADDWF   FSR0L,F
;----------------------------------
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CCW_LV2
    INCF    FSR0L,F
    MOVF    INDF0,W
    BTFSS   STATUS,Z
    GOTO    MOTOR_2_WORK_CCW_LV2
MOTOR_2_WORK_CCW_FINISH:
BANKSEL     MOTOR_CONTROL_PORT
    BCF     MOTOR_CONTROL_PORT,M2_ST
BANKSEL     PORTA
    BCF     MOTOR2_FLAG0,MOTOR_2_CCW
    RETURN
MOTOR_2_WORK_CCW_LV2:
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    ;INCF    FSR0L,F
MOVLW 0X03
ADDWF FSR0L,F
    MOVLW   0X01
    SUBWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    SUBWFB  INDF0,F
;-------------------------
    MOVLW   MODBUS_DAT_REAL_ADRH
    MOVWF   FSR0H
    MOVLW   MODBUS_DAT_REAL_ADRL
    MOVWF   FSR0L
    MOVLW   0X15
    ADDWF   FSR0L,F
    MOVLW   0X05
    ADDWF   FSR0L,F
    MOVLW   0X01
    ADDWF   INDF0,F
    DECF    FSR0L,F
    MOVLW   0X00
    ADDWFC  INDF0,F
    RETURN
;========================================================
;====================�ǳ�TX��ưƵ{��====================
;========================================================
PREPARE_TX_DATA_LOOP:
BANKSEL     PORTA
    CALL    DELAY_10ms
    MOVLW   MODBUS_DAT_EXTRA_ADRH
    MOVWF   FSR1H
    MOVLW   MODBUS_DAT_EXTRA_ADRL
    MOVWF   FSR1L
    MOVLW   0X0A
    ADDWF   FSR1L,F
BANKSEL     MAX485_PORT
    BSF     MAX485_PORT,MAX485_SELECT
BANKSEL     PORTA
;---------------------------------------------
TEST_MAX485_LOOP1:
BANKSEL     TX2STA
    BTFSS   TX2STA,TRMT
    GOTO    TEST_MAX485_LOOP1
BANKSEL     TX2REG
    MOVF    INDF1,W
    MOVWF   TX2REG
BANKSEL     PORTA
    INCF    FSR1L,F
    DECFSZ  TX_DATA_COUNTER,F
    GOTO    TEST_MAX485_LOOP1
TEST_MAX485_LOOP1_LV1:
BANKSEL     TX2STA
    BTFSS   TX2STA,TRMT
    GOTO    TEST_MAX485_LOOP1_LV1
BANKSEL     MAX485_PORT
    BCF     MAX485_PORT,MAX485_SELECT
BANKSEL     RC2STA
    BSF     RC2STA,CREN                                     ;�Ұ�UART RX�\��
BANKSEL     PORTA
    BCF     FLAG1_BANK0,CAN_SEND_TX_FLAG
    RETURN
;========================================================
;=====================ADC����ưƵ{��====================
;========================================================
ADC_TAKE_DATA_FUNCTION:
BANKSEL     ADCON1
    MOVLW   0X31                    ;AN12�Ұ�
    MOVWF   ADCON0
    MOVLW   0XC0
    MOVWF   ADCON1
    CLRF    ADC_HI_DATA
    CLRF    ADC_LOW_DATA
BANKSEL     PORTA
    CALL    DELAY_100us
    CALL    DELAY_100us
    CALL    DELAY_100us
BANKSEL			ADCON0
;;------------------------ADC_RUN-------------------------------
  	BSF  		ADCON0,0X01
ADC_WORK:
  	BTFSC		ADCON0,0X01
    GOTO  	ADC_WORK
BANKSEL			ADRESH
    MOVF   	ADRESH,W
    MOVWF 	ADC_HI_DATA
    MOVF		ADRESL,W
    MOVWF		ADC_LOW_DATA
BANKSEL     PORTA
    RETURN






;========================================================
;====================���եαN��ưe�X====================OK
;========================================================
;�o�ӳ����O��ܤ�����ƪ��Ƶ{��
WATCH_SUB_FUNCTION:
    MOVLW   WATCH_DAT_BUF_ADRH
    MOVWF   FSR0H
    MOVLW   WATCH_DAT_BUF_ADRL
    MOVWF   FSR0L
    MOVLW   0X08
    MOVWF   WATCH_BIT_COUNT
    MOVF    INDF0,W
    MOVWF   WATCH_TEMP
WATCH_SUB_FUNC_LV1:
BANKSEL     WATCH_OUT_P
    BCF     WATCH_OUT_P,WATCH_OUT_CLK
    BTFSC   WATCH_TEMP,0X07
    BSF     WATCH_OUT_P,WATCH_OUT_DAT
    BTFSS   WATCH_TEMP,0X07
    BCF     WATCH_OUT_P,WATCH_OUT_DAT
    BSF     WATCH_OUT_P,WATCH_OUT_CLK
    RLF     WATCH_TEMP,F
    DECFSZ  WATCH_BIT_COUNT,F
    GOTO    WATCH_SUB_FUNC_LV1
;----------
    MOVLW   0X08
    MOVWF   WATCH_BIT_COUNT
    INCF    FSR0L,F
    MOVF    INDF0,W
    MOVWF   WATCH_TEMP
    DECFSZ  WATCH_COUNTER,F
    GOTO    WATCH_SUB_FUNC_LV1
    BCF     WATCH_OUT_P,WATCH_OUT_DAT
    BCF     WATCH_OUT_P,WATCH_OUT_CLK
BANKSEL     PORTA
    RETURN
;========================================================
;====================CRC-16�B��Ƶ{��====================OK
;========================================================
;���@��BYTE�j��40-50uS
CRC_16_FUNCTION_LOOP:
BANKSEL     PORTA
    MOVF    CAL_DATA_TEMP,W
    XORWF   CRC_LOBYTE,F
;---------
    MOVLW   0X09
    MOVWF   CRC_COUNTER_TEMP
CRC_16_FUNCTION_LV1:
    DECF    CRC_COUNTER_TEMP,F
    MOVF    CRC_COUNTER_TEMP,W
    BTFSC   STATUS,Z
    GOTO    CRC_16_END_FUNCTION
;---------------------
    BCF     STATUS,C
    RRF     CRC_HIBYTE,F
    RRF     CRC_LOBYTE,F
    BTFSS   STATUS,C
    GOTO    CRC_16_FUNCTION_LV1
;---------------------
    MOVLW   0XA0                            ;CRC-16�B�⪺�Ѽ�
    XORWF   CRC_HIBYTE,F
    MOVLW   0X01
    XORWF   CRC_LOBYTE,F
    GOTO    CRC_16_FUNCTION_LV1
CRC_16_END_FUNCTION:
BANKSEL     PORTA
    RETURN


;=======================================================
;===============���ձN���쪺�����ܥX==================OK
;=======================================================
AAAA_1800:
MOVLW 0X08
MOVWF 0X70
AAAAN:
BANKSEL LATF
BCF   LATF,0X04
;----------------
BTFSC 0X71,0X07
BSF   LATF,0X05
BTFSS 0X71,0X07
BCF   LATF,0X05
;----------------
BSF   LATF,0X04
RLF   0X71,F
DECFSZ  0X70,F
GOTO  AAAAN
BCF   LATF,0X04
BCF   LATF,0X05
BANKSEL PORTA
RETURN
;=======================================================
;================TIMER2��¦�ɶ��]�w=====================OK
;======================================================= 
;TIMER2 BASE TIME IS 1mS
SET_TMR2_BASE_TIME:
BANKSEL     T2CON
    MOVLW   TMR2_DIVIDER_SET
    MOVWF   T2CON  
    MOVLW   TMR2_BASE_SET
    MOVWF   PR2
;---------------------
    MOVLW   TMR2_BASE_NUM
    MOVWF   TMR2_BASE_TEMP
BANKSEL     PORTA
    RETURN
;=======================================================
;===============TIMER2���_�ѼƳ]�w======================OK
;=======================================================
SET_TMR2_INT_EN:
BANKSEL     PIE1
    BSF     PIE1,TMR2IE
BANKSEL     PORTA
    RETURN
;=======================================================
;===================TIMER2�Ұ�==========================OK
;=======================================================
SET_TMR2_ON:
BANKSEL     T2CON
    BSF     T2CON,TMR2ON
BANKSEL     PORTA
    RETURN
;========================================================
;=================�NREG����ƥ����M��====================OK
;========================================================							  
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
;=======================================================
;===================== ŪEEPROM ========================OK
;=======================================================
READ_EEPROM:
BANKSEL     EEADRL 
    MOVF    EEPROM_ADR,W
    MOVWF   EEADRL
    BCF     EECON1,CFGS  ;USER EEPROM
    BCF     EECON1,EEPGD ;USER EEPROM
    BSF     EECON1,RD    ;READ_EEPROM
    MOVF    EEDATL,W     
    MOVWF   EEPROM_DAT
BANKSEL     PORTA
    RETURN
;=======================================================
;===================== �gEEPROM ========================OK
;=======================================================
WRITE_EEPROM:
    BCF     INTCON,GIE
BANKSEL     EEADRL 
    MOVF    EEPROM_ADR,W
    MOVWF   EEADRL                             ;EEPROM ADDRESS
    MOVF    EEPROM_DAT,W
    MOVWF   EEDATL                             ;EEPROM DATA
;;-----------------------
WRITE_EEPROM_LOOP_1:
    BCF     EECON1,CFGS                        ;USER EEPROM
    BCF     EECON1,EEPGD                       ;USER EEPROM
    BSF     EECON1,WREN                        ;ENABLE WRITE
    MOVLW   0X55                               ;�T�w�{��
    MOVWF   EECON2 
    MOVLW   0XAA        
    MOVWF   EECON2                             ;�T�w�{��
;;-----------------------
    BSF     EECON1,WR                          ;RUN WRITE EEPROM
WAIT_EEPROM_WRITE_OVER:
    BTFSC   EECON1,WR
    GOTO    WAIT_EEPROM_WRITE_OVER
BANKSEL     EECON1
    BCF     EECON1,WREN                        ;Disable writes
BANKSEL     PORTA
    BSF     INTCON,GIE
    RETURN
;========================================================
;======================== DELAY =========================OK
;========================================================
;DEFINE IS 8MHZ
DELAY_3000ms:
    CALL    DELAY_1000ms
    CALL    DELAY_1000ms
DELAY_1000ms:
    CALL    DELAY_500ms
DELAY_500ms:
    CALL    DELAY_100ms
    CALL    DELAY_100ms
    CALL    DELAY_100ms
    CALL    DELAY_100ms
DELAY_100ms:
    CALL    DELAY_20ms
    CALL    DELAY_40ms
DELAY_40ms:
    CALL    DELAY_20ms
DELAY_20ms:
    CALL    DELAY_10ms
DELAY_10ms:
    CALL    DELAY_5ms
DELAY_5ms:
    CALL    DELAY_1ms
DELAY_4ms:
    CALL    DELAY_1ms
DELAY_3ms:
    CALL    DELAY_1ms
DELAY_2ms:
    CALL    DELAY_1ms
DELAY_1ms:
    MOVLW   0X31
    MOVWF   DELAY_TEMP1  ;49
    MOVWF   DELAY_TEMP2  ;49
    MOVLW   0X0A
    MOVWF   DELAY_TEMP3
    GOTO    DELAY_LOOP_1
DELAY_LOOP_1:
    NOP                   ;1
    DECFSZ  DELAY_TEMP1,F  ;2
    GOTO    DELAY_LOOP_1   ;3,4 (0.5*4*49 = 98us)
    MOVF    DELAY_TEMP2,W  ;4
    MOVWF   DELAY_TEMP1    ;1
    DECFSZ  DELAY_TEMP3,F  ;2
    GOTO    DELAY_LOOP_1   ;3,4 
    RETURN
;==========================================
DELAY_600us:
    CALL    DELAY_100us
DELAY_500us:
    CALL    DELAY_100us
DELAY_400us:
    CALL    DELAY_100us
DELAY_300us:
    CALL    DELAY_100us
DELAY_200us:
    CALL    DELAY_100us
DELAY_100us:
    CALL    DELAY_10us
DELAY_90us:
    CALL    DELAY_10us
    CALL    DELAY_10us
    CALL    DELAY_10us
DELAY_60us:
    CALL    DELAY_10us
DELAY_50us:
    CALL    DELAY_10us
DELAY_40us:
    CALL    DELAY_10us
DELAY_30us:
    CALL    DELAY_10us
DELAY_20us:
    CALL    DELAY_10us
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

