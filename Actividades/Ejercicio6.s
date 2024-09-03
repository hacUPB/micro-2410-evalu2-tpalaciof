.syntax unified
        .global _start
        .text

        // Variables de Clocks para perifericos

        .equ    PCC_BASE, 0x40065000 
        .equ    PCC_PORTC_OFFSET, 0x128 // Para puerto B
        .equ    PCC_PORTA_OFFSET, 0x134 // Para puerto E
        .equ    PCC_CGC_BIT, 30 // Bit 30 es el del CGC

        // Variables de Puertos

        .equ    PORTA_BASE, 0x40049000 
        .equ    PORT_PCR_MUX_BITS, 0x8 // Bit 8 para poner el MUX en 001 (Modo GPIO)
        .equ    PORTA_PCR10_OFFSET, 0x28 // PTA 10 pulsador
          
        .equ    PORTC_BASE, 0x4004B000
        .equ    PORTC_PCR14_OFFSET, 0x38 // PTC 14 led
        
        // Variables de GPIO

        .equ    GPIOA_BASE, 0x400FF000
        .equ    GPIOC_BASE, 0x400FF080

        .equ    GPIOC14_OFFSET, 14 //LED
        .equ    GPIOA10_OFFSET, 10

        .equ    GPIO_DDR, 0x14
        .equ    GPIO_PDOR, 0x0
        .equ    GPIO_PDIR, 0x10

        .thumb_func