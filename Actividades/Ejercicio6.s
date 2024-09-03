.syntax unified
.global _start
.text
 
.equ    PCC_BASE, 0x40065000
.equ    PCC_PORTB_OFFSET, 0x128
.equ    PCC_PORTE_OFFSET, 0x134
.equ    PCC_CGC_BIT, 30
 
.equ    PORTB_BASE, 0x4004A000 
.equ    PORTE_BASE, 0x4004D000
.equ    PORT_PCR_MUX_BITS, 0x8
 
// B -> Ánodos -> Columnas -> 1
.equ    PORTB_PCB12_OFFSET, 0x30 //1 SV21
.equ    PORTB_PCB13_OFFSET, 0x34 //2 SV21
.equ    PORTB_PCB14_OFFSET, 0x38 //3 SV21
.equ    PORTB_PCB15_OFFSET, 0x3C //4 SV21
.equ    PORTB_PCB16_OFFSET, 0x40 //5 SV21
.equ    PORTB_PCB17_OFFSET, 0x44 //6 SV21
.equ    PORTB_PCB0_OFFSET, 0x00  //7 SV20
.equ    PORTB_PCB1_OFFSET, 0x04  //8 SV20
 
// E -> Cátodos -> Filas -> 0
.equ    PORTE_PCE16_OFFSET, 0x40 //1 SV16
.equ    PORTE_PCE15_OFFSET, 0x3C //2 SV16
.equ    PORTE_PCE11_OFFSET, 0x2C //3 SV16
.equ    PORTE_PCE10_OFFSET, 0x28 //4 SV16
.equ    PORTE_PCE5_OFFSET, 0x14 //5 SV16
.equ    PORTE_PCE4_OFFSET, 0x10 //6 SV16
.equ    PORTE_PCE2_OFFSET, 0x08 //7 SV22
.equ    PORTE_PCE6_OFFSET, 0x18 //8 SV22
 
.equ    GPIOB_BASE, 0x400FF040
.equ    GPIOE_BASE, 0x400FF100
 
.equ    GPIOB12_OFFSET, 12
.equ    GPIOB13_OFFSET, 13
.equ    GPIOB14_OFFSET, 14
.equ    GPIOB15_OFFSET, 15
.equ    GPIOB16_OFFSET, 16
.equ    GPIOB17_OFFSET, 17
.equ    GPIOB0_OFFSET, 0
.equ    GPIOB1_OFFSET, 1
 
.equ    GPIOB, 0b111111100000000011 
 
.equ    GPIOE16_OFFSET, 16
.equ    GPIOE15_OFFSET, 15
.equ    GPIOE11_OFFSET, 11
.equ    GPIOE10_OFFSET, 10
.equ    GPIOE5_OFFSET, 5
.equ    GPIOE4_OFFSET, 4
.equ    GPIOE2_OFFSET, 2
.equ    GPIOE6_OFFSET, 6
 
.equ    GPIOE, 0b11111111111111111
 
.equ    GPIO_DDR_OFFSET, 0x14
.equ    GPIO_PDOR_OFFSET, 0x0
.equ    GPIO_PDIR_OFFSET, 0x10
 
.thumb_func
 
_start:
    bl  init_clks
    bl  init_ports
    bl  init_gpio
main_loop:
    bl  escribir_leds
    b   main_loop
 
init_clks:
    ldr     r4, =#PCC_BASE
    ldr     r5, =#PCC_PORTB_OFFSET
    mov     r0, #1
    lsl     r0, #PCC_CGC_BIT
    str     r0, [r4, r5]
    ldr     r5, =#PCC_PORTE_OFFSET
    str     r0, [r4, r5]
    bx      lr
 
init_ports:
    ldr     r4, =#PORTB_BASE
    mov     r0, #1
    lsl     r0, #PORT_PCR_MUX_BITS
 
    ldr     r5, =#PORTB_PCB12_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTB_PCB13_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTB_PCB14_OFFSET
    str     r0, [r4, r5]
    ldr     r5, =#PORTB_PCB15_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTB_PCB16_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTB_PCB17_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTB_PCB0_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTB_PCB1_OFFSET
    str     r0, [r4, r5]
 
    ldr     r4, =#PORTE_BASE
 
    ldr     r5, =#PORTE_PCE16_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTE_PCE15_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTE_PCE11_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTE_PCE10_OFFSET
    str     r0, [r4, r5]
    ldr     r5, =#PORTE_PCE5_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTE_PCE4_OFFSET
    str     r0, [r4, r5]
    ldr     r5, =#PORTE_PCE2_OFFSET
    str     r0, [r4, r5]
 
    ldr     r5, =#PORTE_PCE6_OFFSET
    str     r0, [r4, r5]
 
    bx      lr
 
 
init_gpio:
    ldr     r4, =#GPIOB_BASE
    ldr     r5, =#GPIO_DDR_OFFSET
    ldr     r1, [r4, r5]
    ldr     r0, =#GPIOB
    orr     r0, r1
    str     r0, [r4,r5]
 
 
    ldr     r4, =#GPIOE_BASE
    ldr     r1, [r4, r5]
    ldr     r0, =#GPIOE
    orr     r0, r1
    str     r0, [r4,r5]
 
   
 
escribir_leds:
 
    ldr     r4, =#GPIOE_BASE
    ldr     r1, [r4, #GPIO_PDOR_OFFSET]
 
    mov     r0, #1
    lsl     r0, #GPIOE16_OFFSET
    bic     r5, r1, r0
 
    str     r5, [r4, #GPIO_PDOR_OFFSET]
 
    ldr     r4, =#GPIOB_BASE
    ldr     r1, [r4, #GPIO_PDOR_OFFSET]
 
    mov     r0, #1 
    lsl     r0, #GPIOB12_OFFSET
    orr     r5, r1, r0
    str     r5, [r4, #GPIO_PDOR_OFFSET]
    bx      lr
