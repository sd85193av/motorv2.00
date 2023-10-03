;========================================================
;================ Project Information ===================
;========================================================
;Pin Assignment : 
;Project Name   : 
;Project Version: V2.00  (Bate00)
;Project object : 
;Project number : 
;Edit Date      : 2023/04/18        
;--------------------------------------------------------
;======================================================== 
;========================================================
;INCLUDE  TITLE
#include    "MODBUS-RTU.inc"
;======================================================== 
;========================================================
EEPROM_ADR              EQU     0X7E
EEPROM_DAT              EQU     0X7F
ADC_HI_DATA             EQU     0X7C
ADC_LOW_DATA            EQU     0X7D

ACK_COUNTER_TEMP  EQU 0X74
;-------------------------------------------------------
BANK0                   EQU     PORTA
BANK7                   EQU     LATF


;-------------------------------------------------------
;暫存器ONLY NUM(TIMER BASE TIME IS 1mS)
TMR2_DIVIDER_SET        EQU     0X15
TMR2_BASE_SET           EQU     0XA7
TMR2_BASE_NUM           EQU     0X04


MODBUS_DAT_EXTRA_ADRH   EQU     0X20
MODBUS_DAT_EXTRA_ADRL   EQU     0XB0  

MODBUS_DAT_REAL_ADRH    EQU     0X21
MODBUS_DAT_REAL_ADRL    EQU     0X40
;0X21 0X40-0X21 0X54      MOTOR1
;0X21 0X55-0X21 0X69      MOTOR2
;0X21 0X6A-0X21 0X7E      MOTOR3
;0X21 0X7F-0X21 0X93      MOTOR4





;-------------------------------------------------------
;--------------------------------------------------------  
;WATCH用的暫存器設定
WATCH_DAT_BUF_ADRH      EQU     0X20
WATCH_DAT_BUF_ADRL      EQU     0XBA  
WATCH_COUNTER           EQU     0X70
WATCH_BIT_COUNT         EQU     0X71
WATCH_TEMP              EQU     0X72
WATCH_OUT_P             EQU     LATE
WATCH_OUT_DAT           EQU     0X05
WATCH_OUT_CLK           EQU     0X06

;--------------------------------------------------------
;--------------------------------------------------------
;mcu腳位定義
;Pin assignment definition
MOTOR_OE_RST_PORT       EQU     LATA
M_OE                    EQU     0X04
M_RST                   EQU     0X05

ADDR_4_5_PORT           EQU     PORTA
ADDSEL_4                EQU     0X06
ADDSEL_5                EQU     0X07
ADDR_6_7_PORT           EQU     PORTB
ADDSEL_7                EQU     0X06
ADDSEL_6                EQU     0X07


ADDR_0_1_2_3_PORT       EQU     PORTD
ADDSEL_0                EQU     0X00
ADDSEL_1                EQU     0X01
ADDSEL_2                EQU     0X02
ADDSEL_3                EQU     0X03

MAX485_PORT             EQU     LATG
MAX485_SELECT           EQU     0X03

MOTOR_CONTROL_PORT      EQU     LATC
M1_ST                   EQU     0X00
M1_FR                   EQU     0X01
M2_ST                   EQU     0X02
M2_FR                   EQU     0X03              ;0->往光遮端方向 1->反方向
M3_ST                   EQU     0X04
M3_FR                   EQU     0X05
M4_ST                   EQU     0X06
M4_FR                   EQU     0X07

POWER_CHECK_PORT        EQU     PORTB
PWR_DECTET              EQU     0X05              ;0->表示電源沒有進入 1->表示有電源

TEST_PORT               EQU     LATF
TP0_PIN                 EQU     0X00

ENCODER_PORT            EQU     PORTB
M1_ENCODER              EQU     0X01
M2_ENCODER              EQU     0X02
;--------------------------------------------------------	
;--------------------------------------------------------	
;========================================================    
;==================== 0X20 ~ 0X2F =======================    
;========================================================        
;Register definition   
DELAY_TEMP1             EQU     0X20
DELAY_TEMP2             EQU     0X21
DELAY_TEMP3             EQU     0X22

TMR2_BASE_TEMP          EQU     0X23

INT_TIMER_TEMP          EQU     0X24
INT_TIMER_NUM           EQU     0X04

MODULE_ID_DAT           EQU     0X25
CRC_COUNTER_TEMP        EQU     0X26
CAL_DATA_TEMP           EQU     0X27
CRC_HIBYTE              EQU     0X28
CRC_LOBYTE              EQU     0X29
RTU_COUNTER_DATA        EQU     0X2A              ;用來計算MODBUS RTU

CAL_TEMP_HBYTE          EQU     0X2B
CAL_TEMP_LBYTE          EQU     0X2C
TX_DATA_COUNTER         EQU     0X2D              ;整理UART TX傳送的資料數量
ADR_TEST_TEMP           EQU     0X2E


MODBUS_DAT_COUNT        EQU     0X2F
;========================================================    
;==================== 0X30 ~ 0X3F =======================    
;========================================================        
;Register definition   
;--------------------------------------
FLAG1_BANK0             EQU     0X30
CAN_SEND_TX_FLAG        EQU     0X00          ;可以回傳資料FLAG
CAN_WORK_FLAG           EQU     0X01          ;可以動作FLAG
TX_DATA_ERROR_FLAG      EQU     0X02          ;RX資料有錯誤
MANDATORY_WORK_FLAG     EQU     0X03          ;強制命令執行後SET
INT_TRIG_TIME_FLAG      EQU     0X04          ;表示INT地一次觸發啟動INT_TIMER功能
;--------------------------------------------------------
;馬達1為轉向馬達(目前使用在注射泵)
MOTOR1_FLAG0            EQU     0X72
MOTOR_1_WORK            EQU     0X01          ;馬達1收到指令可以進行運作
MOTOR_1_CW              EQU     0X02          ;馬達1順時針
MOTOR_1_CCW             EQU     0X03          ;馬達1逆時針
MOTOR_1_RESET           EQU     0X04
MOTOR_1_ING_ZERO        EQU     0X05
MOTOR_1_HI_ZERO         EQU     0X06
MOTOR_1_IOC_FINISH      EQU     0X07



MOTOR2_FLAG0            EQU     0X32
MOTOR_2_WORK            EQU     0X01
MOTOR_2_CW              EQU     0X02
MOTOR_2_CCW             EQU     0X03
MOTOR_2_RESET           EQU     0X04
MOTOR_2_ING_ZERO        EQU     0X05


MOTOR3_FLAG0            EQU     0X33
MOTOR_3_EN              EQU     0X00

MOTOR4_FLAG0            EQU     0X34
MOTOR_4_EN              EQU     0X00



MOTOR1_FLAG1            EQU     0X35
MOTOR1_IN_ZERO_FLAG     EQU     0X00
MOTOR1_IN_ROAT_FLAG     EQU     0X01


MOTOR2_FLAG1            EQU     0X36
MOTOR2_IN_ZERO_FLAG     EQU     0X00
MOTOR2_IN_ROAT_FLAG     EQU     0X01

MOTOR3_FLAG1            EQU     0X37
MOTOR4_FLAG1            EQU     0X38









;--------------------------------------------------------馬達參數設定
	      
FLAG2_BANK0             EQU     0X39                      ;在通訊判斷使用哪個馬達的情況下使用
NOW_MOTOR_1_FLAG        EQU     0X00
NOW_MOTOR_2_FLAG        EQU     0X01
NOW_MOTOR_3_FLAG        EQU     0X02
NOW_MOTOR_4_FLAG        EQU     0X03
;--------------------------------------------------------
FLAG3_BANK0             EQU     0X3A
NOW_IS_LO_HI_STATUS     EQU     0X00
TEN_TIME_EN             EQU     0X01
MOTOR_IOC_ZERO_FLAG     EQU     0X02
ROAT_MOTOR_IS_HI_FLAG   EQU     0X03
ALL_MOTOR_STOP_FLAG     EQU     0X04                      ;CMD 0X83全部停止動作
;--------------------------------------------------------
MODBUS_ERROR_FLAG       EQU     0X3B
ERROR_01_F              EQU     0X00
ERROR_02_F              EQU     0X01
ERROR_03_F              EQU     0X02
ERROR_04_F              EQU     0X03
ERROR_05_F              EQU     0X04
ERROR_06_F              EQU     0X05








FLAG5_BANK0             EQU     0X3C
RESET_IN_NORMAL_FALG    EQU     0X00
MODBUS_IN_03_F          EQU     0X01                      ;0表示沒有在功能碼03/1表示有在
MODBUS_IN_06_F          EQU     0X02                      ;0表示沒有在功能碼06/1表示有在





;0X3D 0X3E 0X3F



;========================================================    
;==================== 0X40 ~ 0X4F =======================    
;========================================================        
;Register definition
PWM_1_COUNT_DAT           EQU     0X40           ;每次一個PWM就+1
PWM_2_COUNT_DAT           EQU     0X41           ;每次一個PWM就+1
STRONG_STOP_TEMP1         EQU     0X42
STRONG_STOP_TEMP2         EQU     0X43
STRONG_STOP_TEMP3         EQU     0X44
STRONG_STOP_TEMP4         EQU     0X45
;-----------------------------------------------
IOC_COUNTER_HBYTE         EQU     0X46
IOC_COUNTER_LBYTE         EQU     0X47

TEN_MS_NUM                EQU     0X02
TEN_MS_TEMP               EQU     0X48
MODBUS_ERROR_COUNTER      EQU     0X49

MODBUS_TABLE_ADR_TEMP     EQU     0X4A
MODBUS_TABLE_DAT_TEMP     EQU     0X4B

STANDBY_HBYTE_DAT         EQU     0X4C
STANDBY_LBYTE_DAT         EQU     0X4D                        ;用來暫存MODBUS中運算的資料





M1_ZERO_COUNTER_HBYTE     EQU     0X50
M1_ZERO_COUNTER_LBYTE     EQU     0X51
M1_NOT_COUNTER_TEMP       EQU     0X53





TURN_RESET_HBYTE	EQU	0X75	  
TURN_RESET_LBYTE	EQU	0X76
TURN_HBYTE_NUM		EQU	0X23
TURN_LBYTE_NUM		EQU	0XA0





;--------------------------------------------------------------
;------------------------BANK7參數設定-------------------------
;--------------------------------------------------------------
COMMON_DATA_HBYTE       EQU   0X22
COMMON_DATA_LBYTE       EQU   0X30


ADR_80_H_DAT            EQU   0XA0
ADR_80_L_DAT            EQU   0XA1

ADR_81_H_DAT            EQU   0XA2
ADR_81_L_DAT            EQU   0XA3

ADR_82_H_DAT            EQU   0XA4
ADR_82_L_DAT            EQU   0XA5

ADR_83_H_DAT            EQU   0XA6
ADR_83_L_DAT            EQU   0XA7

ADR_84_H_DAT            EQU   0XA8
ADR_84_L_DAT            EQU   0XA9