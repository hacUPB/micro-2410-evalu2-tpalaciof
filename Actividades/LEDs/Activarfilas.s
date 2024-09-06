#include "definitions.h"
 
  .syntax unified
  .text
  .global estado_leds
  .global Activarfilas
  .thumb_func

Activarfilas: 
    mov  r8, #1
    and  r9, r7, r8  
    cmp  r8, r9
    beq fila1

    lsl  r8, #1
    and  r9, r7, r8    
    cmp  r8, r9
    beq fila2

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila3

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila4

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila5

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila6

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila7

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr


fila1: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE16_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET]
    
    lsl  r8, #1
    and  r9, r7, r8    
    cmp  r8, r9
    beq fila2

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila3

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila4

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila5

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila6

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila7

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr

fila2: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE15_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET]


    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila3

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila4

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila5

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila6

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila7

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr 

fila3: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE11_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET]
    
    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila4

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila5

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila6

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila7

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr 

fila4: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE10_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET]


    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila5

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila6

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila7

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr  

fila5: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE5_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET] 


    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila6

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila7

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr  

fila6: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE4_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET]


    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila7

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr 

fila7: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE2_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET]
    

    lsl  r8, #1
    and  r9, r7, r8    
    cmp r8, r9
    beq fila8

    bx lr


fila8: 
    ldr     r10, =#GPIOE_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    
    mov     r0, #1
    lsl     r0, #GPIOE6_OFFSET
    bic     r5, r1, r0
    
    str     r5, [r10, #GPIO_PDOR_OFFSET]
    bx lr 