PROCESSOR 16F1947
        LIST

;==========================================================================
;  MPASM PIC16LF1947 processor include
; 
;  (c) Copyright 1999-2013 Microchip Technology, All rights reserved
;==========================================================================

        NOLIST

;==========================================================================
;  This header file defines configurations, registers, and other useful
;  bits of information for the PIC16LF1947 microcontroller.  These names
;  are taken to match the data sheets as closely as possible.
;
;  Note that the processor must be selected before this file is included.
;  The processor may be selected the following ways:
;
;       1. Command line switch:
;               C:\MPASM MYFILE.ASM /PIC16LF1947
;       2. LIST directive in the source file
;               LIST   P=PIC16LF1947
;       3. Processor Type entry in the MPASM full-screen interface
;       4. Setting the processor in the MPLAB Project Dialog
;==========================================================================

;==========================================================================
;
;       Verify Processor
;
;==========================================================================
     ;   IFNDEF __16LF1947
     ;      MESSG "Processor-header file mismatch.  Verify selected processor."
     ;   ENDIF



;==========================================================================
;
;       Register Definitions
;
;==========================================================================

;W                EQU  0000H
;F                EQU  0001H

;----- Register Files -----------------------------------------------------

;-----Bank0------------------
INDF0            EQU  0000H
INDF1            EQU  0001H
PCL              EQU  0002H
STATUS           EQU  0003H
;FSR0             EQU  0004H
FSR0L            EQU  0004H
FSR0H            EQU  0005H
;FSR1             EQU  0006H
FSR1L            EQU  0006H
FSR1H            EQU  0007H
BSR              EQU  0008H
WREG             EQU  0009H
PCLATH           EQU  000AH
INTCON           EQU  000BH
PORTA            EQU  000CH
PORTB            EQU  000DH
PORTC            EQU  000EH
PORTD            EQU  000FH
PORTE            EQU  0010H
PIR1             EQU  0011H
PIR2             EQU  0012H
PIR3             EQU  0013H
PIR4             EQU  0014H
TMR0             EQU  0015H
TMR1             EQU  0016H
TMR1L            EQU  0016H
TMR1H            EQU  0017H
T1CON            EQU  0018H
T1GCON           EQU  0019H
TMR2             EQU  001AH
PR2              EQU  001BH
T2CON            EQU  001CH
CPSCON0          EQU  001EH
CPSCON1          EQU  001FH

;-----Bank1------------------
TRISA            EQU  008CH
TRISB            EQU  008DH
TRISC            EQU  008EH
TRISD            EQU  008FH
TRISE            EQU  0090H
PIE1             EQU  0091H
PIE2             EQU  0092H
PIE3             EQU  0093H
PIE4             EQU  0094H
OPTION_REG       EQU  0095H
PCON             EQU  0096H
WDTCON           EQU  0097H
OSCTUNE          EQU  0098H
OSCCON           EQU  0099H
OSCSTAT          EQU  009AH
ADRES            EQU  009BH
ADRESL           EQU  009BH
ADRESH           EQU  009CH
ADCON0           EQU  009DH
ADCON1           EQU  009EH

;-----Bank2------------------
LATA             EQU  010CH
LATB             EQU  010DH
LATC             EQU  010EH
LATD             EQU  010FH
LATE             EQU  0110H
CM1CON0          EQU  0111H
CM1CON1          EQU  0112H
CM2CON0          EQU  0113H
CM2CON1          EQU  0114H
CMOUT            EQU  0115H
BORCON           EQU  0116H
FVRCON           EQU  0117H
DACCON0          EQU  0118H
DACCON1          EQU  0119H
SRCON0           EQU  011AH
SRCON1           EQU  011BH
APFCON           EQU  011DH
CM3CON0          EQU  011EH
CM3CON1          EQU  011FH

;-----Bank3------------------
ANSELA           EQU  018CH
ANSELE           EQU  0190H
EEADR            EQU  0191H
EEADRL           EQU  0191H
EEADRH           EQU  0192H
EEDAT            EQU  0193H
EEDATL           EQU  0193H
EEDATH           EQU  0194H
EECON1           EQU  0195H
EECON2           EQU  0196H
RC1REG           EQU  0199H
RCREG            EQU  0199H
TX1REG           EQU  019AH
TXREG            EQU  019AH
SP1BRGL          EQU  019BH
SPBRG            EQU  019BH
SPBRGL           EQU  019BH
SP1BRGH          EQU  019CH
SPBRGH           EQU  019CH
RC1STA           EQU  019DH
RCSTA            EQU  019DH
TX1STA           EQU  019EH
TXSTA            EQU  019EH
BAUD1CON         EQU  019FH

;-----Bank4------------------
WPUB             EQU  020DH
SSP1BUF          EQU  0211H
SSPBUF           EQU  0211H
SSP1ADD          EQU  0212H
SSPADD           EQU  0212H
SSP1MSK          EQU  0213H
SSPMSK           EQU  0213H
SSP1STAT         EQU  0214H
SSPSTAT          EQU  0214H
SSP1CON1         EQU  0215H
SSPCON           EQU  0215H
SSPCON1          EQU  0215H
SSP1CON2         EQU  0216H
SSPCON2          EQU  0216H
SSP1CON3         EQU  0217H
SSPCON3          EQU  0217H
SSP2BUF          EQU  0219H
SSP2ADD          EQU  021AH
SSP2MSK          EQU  021BH
SSP2STAT         EQU  021CH
SSP2CON1         EQU  021DH
SSP2CON2         EQU  021EH
SSP2CON3         EQU  021FH

;-----Bank5------------------
PORTF            EQU  028CH
PORTG            EQU  028DH
CCPR1L           EQU  0291H
CCPR1H           EQU  0292H
CCP1CON          EQU  0293H
PWM1CON          EQU  0294H
CCP1AS           EQU  0295H
ECCP1AS          EQU  0295H
PSTR1CON         EQU  0296H
CCPR2L           EQU  0298H
CCPR2H           EQU  0299H
CCP2CON          EQU  029AH
PWM2CON          EQU  029BH
CCP2AS           EQU  029CH
ECCP2AS          EQU  029CH
PSTR2CON         EQU  029DH
CCPTMRS0         EQU  029EH
CCPTMRS1         EQU  029FH

;-----Bank6------------------
TRISF            EQU  030CH
TRISG            EQU  030DH
CCPR3L           EQU  0311H
CCPR3H           EQU  0312H
CCP3CON          EQU  0313H
PWM3CON          EQU  0314H
CCP3AS           EQU  0315H
ECCP3AS          EQU  0315H
PSTR3CON         EQU  0316H
CCPR4L           EQU  0318H
CCPR4H           EQU  0319H
CCP4CON          EQU  031AH
CCPR5L           EQU  031CH
CCPR5H           EQU  031DH
CCP5CON          EQU  031EH

;-----Bank7------------------
LATF             EQU  038CH
LATG             EQU  038DH
IOCBP            EQU  0394H
IOCBN            EQU  0395H
IOCBF            EQU  0396H

;-----Bank8------------------
ANSELF           EQU  040CH
ANSELG           EQU  040DH
TMR4             EQU  0415H
PR4              EQU  0416H
T4CON            EQU  0417H
TMR6             EQU  041CH
PR6              EQU  041DH
T6CON            EQU  041EH

;-----Bank9------------------
WPUG             EQU  048DH
RC2REG           EQU  0491H
TX2REG           EQU  0492H
SP2BRGL          EQU  0493H
SPBRG2           EQU  0493H
SP2BRGH          EQU  0494H
RC2STA           EQU  0495H
TX2STA           EQU  0496H
BAUD2CON         EQU  0497H

;-----Bank15------------------
LCDCON           EQU  0791H
LCDPS            EQU  0792H
LCDREF           EQU  0793H
LCDCST           EQU  0794H
LCDRL            EQU  0795H
LCDSE0           EQU  0798H
LCDSE1           EQU  0799H
LCDSE2           EQU  079AH
LCDSE3           EQU  079BH
LCDSE4           EQU  079CH
LCDSE5           EQU  079DH
LCDDATA0         EQU  07A0H
LCDDATA1         EQU  07A1H
LCDDATA2         EQU  07A2H
LCDDATA3         EQU  07A3H
LCDDATA4         EQU  07A4H
LCDDATA5         EQU  07A5H
LCDDATA6         EQU  07A6H
LCDDATA7         EQU  07A7H
LCDDATA8         EQU  07A8H
LCDDATA9         EQU  07A9H
LCDDATA10        EQU  07AAH
LCDDATA11        EQU  07ABH
LCDDATA12        EQU  07ACH
LCDDATA13        EQU  07ADH
LCDDATA14        EQU  07AEH
LCDDATA15        EQU  07AFH
LCDDATA16        EQU  07B0H
LCDDATA17        EQU  07B1H
LCDDATA18        EQU  07B2H
LCDDATA19        EQU  07B3H
LCDDATA20        EQU  07B4H
LCDDATA21        EQU  07B5H
LCDDATA22        EQU  07B6H
LCDDATA23        EQU  07B7H

;-----Bank31------------------
STATUS_SHAD      EQU  0FE4H
WREG_SHAD        EQU  0FE5H
BSR_SHAD         EQU  0FE6H
PCLATH_SHAD      EQU  0FE7H
FSR0L_SHAD       EQU  0FE8H
FSR0H_SHAD       EQU  0FE9H
FSR1L_SHAD       EQU  0FEAH
FSR1H_SHAD       EQU  0FEBH
STKPTR           EQU  0FEDH
TOSL             EQU  0FEEH
TOSH             EQU  0FEFH

;----- STATUS Bits -----------------------------------------------------
C                EQU  0000H
DC               EQU  0001H
Z                EQU  0002H
NOT_PD           EQU  0003H
NOT_TO           EQU  0004H


;----- BSR Bits -----------------------------------------------------
BSR0             EQU  0000H
BSR1             EQU  0001H
BSR2             EQU  0002H
BSR3             EQU  0003H
BSR4             EQU  0004H



;----- INTCON Bits -----------------------------------------------------
IOCIF            EQU  0000H
INTF             EQU  0001H
TMR0IF           EQU  0002H
IOCIE            EQU  0003H
INTE             EQU  0004H
TMR0IE           EQU  0005H
PEIE             EQU  0006H
GIE              EQU  0007H

T0IF             EQU  0002H
T0IE             EQU  0005H


;----- PORTA Bits -----------------------------------------------------
RA0              EQU  0000H
RA1              EQU  0001H
RA2              EQU  0002H
RA3              EQU  0003H
RA4              EQU  0004H
RA5              EQU  0005H
RA6              EQU  0006H
RA7              EQU  0007H

AN0              EQU  0000H
AN1              EQU  0001H
AN2              EQU  0002H
AN3              EQU  0003H
AN4              EQU  0005H

CPS0             EQU  0000H
CPS1             EQU  0001H
CPS2             EQU  0002H
CPS3             EQU  0003H
CPS4             EQU  0005H

SEG33            EQU  0000H
SEG18            EQU  0001H
SEG34            EQU  0002H
SEG35            EQU  0003H
SEG14            EQU  0004H
SEG15            EQU  0005H
SEG36            EQU  0006H
SEG37            EQU  0007H

VREFM            EQU  0002H
VREFP            EQU  0003H
T0CKI            EQU  0004H
OSC2             EQU  0006H
OSC1             EQU  0007H

CLKOUT           EQU  0006H
CLKIN            EQU  0007H


;----- PORTB Bits -----------------------------------------------------
RB0              EQU  0000H
RB1              EQU  0001H
RB2              EQU  0002H
RB3              EQU  0003H
RB4              EQU  0004H
RB5              EQU  0005H
RB6              EQU  0006H
RB7              EQU  0007H

SEG30            EQU  0000H
SEG8             EQU  0001H
SEG9             EQU  0002H
SEG10            EQU  0003H
SEG11            EQU  0004H
SEG29            EQU  0005H
SEG38            EQU  0006H
SEG39            EQU  0007H

SRI              EQU  0000H
T1G              EQU  0005H

FLT0             EQU  0000H


;----- PORTC Bits -----------------------------------------------------
RC0              EQU  0000H
RC1              EQU  0001H
RC2              EQU  0002H
RC3              EQU  0003H
RC4              EQU  0004H
RC5              EQU  0005H
RC6              EQU  0006H
RC7              EQU  0007H

SEG40            EQU  0000H
SEG32            EQU  0001H
SEG13            EQU  0002H
SEG17            EQU  0003H
SEG16            EQU  0004H
SEG12            EQU  0005H
SEG27            EQU  0006H
SEG28            EQU  0007H

T1OSO            EQU  0000H
T1OSI            EQU  0001H
SCK1             EQU  0003H
SDI1             EQU  0004H
SDO1             EQU  0005H
TX1              EQU  0006H
RX1              EQU  0007H

T1CKI            EQU  0000H
CCP2_PORTC       EQU  0001H
CCP1             EQU  0002H
SCL1             EQU  0003H
SDA1             EQU  0004H
CK1              EQU  0006H
DT1              EQU  0007H

P2A_PORTC        EQU  0001H
P1A              EQU  0002H


;----- PORTD Bits -----------------------------------------------------
RD0              EQU  0000H
RD1              EQU  0001H
RD2              EQU  0002H
RD3              EQU  0003H
RD4              EQU  0004H
RD5              EQU  0005H
RD6              EQU  0006H
RD7              EQU  0007H

SEG0             EQU  0000H
SEG1             EQU  0001H
SEG2             EQU  0002H
SEG3             EQU  0003H
SEG4             EQU  0004H
SEG5             EQU  0005H
SEG6             EQU  0006H
SEG7             EQU  0007H

P2D              EQU  0000H
P2C              EQU  0001H
P2B              EQU  0002H
P3C              EQU  0003H
P3B              EQU  0004H
P1C              EQU  0005H
P1B              EQU  0006H

SDO2             EQU  0004H
SDI2             EQU  0005H
SCK2             EQU  0006H
NOT_SS2          EQU  0007H

SDA2             EQU  0005H
SCL2             EQU  0006H


;----- PORTE Bits -----------------------------------------------------
RE0              EQU  0000H
RE1              EQU  0001H
RE2              EQU  0002H
RE3              EQU  0003H
RE4              EQU  0004H
RE5              EQU  0005H
RE6              EQU  0006H
RE7              EQU  0007H

VLCD1            EQU  0000H
VLCD2            EQU  0001H
VLCD3            EQU  0002H
COM0             EQU  0003H
COM1             EQU  0004H
COM2             EQU  0005H
COM3             EQU  0006H
SEG31            EQU  0007H

P2D              EQU  0000H
P2C              EQU  0001H
P2B              EQU  0002H
P3C              EQU  0003H
P3B              EQU  0004H
P1C              EQU  0005H
P1B              EQU  0006H
P2A_PORTE        EQU  0007H

CCP2_PORTE       EQU  0007H


;----- PIR1 Bits -----------------------------------------------------
TMR1IF           EQU  0000H
TMR2IF           EQU  0001H
CCP1IF           EQU  0002H
SSP1IF           EQU  0003H
TX1IF            EQU  0004H
RC1IF            EQU  0005H
ADIF             EQU  0006H
TMR1GIF          EQU  0007H

SSPIF            EQU  0003H
TXIF             EQU  0004H
RCIF             EQU  0005H


;----- PIR2 Bits -----------------------------------------------------
CCP2IF           EQU  0000H
C3IF             EQU  0001H
LCDIF            EQU  0002H
BCLIF            EQU  0003H
EEIF             EQU  0004H
C1IF             EQU  0005H
C2IF             EQU  0006H
OSFIF            EQU  0007H


;----- PIR3 Bits -----------------------------------------------------
TMR4IF           EQU  0001H
TMR6IF           EQU  0003H
CCP3IF           EQU  0004H
CCP4IF           EQU  0005H
CCP5IF           EQU  0006H


;----- PIR4 Bits -----------------------------------------------------
SSP2IF           EQU  0000H
BCL2IF           EQU  0001H
TX2IF            EQU  0004H
RC2IF            EQU  0005H


;----- T1CON Bits -----------------------------------------------------
TMR1ON           EQU  0000H
NOT_T1SYNC       EQU  0002H
T1OSCEN          EQU  0003H
T1CKPS0          EQU  0004H
T1CKPS1          EQU  0005H
TMR1CS0          EQU  0006H
TMR1CS1          EQU  0007H



;----- T1GCON Bits -----------------------------------------------------
T1GSS0           EQU  0000H
T1GSS1           EQU  0001H
T1GVAL           EQU  0002H
T1GGO_NOT_DONE   EQU  0003H
T1GSPM           EQU  0004H
T1GTM            EQU  0005H
T1GPOL           EQU  0006H
TMR1GE           EQU  0007H

T1GGO            EQU  0003H


;----- T2CON Bits -----------------------------------------------------
T2CKPS0          EQU  0000H
T2CKPS1          EQU  0001H
TMR2ON           EQU  0002H
T2OUTPS0         EQU  0003H
T2OUTPS1         EQU  0004H
T2OUTPS2         EQU  0005H
T2OUTPS3         EQU  0006H



;----- CPSCON0 Bits -----------------------------------------------------
T0XCS            EQU  0000H
CPSOUT           EQU  0001H
CPSRNG0          EQU  0002H
CPSRNG1          EQU  0003H
CPSRM            EQU  0006H
CPSON            EQU  0007H



;----- CPSCON1 Bits -----------------------------------------------------
CPSCH0           EQU  0000H
CPSCH1           EQU  0001H
CPSCH2           EQU  0002H
CPSCH3           EQU  0003H
CPSCH4           EQU  0004H



;----- TRISA Bits -----------------------------------------------------
TRISA0           EQU  0000H
TRISA1           EQU  0001H
TRISA2           EQU  0002H
TRISA3           EQU  0003H
TRISA4           EQU  0004H
TRISA5           EQU  0005H
TRISA6           EQU  0006H
TRISA7           EQU  0007H


;----- TRISB Bits -----------------------------------------------------
TRISB0           EQU  0000H
TRISB1           EQU  0001H
TRISB2           EQU  0002H
TRISB3           EQU  0003H
TRISB4           EQU  0004H
TRISB5           EQU  0005H
TRISB6           EQU  0006H
TRISB7           EQU  0007H


;----- TRISC Bits -----------------------------------------------------
TRISC0           EQU  0000H
TRISC1           EQU  0001H
TRISC2           EQU  0002H
TRISC3           EQU  0003H
TRISC4           EQU  0004H
TRISC5           EQU  0005H
TRISC6           EQU  0006H
TRISC7           EQU  0007H


;----- TRISD Bits -----------------------------------------------------
TRISD0           EQU  0000H
TRISD1           EQU  0001H
TRISD2           EQU  0002H
TRISD3           EQU  0003H
TRISD4           EQU  0004H
TRISD5           EQU  0005H
TRISD6           EQU  0006H
TRISD7           EQU  0007H


;----- TRISE Bits -----------------------------------------------------
TRISE0           EQU  0000H
TRISE1           EQU  0001H
TRISE2           EQU  0002H
TRISE3           EQU  0003H
TRISE4           EQU  0004H
TRISE5           EQU  0005H
TRISE6           EQU  0006H
TRISE7           EQU  0007H


;----- PIE1 Bits -----------------------------------------------------
TMR1IE           EQU  0000H
TMR2IE           EQU  0001H
CCP1IE           EQU  0002H
SSP1IE           EQU  0003H
TX1IE            EQU  0004H
RC1IE            EQU  0005H
ADIE             EQU  0006H
TMR1GIE          EQU  0007H

SSPIE            EQU  0003H
TXIE             EQU  0004H
RCIE             EQU  0005H


;----- PIE2 Bits -----------------------------------------------------
CCP2IE           EQU  0000H
C3IE             EQU  0001H
LCDIE            EQU  0002H
BCLIE            EQU  0003H
EEIE             EQU  0004H
C1IE             EQU  0005H
C2IE             EQU  0006H
OSFIE            EQU  0007H


;----- PIE3 Bits -----------------------------------------------------
TMR4IE           EQU  0001H
TMR6IE           EQU  0003H
CCP3IE           EQU  0004H
CCP4IE           EQU  0005H
CCP5IE           EQU  0006H


;----- PIE4 Bits -----------------------------------------------------
SSP2IE           EQU  0000H
BCL2IE           EQU  0001H
TX2IE            EQU  0004H
RC2IE            EQU  0005H


;----- OPTION_REG Bits -----------------------------------------------------
PS0              EQU  0000H
PS1              EQU  0001H
PS2              EQU  0002H
PSA              EQU  0003H
T0SE             EQU  0004H
T0CS             EQU  0005H
INTEDG           EQU  0006H
NOT_WPUEN        EQU  0007H

TMR0SE           EQU  0004H
TMR0CS           EQU  0005H


;----- PCON Bits -----------------------------------------------------
NOT_BOR          EQU  0000H
NOT_POR          EQU  0001H
NOT_RI           EQU  0002H
NOT_RMCLR        EQU  0003H
STKUNF           EQU  0006H
STKOVF           EQU  0007H


;----- WDTCON Bits -----------------------------------------------------
SWDTEN           EQU  0000H
WDTPS0           EQU  0001H
WDTPS1           EQU  0002H
WDTPS2           EQU  0003H
WDTPS3           EQU  0004H
WDTPS4           EQU  0005H



;----- OSCTUNE Bits -----------------------------------------------------
TUN0             EQU  0000H
TUN1             EQU  0001H
TUN2             EQU  0002H
TUN3             EQU  0003H
TUN4             EQU  0004H
TUN5             EQU  0005H



;----- OSCCON Bits -----------------------------------------------------
SCS0             EQU  0000H
SCS1             EQU  0001H
IRCF0            EQU  0003H
IRCF1            EQU  0004H
IRCF2            EQU  0005H
IRCF3            EQU  0006H
SPLLEN           EQU  0007H



;----- OSCSTAT Bits -----------------------------------------------------
HFIOFS           EQU  0000H
LFIOFR           EQU  0001H
MFIOFR           EQU  0002H
HFIOFL           EQU  0003H
HFIOFR           EQU  0004H
OSTS             EQU  0005H
PLLR             EQU  0006H
T1OSCR           EQU  0007H


;----- ADCON0 Bits -----------------------------------------------------
ADON             EQU  0000H
GO_NOT_DONE      EQU  0001H
CHS0             EQU  0002H
CHS1             EQU  0003H
CHS2             EQU  0004H
CHS3             EQU  0005H
CHS4             EQU  0006H

ADGO             EQU  0001H

GO               EQU  0001H

NOT_DONE         EQU  0001H


;----- ADCON1 Bits -----------------------------------------------------
ADPREF0          EQU  0000H
ADPREF1          EQU  0001H
ADNREF           EQU  0002H
ADCS0            EQU  0004H
ADCS1            EQU  0005H
ADCS2            EQU  0006H
ADFM             EQU  0007H



;----- LATA Bits -----------------------------------------------------
LATA0            EQU  0000H
LATA1            EQU  0001H
LATA2            EQU  0002H
LATA3            EQU  0003H
LATA4            EQU  0004H
LATA5            EQU  0005H
LATA6            EQU  0006H
LATA7            EQU  0007H


;----- LATB Bits -----------------------------------------------------
LATB0            EQU  0000H
LATB1            EQU  0001H
LATB2            EQU  0002H
LATB3            EQU  0003H
LATB4            EQU  0004H
LATB5            EQU  0005H
LATB6            EQU  0006H
LATB7            EQU  0007H


;----- LATC Bits -----------------------------------------------------
LATC0            EQU  0000H
LATC1            EQU  0001H
LATC2            EQU  0002H
LATC3            EQU  0003H
LATC4            EQU  0004H
LATC5            EQU  0005H
LATC6            EQU  0006H
LATC7            EQU  0007H


;----- LATD Bits -----------------------------------------------------
LATD0            EQU  0000H
LATD1            EQU  0001H
LATD2            EQU  0002H
LATD3            EQU  0003H
LATD4            EQU  0004H
LATD5            EQU  0005H
LATD6            EQU  0006H
LATD7            EQU  0007H



;----- LATE Bits -----------------------------------------------------
LATE0            EQU  0000H
LATE1            EQU  0001H
LATE2            EQU  0002H
LATE3            EQU  0003H
LATE4            EQU  0004H
LATE5            EQU  0005H
LATE6            EQU  0006H
LATE7            EQU  0007H


;----- CM1CON0 Bits -----------------------------------------------------
C1SYNC           EQU  0000H
C1HYS            EQU  0001H
C1SP             EQU  0002H
C1POL            EQU  0004H
C1OE             EQU  0005H
C1OUT_CM1CON0    EQU  0006H
C1ON             EQU  0007H


;----- CM1CON1 Bits -----------------------------------------------------
C1NCH0           EQU  0000H
C1NCH1           EQU  0001H
C1PCH0           EQU  0004H
C1PCH1           EQU  0005H
C1INTN           EQU  0006H
C1INTP           EQU  0007H



;----- CM2CON0 Bits -----------------------------------------------------
C2SYNC           EQU  0000H
C2HYS            EQU  0001H
C2SP             EQU  0002H
C2POL            EQU  0004H
C2OE             EQU  0005H
C2OUT_CM2CON0    EQU  0006H
C2ON             EQU  0007H


;----- CM2CON1 Bits -----------------------------------------------------
C2NCH0           EQU  0000H
C2NCH1           EQU  0001H
C2PCH0           EQU  0004H
C2PCH1           EQU  0005H
C2INTN           EQU  0006H
C2INTP           EQU  0007H



;----- CMOUT Bits -----------------------------------------------------
MC1OUT           EQU  0000H
MC2OUT           EQU  0001H
MC3OUT           EQU  0002H


;----- BORCON Bits -----------------------------------------------------
BORRDY           EQU  0000H
SBOREN           EQU  0007H


;----- FVRCON Bits -----------------------------------------------------
ADFVR0           EQU  0000H
ADFVR1           EQU  0001H
CDAFVR0          EQU  0002H
CDAFVR1          EQU  0003H
FVRRDY           EQU  0006H
FVREN            EQU  0007H



;----- DACCON0 Bits -----------------------------------------------------
DACNSS           EQU  0000H
DACPSS0          EQU  0002H
DACPSS1          EQU  0003H
DACOE            EQU  0005H
DACLPS           EQU  0006H
DACEN            EQU  0007H



;----- DACCON1 Bits -----------------------------------------------------
DACR0            EQU  0000H
DACR1            EQU  0001H
DACR2            EQU  0002H
DACR3            EQU  0003H
DACR4            EQU  0004H



;----- SRCON0 Bits -----------------------------------------------------
SRPR             EQU  0000H
SRPS             EQU  0001H
SRNQEN           EQU  0002H
SRQEN            EQU  0003H
SRCLK0           EQU  0004H
SRCLK1           EQU  0005H
SRCLK2           EQU  0006H
SRLEN            EQU  0007H



;----- SRCON1 Bits -----------------------------------------------------
SRRC1E           EQU  0000H
SRRC2E           EQU  0001H
SRRCKE           EQU  0002H
SRRPE            EQU  0003H
SRSC1E           EQU  0004H
SRSC2E           EQU  0005H
SRSCKE           EQU  0006H
SRSPE            EQU  0007H


;----- APFCON Bits -----------------------------------------------------
P1BSEL           EQU  0000H
P1CSEL           EQU  0001H
CCP2SEL          EQU  0002H
P2BSEL           EQU  0003H
P2CSEL           EQU  0004H
P2DSEL           EQU  0005H
P3BSEL           EQU  0006H
P3CSEL           EQU  0007H


;----- CM3CON0 Bits -----------------------------------------------------
C3SYNC           EQU  0000H
C3HYS            EQU  0001H
C3SP             EQU  0002H
C3POL            EQU  0004H
C3OE             EQU  0005H
C3OUT_CM3CON0    EQU  0006H
C3ON             EQU  0007H


;----- CM3CON1 Bits -----------------------------------------------------
C3NCH0           EQU  0000H
C3NCH1           EQU  0001H
C3PCH0           EQU  0004H
C3PCH1           EQU  0005H
C3INTN           EQU  0006H
C3INTP           EQU  0007H



;----- ANSELA Bits -----------------------------------------------------
ANSA0            EQU  0000H
ANSA1            EQU  0001H
ANSA2            EQU  0002H
ANSA3            EQU  0003H
ANSA5            EQU  0005H



;----- ANSELE Bits -----------------------------------------------------
ANSE0            EQU  0000H
ANSE1            EQU  0001H
ANSE2            EQU  0002H



;----- EECON1 Bits -----------------------------------------------------
RD               EQU  0000H
WR               EQU  0001H
WREN             EQU  0002H
WRERR            EQU  0003H
FREE             EQU  0004H
LWLO             EQU  0005H
CFGS             EQU  0006H
EEPGD            EQU  0007H


;----- RC1STA Bits -----------------------------------------------------
RX9D             EQU  0000H
OERR             EQU  0001H
FERR             EQU  0002H
ADDEN            EQU  0003H
CREN             EQU  0004H
SREN             EQU  0005H
RX9              EQU  0006H
SPEN             EQU  0007H


;----- RCSTA Bits -----------------------------------------------------
RX9D             EQU  0000H
OERR             EQU  0001H
FERR             EQU  0002H
ADDEN            EQU  0003H
CREN             EQU  0004H
SREN             EQU  0005H
RX9              EQU  0006H
SPEN             EQU  0007H


;----- TX1STA Bits -----------------------------------------------------
TX9D             EQU  0000H
TRMT             EQU  0001H
BRGH             EQU  0002H
SENDB            EQU  0003H
SYNC             EQU  0004H
TXEN             EQU  0005H
TX9              EQU  0006H
CSRC             EQU  0007H


;----- TXSTA Bits -----------------------------------------------------
TX9D             EQU  0000H
TRMT             EQU  0001H
BRGH             EQU  0002H
SENDB            EQU  0003H
SYNC             EQU  0004H
TXEN             EQU  0005H
TX9              EQU  0006H
CSRC             EQU  0007H


;----- BAUD1CON Bits -----------------------------------------------------
ABDEN            EQU  0000H
WUE              EQU  0001H
BRG16            EQU  0003H
SCKP             EQU  0004H
RCIDL            EQU  0006H
ABDOVF           EQU  0007H


;----- WPUB Bits -----------------------------------------------------
WPUB0            EQU  0000H
WPUB1            EQU  0001H
WPUB2            EQU  0002H
WPUB3            EQU  0003H
WPUB4            EQU  0004H
WPUB5            EQU  0005H
WPUB6            EQU  0006H
WPUB7            EQU  0007H



;----- SSP1STAT Bits -----------------------------------------------------
BF               EQU  0000H
UA               EQU  0001H
R_NOT_W          EQU  0002H
S                EQU  0003H
P                EQU  0004H
D_NOT_A          EQU  0005H
CKE              EQU  0006H
SMP              EQU  0007H


;----- SSPSTAT Bits -----------------------------------------------------
BF               EQU  0000H
UA               EQU  0001H
R_NOT_W          EQU  0002H
S                EQU  0003H
P                EQU  0004H
D_NOT_A          EQU  0005H
CKE              EQU  0006H
SMP              EQU  0007H


;----- SSP1CON1 Bits -----------------------------------------------------
SSPM0            EQU  0000H
SSPM1            EQU  0001H
SSPM2            EQU  0002H
SSPM3            EQU  0003H
CKP              EQU  0004H
SSPEN            EQU  0005H
SSPOV            EQU  0006H
WCOL             EQU  0007H


;----- SSPCON Bits -----------------------------------------------------
SSPM0            EQU  0000H
SSPM1            EQU  0001H
SSPM2            EQU  0002H
SSPM3            EQU  0003H
CKP              EQU  0004H
SSPEN            EQU  0005H
SSPOV            EQU  0006H
WCOL             EQU  0007H


;----- SSPCON1 Bits -----------------------------------------------------
SSPM0            EQU  0000H
SSPM1            EQU  0001H
SSPM2            EQU  0002H
SSPM3            EQU  0003H
CKP              EQU  0004H
SSPEN            EQU  0005H
SSPOV            EQU  0006H
WCOL             EQU  0007H


;----- SSP1CON2 Bits -----------------------------------------------------
SEN              EQU  0000H
RSEN             EQU  0001H
PEN              EQU  0002H
RCEN             EQU  0003H
ACKEN            EQU  0004H
ACKDT            EQU  0005H
ACKSTAT          EQU  0006H
GCEN             EQU  0007H


;----- SSPCON2 Bits -----------------------------------------------------
SEN              EQU  0000H
RSEN             EQU  0001H
PEN              EQU  0002H
RCEN             EQU  0003H
ACKEN            EQU  0004H
ACKDT            EQU  0005H
ACKSTAT          EQU  0006H
GCEN             EQU  0007H


;----- SSP1CON3 Bits -----------------------------------------------------
DHEN             EQU  0000H
AHEN             EQU  0001H
SBCDE            EQU  0002H
SDAHT            EQU  0003H
BOEN             EQU  0004H
SCIE             EQU  0005H
PCIE             EQU  0006H
ACKTIM           EQU  0007H


;----- SSPCON3 Bits -----------------------------------------------------
DHEN             EQU  0000H
AHEN             EQU  0001H
SBCDE            EQU  0002H
SDAHT            EQU  0003H
BOEN             EQU  0004H
SCIE             EQU  0005H
PCIE             EQU  0006H
ACKTIM           EQU  0007H


;----- SSP2STAT Bits -----------------------------------------------------
BF               EQU  0000H
UA               EQU  0001H
R_NOT_W          EQU  0002H
S                EQU  0003H
P                EQU  0004H
D_NOT_A          EQU  0005H
CKE              EQU  0006H
SMP              EQU  0007H


;----- SSP2CON1 Bits -----------------------------------------------------
SSPM0            EQU  0000H
SSPM1            EQU  0001H
SSPM2            EQU  0002H
SSPM3            EQU  0003H
CKP              EQU  0004H
SSPEN            EQU  0005H
SSPOV            EQU  0006H
WCOL             EQU  0007H


;----- SSP2CON2 Bits -----------------------------------------------------
SEN              EQU  0000H
RSEN             EQU  0001H
PEN              EQU  0002H
RCEN             EQU  0003H
ACKEN            EQU  0004H
ACKDT            EQU  0005H
ACKSTAT          EQU  0006H
GCEN             EQU  0007H


;----- SSP2CON3 Bits -----------------------------------------------------
DHEN             EQU  0000H
AHEN             EQU  0001H
SBCDE            EQU  0002H
SDAHT            EQU  0003H
BOEN             EQU  0004H
SCIE             EQU  0005H
PCIE             EQU  0006H
ACKTIM           EQU  0007H


;----- PORTF Bits -----------------------------------------------------
RF0              EQU  0000H
RF1              EQU  0001H
RF2              EQU  0002H
RF3              EQU  0003H
RF4              EQU  0004H
RF5              EQU  0005H
RF6              EQU  0006H
RF7              EQU  0007H

AN16             EQU  0000H
AN6              EQU  0001H
AN7              EQU  0002H
AN8              EQU  0003H
AN9              EQU  0004H
AN10             EQU  0005H
AN11             EQU  0006H
AN5              EQU  0007H

SEG41            EQU  0000H
SEG19            EQU  0001H
SEG20            EQU  0002H
SEG21            EQU  0003H
SEG22            EQU  0004H
SEG23            EQU  0005H
SEG24            EQU  0006H
SEG25            EQU  0007H

CPS16            EQU  0000H
CPS6             EQU  0001H
CPS7             EQU  0002H
CPS8             EQU  0003H
CPS9             EQU  0004H
CPS10            EQU  0005H
CPS11            EQU  0006H
CPS5             EQU  0007H

C1IN0N           EQU  0000H
C2OUT_PORTF      EQU  0001H
C1OUT_PORTF      EQU  0002H
C1IN2N           EQU  0003H
C2INP            EQU  0004H
C1IN1N           EQU  0005H
C1INP            EQU  0006H
C1IN3N           EQU  0007H

C2IN0N           EQU  0000H
SRNQ             EQU  0001H
SRQ              EQU  0002H
C2IN2N           EQU  0003H
C2IN1N           EQU  0005H
C2IN3N           EQU  0007H

C3IN2N           EQU  0003H
DACOUT           EQU  0005H
C3IN3N           EQU  0007H


;----- PORTG Bits -----------------------------------------------------
RG0              EQU  0000H
RG1              EQU  0001H
RG2              EQU  0002H
RG3              EQU  0003H
RG4              EQU  0004H
RG5              EQU  0005H

AN15             EQU  0001H
AN14             EQU  0002H
AN13             EQU  0003H
AN12             EQU  0004H
NOT_MCLR         EQU  0005H

SEG42            EQU  0000H
SEG43            EQU  0001H
SEG44            EQU  0002H
SEG45            EQU  0003H
SEG26            EQU  0004H

CPS15            EQU  0001H
CPS14            EQU  0002H
CPS13            EQU  0003H
CPS12            EQU  0004H

C3OUT_PORTG      EQU  0001H
C3INP            EQU  0002H
C3IN0N           EQU  0003H
C3IN1N           EQU  0004H

CCP3             EQU  0000H
TX2              EQU  0001H
RX2              EQU  0002H
CCP4             EQU  0003H
CCP5             EQU  0004H

P3A              EQU  0000H
CK2              EQU  0001H
DT2              EQU  0002H
P3D              EQU  0003H
P1D              EQU  0004H


;----- CCP1CON Bits -----------------------------------------------------
CCP1M0           EQU  0000H
CCP1M1           EQU  0001H
CCP1M2           EQU  0002H
CCP1M3           EQU  0003H
DC1B0            EQU  0004H
DC1B1            EQU  0005H
P1M0             EQU  0006H
P1M1             EQU  0007H



;----- PWM1CON Bits -----------------------------------------------------
P1DC0            EQU  0000H
P1DC1            EQU  0001H
P1DC2            EQU  0002H
P1DC3            EQU  0003H
P1DC4            EQU  0004H
P1DC5            EQU  0005H
P1DC6            EQU  0006H
P1RSEN           EQU  0007H


;----- CCP1AS Bits -----------------------------------------------------
PSS1BD0          EQU  0000H
PSS1BD1          EQU  0001H
PSS1AC0          EQU  0002H
PSS1AC1          EQU  0003H
CCP1AS0          EQU  0004H
CCP1AS1          EQU  0005H
CCP1AS2          EQU  0006H
CCP1ASE          EQU  0007H


;----- ECCP1AS Bits -----------------------------------------------------
PSS1BD0          EQU  0000H
PSS1BD1          EQU  0001H
PSS1AC0          EQU  0002H
PSS1AC1          EQU  0003H
CCP1AS0          EQU  0004H
CCP1AS1          EQU  0005H
CCP1AS2          EQU  0006H
CCP1ASE          EQU  0007H


;----- PSTR1CON Bits -----------------------------------------------------
STR1A            EQU  0000H
STR1B            EQU  0001H
STR1C            EQU  0002H
STR1D            EQU  0003H
STR1SYNC         EQU  0004H


;----- CCP2CON Bits -----------------------------------------------------
CCP2M0           EQU  0000H
CCP2M1           EQU  0001H
CCP2M2           EQU  0002H
CCP2M3           EQU  0003H
DC2B0            EQU  0004H
DC2B1            EQU  0005H
P2M0             EQU  0006H
P2M1             EQU  0007H



;----- PWM2CON Bits -----------------------------------------------------
P2DC0            EQU  0000H
P2DC1            EQU  0001H
P2DC2            EQU  0002H
P2DC3            EQU  0003H
P2DC4            EQU  0004H
P2DC5            EQU  0005H
P2DC6            EQU  0006H
P2RSEN           EQU  0007H


;----- CCP2AS Bits -----------------------------------------------------
PSS2BD0          EQU  0000H
PSS2BD1          EQU  0001H
PSS2AC0          EQU  0002H
PSS2AC1          EQU  0003H
CCP2AS0          EQU  0004H
CCP2AS1          EQU  0005H
CCP2AS2          EQU  0006H
CCP2ASE          EQU  0007H


;----- ECCP2AS Bits -----------------------------------------------------
PSS2BD0          EQU  0000H
PSS2BD1          EQU  0001H
PSS2AC0          EQU  0002H
PSS2AC1          EQU  0003H
CCP2AS0          EQU  0004H
CCP2AS1          EQU  0005H
CCP2AS2          EQU  0006H
CCP2ASE          EQU  0007H


;----- PSTR2CON Bits -----------------------------------------------------
STR2A            EQU  0000H
STR2B            EQU  0001H
STR2C            EQU  0002H
STR2D            EQU  0003H
STR2SYNC         EQU  0004H


;----- CCPTMRS0 Bits -----------------------------------------------------
C1TSEL0          EQU  0000H
C1TSEL1          EQU  0001H
C2TSEL0          EQU  0002H
C2TSEL1          EQU  0003H
C3TSEL0          EQU  0004H
C3TSEL1          EQU  0005H
C4TSEL0          EQU  0006H
C4TSEL1          EQU  0007H



;----- CCPTMRS1 Bits -----------------------------------------------------
C5TSEL0          EQU  0000H
C5TSEL1          EQU  0001H



;----- TRISF Bits -----------------------------------------------------
TRISF0           EQU  0000H
TRISF1           EQU  0001H
TRISF2           EQU  0002H
TRISF3           EQU  0003H
TRISF4           EQU  0004H
TRISF5           EQU  0005H
TRISF6           EQU  0006H
TRISF7           EQU  0007H


;----- TRISG Bits -----------------------------------------------------
TRISG0           EQU  0000H
TRISG1           EQU  0001H
TRISG2           EQU  0002H
TRISG3           EQU  0003H
TRISG4           EQU  0004H
TRISG5           EQU  0005H


;----- CCP3CON Bits -----------------------------------------------------
CCP3M0           EQU  0000H
CCP3M1           EQU  0001H
CCP3M2           EQU  0002H
CCP3M3           EQU  0003H
DC3B0            EQU  0004H
DC3B1            EQU  0005H
P3M0             EQU  0006H
P3M1             EQU  0007H


;----- PWM3CON Bits -----------------------------------------------------
P3DC0            EQU  0000H
P3DC1            EQU  0001H
P3DC2            EQU  0002H
P3DC3            EQU  0003H
P3DC4            EQU  0004H
P3DC5            EQU  0005H
P3DC6            EQU  0006H
P3RSEN           EQU  0007H


;----- CCP3AS Bits -----------------------------------------------------
PSS3BD0          EQU  0000H
PSS3BD1          EQU  0001H
PSS3AC0          EQU  0002H
PSS3AC1          EQU  0003H
CCP3AS0          EQU  0004H
CCP3AS1          EQU  0005H
CCP3AS2          EQU  0006H
CCP3ASE          EQU  0007H


;----- ECCP3AS Bits -----------------------------------------------------
PSS3BD0          EQU  0000H
PSS3BD1          EQU  0001H
PSS3AC0          EQU  0002H
PSS3AC1          EQU  0003H
CCP3AS0          EQU  0004H
CCP3AS1          EQU  0005H
CCP3AS2          EQU  0006H
CCP3ASE          EQU  0007H


;----- PSTR3CON Bits -----------------------------------------------------
STR3A            EQU  0000H
STR3B            EQU  0001H
STR3C            EQU  0002H
STR3D            EQU  0003H
STR3SYNC         EQU  0004H


;----- CCP4CON Bits -----------------------------------------------------
CCP4M0           EQU  0000H
CCP4M1           EQU  0001H
CCP4M2           EQU  0002H
CCP4M3           EQU  0003H
DC4B0            EQU  0004H
DC4B1            EQU  0005H


;----- CCP5CON Bits -----------------------------------------------------
CCP5M0           EQU  0000H
CCP5M1           EQU  0001H
CCP5M2           EQU  0002H
CCP5M3           EQU  0003H
DC5B0            EQU  0004H
DC5B1            EQU  0005H


;----- LATF Bits -----------------------------------------------------
LATF0            EQU  0000H
LATF1            EQU  0001H
LATF2            EQU  0002H
LATF3            EQU  0003H
LATF4            EQU  0004H
LATF5            EQU  0005H
LATF6            EQU  0006H
LATF7            EQU  0007H


;----- LATG Bits -----------------------------------------------------
LATG0            EQU  0000H
LATG1            EQU  0001H
LATG2            EQU  0002H
LATG3            EQU  0003H
LATG4            EQU  0004H
LATG5            EQU  0005H


;----- IOCBP Bits -----------------------------------------------------
IOCBP0           EQU  0000H
IOCBP1           EQU  0001H
IOCBP2           EQU  0002H
IOCBP3           EQU  0003H
IOCBP4           EQU  0004H
IOCBP5           EQU  0005H
IOCBP6           EQU  0006H
IOCBP7           EQU  0007H



;----- IOCBN Bits -----------------------------------------------------
IOCBN0           EQU  0000H
IOCBN1           EQU  0001H
IOCBN2           EQU  0002H
IOCBN3           EQU  0003H
IOCBN4           EQU  0004H
IOCBN5           EQU  0005H
IOCBN6           EQU  0006H
IOCBN7           EQU  0007H



;----- IOCBF Bits -----------------------------------------------------
IOCBF0           EQU  0000H
IOCBF1           EQU  0001H
IOCBF2           EQU  0002H
IOCBF3           EQU  0003H
IOCBF4           EQU  0004H
IOCBF5           EQU  0005H
IOCBF6           EQU  0006H
IOCBF7           EQU  0007H



;----- ANSELF Bits -----------------------------------------------------
ANSF0            EQU  0000H
ANSF1            EQU  0001H
ANSF2            EQU  0002H
ANSF3            EQU  0003H
ANSF4            EQU  0004H
ANSF5            EQU  0005H
ANSF6            EQU  0006H
ANSF7            EQU  0007H



;----- ANSELG Bits -----------------------------------------------------
ANSG1            EQU  0001H
ANSG2            EQU  0002H
ANSG3            EQU  0003H
ANSG4            EQU  0004H



;----- T4CON Bits -----------------------------------------------------
T4CKPS0          EQU  0000H
T4CKPS1          EQU  0001H
TMR4ON           EQU  0002H
T4OUTPS0         EQU  0003H
T4OUTPS1         EQU  0004H
T4OUTPS2         EQU  0005H
T4OUTPS3         EQU  0006H



;----- T6CON Bits -----------------------------------------------------
T6CKPS0          EQU  0000H
T6CKPS1          EQU  0001H
TMR6ON           EQU  0002H
T6OUTPS0         EQU  0003H
T6OUTPS1         EQU  0004H
T6OUTPS2         EQU  0005H
T6OUTPS3         EQU  0006H



;----- WPUG Bits -----------------------------------------------------
WPUG5            EQU  0005H


;----- RC2STA Bits -----------------------------------------------------
RX9D             EQU  0000H
OERR             EQU  0001H
FERR             EQU  0002H
ADDEN            EQU  0003H
CREN             EQU  0004H
SREN             EQU  0005H
RX9              EQU  0006H
SPEN             EQU  0007H


;----- TX2STA Bits -----------------------------------------------------
TX9D             EQU  0000H
TRMT             EQU  0001H
BRGH             EQU  0002H
SENDB            EQU  0003H
SYNC             EQU  0004H
TXEN             EQU  0005H
TX9              EQU  0006H
CSRC             EQU  0007H


;----- BAUD2CON Bits -----------------------------------------------------
ABDEN            EQU  0000H
WUE              EQU  0001H
BRG16            EQU  0003H
SCKP             EQU  0004H
RCIDL            EQU  0006H
ABDOVF           EQU  0007H


;----- LCDCON Bits -----------------------------------------------------
LMUX0            EQU  0000H
LMUX1            EQU  0001H
CS0              EQU  0002H
CS1              EQU  0003H
WERR             EQU  0005H
SLPEN            EQU  0006H
LCDEN            EQU  0007H



;----- LCDPS Bits -----------------------------------------------------
LP0              EQU  0000H
LP1              EQU  0001H
LP2              EQU  0002H
LP3              EQU  0003H
WA               EQU  0004H
LCDA             EQU  0005H
BIASMD           EQU  0006H
WFT              EQU  0007H



;----- LCDREF Bits -----------------------------------------------------
VLCD1PE          EQU  0001H
VLCD2PE          EQU  0002H
VLCD3PE          EQU  0003H
LCDIRI           EQU  0005H
LCDIRS           EQU  0006H
LCDIRE           EQU  0007H


;----- LCDCST Bits -----------------------------------------------------
LCDCST0          EQU  0000H
LCDCST1          EQU  0001H
LCDCST2          EQU  0002H



;----- LCDRL Bits -----------------------------------------------------
LRLAT0           EQU  0000H
LRLAT1           EQU  0001H
LRLAT2           EQU  0002H
LRLBP0           EQU  0004H
LRLBP1           EQU  0005H
LRLAP0           EQU  0006H
LRLAP1           EQU  0007H



;----- LCDSE0 Bits -----------------------------------------------------
SE0              EQU  0000H
SE1              EQU  0001H
SE2              EQU  0002H
SE3              EQU  0003H
SE4              EQU  0004H
SE5              EQU  0005H
SE6              EQU  0006H
SE7              EQU  0007H


;----- LCDSE1 Bits -----------------------------------------------------
SE8              EQU  0000H
SE9              EQU  0001H
SE10             EQU  0002H
SE11             EQU  0003H
SE12             EQU  0004H
SE13             EQU  0005H
SE14             EQU  0006H
SE15             EQU  0007H


;----- LCDSE2 Bits -----------------------------------------------------
SE16             EQU  0000H
SE17             EQU  0001H
SE18             EQU  0002H
SE19             EQU  0003H
SE20             EQU  0004H
SE21             EQU  0005H
SE22             EQU  0006H
SE23             EQU  0007H


;----- LCDSE3 Bits -----------------------------------------------------
SE24             EQU  0000H
SE25             EQU  0001H
SE26             EQU  0002H
SE27             EQU  0003H
SE28             EQU  0004H
SE29             EQU  0005H
SE30             EQU  0006H
SE31             EQU  0007H


;----- LCDSE4 Bits -----------------------------------------------------
SE32             EQU  0000H
SE33             EQU  0001H
SE34             EQU  0002H
SE35             EQU  0003H
SE36             EQU  0004H
SE37             EQU  0005H
SE38             EQU  0006H
SE39             EQU  0007H


;----- LCDSE5 Bits -----------------------------------------------------
SE40             EQU  0000H
SE41             EQU  0001H
SE42             EQU  0002H
SE43             EQU  0003H
SE44             EQU  0004H
SE45             EQU  0005H


;----- LCDDATA0 Bits -----------------------------------------------------
SEG0COM0         EQU  0000H
SEG1COM0         EQU  0001H
SEG2COM0         EQU  0002H
SEG3COM0         EQU  0003H
SEG4COM0         EQU  0004H
SEG5COM0         EQU  0005H
SEG6COM0         EQU  0006H
SEG7COM0         EQU  0007H


;----- LCDDATA1 Bits -----------------------------------------------------
SEG8COM0         EQU  0000H
SEG9COM0         EQU  0001H
SEG10COM0        EQU  0002H
SEG11COM0        EQU  0003H
SEG12COM0        EQU  0004H
SEG13COM0        EQU  0005H
SEG14COM0        EQU  0006H
SEG15COM0        EQU  0007H


;----- LCDDATA2 Bits -----------------------------------------------------
SEG16COM0        EQU  0000H
SEG17COM0        EQU  0001H
SEG18COM0        EQU  0002H
SEG19COM0        EQU  0003H
SEG20COM0        EQU  0004H
SEG21COM0        EQU  0005H
SEG22COM0        EQU  0006H
SEG23COM0        EQU  0007H


;----- LCDDATA3 Bits -----------------------------------------------------
SEG0COM1         EQU  0000H
SEG1COM1         EQU  0001H
SEG2COM1         EQU  0002H
SEG3COM1         EQU  0003H
SEG4COM1         EQU  0004H
SEG5COM1         EQU  0005H
SEG6COM1         EQU  0006H
SEG7COM1         EQU  0007H


;----- LCDDATA4 Bits -----------------------------------------------------
SEG8COM1         EQU  0000H
SEG9COM1         EQU  0001H
SEG10COM1        EQU  0002H
SEG11COM1        EQU  0003H
SEG12COM1        EQU  0004H
SEG13COM1        EQU  0005H
SEG14COM1        EQU  0006H
SEG15COM1        EQU  0007H


;----- LCDDATA5 Bits -----------------------------------------------------
SEG16COM1        EQU  0000H
SEG17COM1        EQU  0001H
SEG18COM1        EQU  0002H
SEG19COM1        EQU  0003H
SEG20COM1        EQU  0004H
SEG21COM1        EQU  0005H
SEG22COM1        EQU  0006H
SEG23COM1        EQU  0007H


;----- LCDDATA6 Bits -----------------------------------------------------
SEG0COM2         EQU  0000H
SEG1COM2         EQU  0001H
SEG2COM2         EQU  0002H
SEG3COM2         EQU  0003H
SEG4COM2         EQU  0004H
SEG5COM2         EQU  0005H
SEG6COM2         EQU  0006H
SEG7COM2         EQU  0007H


;----- LCDDATA7 Bits -----------------------------------------------------
SEG8COM2         EQU  0000H
SEG9COM2         EQU  0001H
SEG10COM2        EQU  0002H
SEG11COM2        EQU  0003H
SEG12COM2        EQU  0004H
SEG13COM2        EQU  0005H
SEG14COM2        EQU  0006H
SEG15COM2        EQU  0007H


;----- LCDDATA8 Bits -----------------------------------------------------
SEG16COM2        EQU  0000H
SEG17COM2        EQU  0001H
SEG18COM2        EQU  0002H
SEG19COM2        EQU  0003H
SEG20COM2        EQU  0004H
SEG21COM2        EQU  0005H
SEG22COM2        EQU  0006H
SEG23COM2        EQU  0007H


;----- LCDDATA9 Bits -----------------------------------------------------
SEG0COM3         EQU  0000H
SEG1COM3         EQU  0001H
SEG2COM3         EQU  0002H
SEG3COM3         EQU  0003H
SEG4COM3         EQU  0004H
SEG5COM3         EQU  0005H
SEG6COM3         EQU  0006H
SEG7COM3         EQU  0007H


;----- LCDDATA10 Bits -----------------------------------------------------
SEG8COM3         EQU  0000H
SEG9COM3         EQU  0001H
SEG10COM3        EQU  0002H
SEG11COM3        EQU  0003H
SEG12COM3        EQU  0004H
SEG13COM3        EQU  0005H
SEG14COM3        EQU  0006H
SEG15COM3        EQU  0007H


;----- LCDDATA11 Bits -----------------------------------------------------
SEG16COM3        EQU  0000H
SEG17COM3        EQU  0001H
SEG18COM3        EQU  0002H
SEG19COM3        EQU  0003H
SEG20COM3        EQU  0004H
SEG21COM3        EQU  0005H
SEG22COM3        EQU  0006H
SEG23COM3        EQU  0007H


;----- LCDDATA12 Bits -----------------------------------------------------
SEG24COM0        EQU  0000H
SEG25COM0        EQU  0001H
SEG26COM0        EQU  0002H
SEG27COM0        EQU  0003H
SEG28COM0        EQU  0004H
SEG29COM0        EQU  0005H
SEG30COM0        EQU  0006H
SEG31COM0        EQU  0007H


;----- LCDDATA13 Bits -----------------------------------------------------
SEG32COM0        EQU  0000H
SEG33COM0        EQU  0001H
SEG34COM0        EQU  0002H
SEG35COM0        EQU  0003H
SEG36COM0        EQU  0004H
SEG37COM0        EQU  0005H
SEG38COM0        EQU  0006H
SEG39COM0        EQU  0007H


;----- LCDDATA14 Bits -----------------------------------------------------
SEG40COM0        EQU  0000H
SEG41COM0        EQU  0001H
SEG42COM0        EQU  0002H
SEG43COM0        EQU  0003H
SEG44COM0        EQU  0004H
SEG45COM0        EQU  0005H


;----- LCDDATA15 Bits -----------------------------------------------------
SEG24COM1        EQU  0000H
SEG25COM1        EQU  0001H
SEG26COM1        EQU  0002H
SEG27COM1        EQU  0003H
SEG28COM1        EQU  0004H
SEG29COM1        EQU  0005H
SEG30COM1        EQU  0006H
SEG31COM1        EQU  0007H


;----- LCDDATA16 Bits -----------------------------------------------------
SEG32COM1        EQU  0000H
SEG33COM1        EQU  0001H
SEG34COM1        EQU  0002H
SEG35COM1        EQU  0003H
SEG36COM1        EQU  0004H
SEG37COM1        EQU  0005H
SEG38COM1        EQU  0006H
SEG39COM1        EQU  0007H


;----- LCDDATA17 Bits -----------------------------------------------------
SEG40COM1        EQU  0000H
SEG41COM1        EQU  0001H
SEG42COM1        EQU  0002H
SEG43COM1        EQU  0003H
SEG44COM1        EQU  0004H
SEG45COM1        EQU  0005H


;----- LCDDATA18 Bits -----------------------------------------------------
SEG24COM2        EQU  0000H
SEG25COM2        EQU  0001H
SEG26COM2        EQU  0002H
SEG27COM2        EQU  0003H
SEG28COM2        EQU  0004H
SEG29COM2        EQU  0005H
SEG30COM2        EQU  0006H
SEG31COM2        EQU  0007H


;----- LCDDATA19 Bits -----------------------------------------------------
SEG32COM2        EQU  0000H
SEG33COM2        EQU  0001H
SEG34COM2        EQU  0002H
SEG35COM2        EQU  0003H
SEG36COM2        EQU  0004H
SEG37COM2        EQU  0005H
SEG38COM2        EQU  0006H
SEG39COM2        EQU  0007H


;----- LCDDATA20 Bits -----------------------------------------------------
SEG40COM2        EQU  0000H
SEG41COM2        EQU  0001H
SEG42COM2        EQU  0002H
SEG43COM2        EQU  0003H
SEG44COM2        EQU  0004H
SEG45COM2        EQU  0005H


;----- LCDDATA21 Bits -----------------------------------------------------
SEG24COM3        EQU  0000H
SEG25COM3        EQU  0001H
SEG26COM3        EQU  0002H
SEG27COM3        EQU  0003H
SEG28COM3        EQU  0004H
SEG29COM3        EQU  0005H
SEG30COM3        EQU  0006H
SEG31COM3        EQU  0007H


;----- LCDDATA22 Bits -----------------------------------------------------
SEG32COM3        EQU  0000H
SEG33COM3        EQU  0001H
SEG34COM3        EQU  0002H
SEG35COM3        EQU  0003H
SEG36COM3        EQU  0004H
SEG37COM3        EQU  0005H
SEG38COM3        EQU  0006H
SEG39COM3        EQU  0007H


;----- LCDDATA23 Bits -----------------------------------------------------
SEG40COM3        EQU  0000H
SEG41COM3        EQU  0001H
SEG42COM3        EQU  0002H
SEG43COM3        EQU  0003H
SEG44COM3        EQU  0004H
SEG45COM3        EQU  0005H


;----- STATUS_SHAD Bits -----------------------------------------------------
C_SHAD           EQU  0000H
DC_SHAD          EQU  0001H
Z_SHAD           EQU  0002H





;==========================================================================
;
;       Configuration Bits
;
;   NAME            Address
;   CONFIG1           8007h
;   CONFIG2           8008h
;
;==========================================================================


        LIST
        
        
#ifndef INC_P16F1947
#define INC_P16F1947

#define SPACE_CODE   0
#define SPACE_DATA   1
#define SPACE_EEPROM 3

psect udata_shr,class=COMMON,space=SPACE_DATA,noexec
psect udata,class=RAM,space=SPACE_DATA,noexec
psect udata_bank0,class=BANK0,space=SPACE_DATA,noexec
psect udata_bank1,class=BANK1,space=SPACE_DATA,noexec
psect udata_bank2,class=BANK2,space=SPACE_DATA,noexec
psect udata_bank3,class=BANK3,space=SPACE_DATA,noexec
psect udata_bank4,class=BANK4,space=SPACE_DATA,noexec
psect udata_bank5,class=BANK5,space=SPACE_DATA,noexec
psect udata_bank6,class=BANK6,space=SPACE_DATA,noexec
psect udata_bank7,class=BANK7,space=SPACE_DATA,noexec
psect udata_bank8,class=BANK8,space=SPACE_DATA,noexec
psect udata_bank9,class=BANK9,space=SPACE_DATA,noexec
psect udata_bank10,class=BANK10,space=SPACE_DATA,noexec
psect udata_bank11,class=BANK11,space=SPACE_DATA,noexec
psect udata_bank12,class=BANK12,space=SPACE_DATA,noexec
psect code,class=CODE,space=SPACE_CODE,delta=2
psect data,class=STRCODE,space=SPACE_CODE,delta=2,noexec
psect edata,class=EEDATA,space=SPACE_EEPROM,delta=2,noexec

#endif //INC_P16F1947
