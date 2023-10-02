;========================================================
;================ Project Information ===================
;========================================================   
;Project Name   : MODBUS RTU BASE  
;-------------------------------------------------------        
;Project Version: 2.00   
;Edit Date      : 2023/09/28
;Function Info  :
;-------------------------------------------------------
;Description of Register Informatione (use FSR)

;MODBUS_DAT_BUF_ADRL+0    : set output byte count ( min = 1 ) 
;MODBUS_DAT_BUF_ADRL+1    : set input byte count  ( min = 0 )
;MODBUS_DAT_BUF_ADRL+2    : BSR temporary(把進入前的BANK存起來)
;MODBUS_DAT_BUF_ADRL+3    : Data offset temporary
;MODBUS_DAT_BUF_ADRL+4    : CRC counter
;MODBUS_DAT_BUF_ADRL+5    : CRC HBYTE
;MODBUS_DAT_BUF_ADRL+6    : CRC LBYTE
;MODBUS_DAT_BUF_ADRL+7    : time out count
;MODBUS_DAT_BUF_ADRL+8    : MODBUS_FLAG

;MODBUS_DAT_BUF_ADRL+A~n  : Output buffer serial addressing
;-------------------------------------------------------
;-------------------------------------------------------  
GLOBAL        SET_MODBUS_MODE_ENABLE  
GLOBAL        MODBUS_INTPUT_FUNCTION
;-------------------------------------------------------       
;須被定義的部分
MODBUS_OUT_P            EQU   LATG
MODBUS_EN               EQU   0X03
;-------------------------------------------------------
MODBUS_DAT_BUF_ADRH     EQU   0X20
MODBUS_DAT_BUF_ADRL     EQU   0XB0       