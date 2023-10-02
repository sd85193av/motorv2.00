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
