  #include "definitions.h"

  .syntax unified
  .global _start
  .extern estado_leds  
  .text

  .thumb_func

_start:
    bl  init_clks
    bl  init_ports
    bl  init_gpio 
    bl crear_tabla_leds 
    bl systick_config 

    // Máquina de estados
    ldr r4, =Base_maquina_0
    mov r1, #col1                    
    str r1, [r4, #var_estado_M0]
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]   

loop_principal:
    bl estado_leds
     
    //bl escribir_leds               
    b loop_principal                  


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
    bx lr

systick_config:
   // Configurar SysTick 
    ldr r0, =SYST_RVR
    ldr r1, =SYSTICK_RELOAD_1MS
    str r1, [r0]                      

    ldr r0, =SYST_CVR
    mov r1, #0
    str r1, [r0]                      

    ldr r0, =SYST_CSR
    mov r1, #(SYSTICK_ENABLE | SYSTICK_TICKINT | SYSTICK_CLKSOURCE)
    str r1, [r0]                      // Habilitar el SysTick, la interrupción y seleccionar el reloj del procesador
    bx  lr

crear_tabla_leds:
    ldr   r10, =base_logo // Dirección inicial de memoria para guardar la tabla
    ldr   r1, =leds        // Dirección de la tabla en la memoria de programa
    mov   r3, #8           // Tamaño de la matriz (columnas)
loop_col:
    ldrb  r0, [r1], #1     // Carga el byte actual de la tabla de LED
    strb  r0, [r10], #1     // Guarda el byte en la dirección de memoria y avanza
    subs  r3, r3, #1       // Decrementa el contador de columnas
    bne   loop_col       // Continúa el bucle si no se han procesado todas las columnas
    bx    lr               // Retorna

.section .rodata
leds:
    .byte 0b00000000 // Representación de la primera columna de LEDs
    .byte 0b01110100 
    .byte 0b00010100 
    .byte 0b01111100 // columna 4 
    .byte 0b01010000 
    .byte 0b01011100 
    .byte 0b00000000 
    .byte 0b00000000 
