 #include "definitions.h"
 
  .syntax unified
  .global estado_leds
  .text
 
    .thumb_func 
estado_leds:
    push {lr}               // guarda la informacion de lr en el stack
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #var_estado_M0]   //carga en r0 el estado actual de la máquina de estados
    lsl r0, #2                     // lo multiplica por 4 para obtener el offset de la direccion en la memoria
    ldr r4, =dir_tabla_estados     // carga en r4 la direccion de la tabla de estados
     ldr r1, [r4, r0]               // guarda en r1 la direccion de la subrutina, sumando la direccion de la lista más el offset del estado calculado en r0
    bx r1                          // va a la subrutina del estado correspondiente 
 
    .thumb_func
COL1: 
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado

    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la primera columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB12_OFFSET         // B12 = col1
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6]  // Toma la informacion guardada en la RAM de la columna1
 
    bl Activarfilas


    // Cambiar al siguiente estado 
    mov r1, #col2
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr

    .thumb_func 
COL2: 
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado
    

    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la segunda columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB13_OFFSET         // B13 = col2
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6,col2]  // Toma la informacion guardada en la RAM de la columna2
 
    bl Activarfilas
      




    // Cambiar al siguiente estado 
    mov r1, #col3
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr

    .thumb_func 
COL3:
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado
    


    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la tercera columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB14_OFFSET         // B14 = col3
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6,col3]  // Toma la informacion guardada en la RAM de la columna2
 
    bl Activarfilas




    // Cambiar al siguiente estado 
    mov r1, #col4
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr 

    .thumb_func 
COL4:
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado
    


    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la cuarta columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB15_OFFSET         // B15 = col4
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6,col4]  // Toma la informacion guardada en la RAM de la columna2
 
    bl Activarfilas





    // Cambiar al siguiente estado 
    mov r1, #col5
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr 

    .thumb_func 
COL5:
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado
    

    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la quinta columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB16_OFFSET         // B16 = col5
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6,col5]  // Toma la informacion guardada en la RAM de la columna2
 
    bl Activarfilas
    

    // Cambiar al siguiente estado 
    mov r1, #col6
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr 

    .thumb_func 
COL6:
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado
    


    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la sexta columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB17_OFFSET         // B17 = col6
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6,col6]  // Toma la informacion guardada en la RAM de la columna2
 
    bl Activarfilas



    // Cambiar al siguiente estado 
    mov r1, #col7
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr
    
    .thumb_func  
COL7:
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado
    

    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la septima columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB0_OFFSET         // B0 = col7
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6,col7]  // Toma la informacion guardada en la RAM de la columna2
 
    bl Activarfilas




    // Cambiar al siguiente estado 
    mov r1, #col8
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr 

    .thumb_func 
COL8:
    ldr r4, =Base_maquina_0
    ldr r0, [r4, #entrada_tiempo_M0]  // el tiempo que va entrando 
    ldr r5, =TIEMPO                   // el tiempo que deberia durar el estado 
    cmp r0, r5              
    blt fin_estado
    

    // Desactiva las filas
    ldr     r0, =#GPIOE_BASE
    ldr     r5, =#GPIOE                 //las filas se desactivan con 1
    //ldr     r1, [r0, #GPIO_PDOR_OFFSET]
    //orr     r2, r1, r5

    str     r5, [r0, #GPIO_PDOR_OFFSET]

    // Desactiva las columnas
    ldr     r10, =#GPIOB_BASE
    ldr     r1, [r10, #GPIO_PDOR_OFFSET]
    mov     r0, 0b00000000000000000     //las columnas se activan con 1
    and     r5, r1, r0

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    
    //Activa la octava columna
    ldr     r10, =#GPIOB_BASE
    ldr     r11, [r10, #GPIO_PDOR_OFFSET]
    mov     r9, #1                       //las columnas se activan con 1
    lsl     r9, #GPIOB1_OFFSET         // B1 = col8
    orr     r5, r11, r9

    str     r5, [r10, #GPIO_PDOR_OFFSET]

    //Activación de Filas
    ldr  r6, =#base_logo
    ldrb r7, [r6,col8]  // Toma la informacion guardada en la RAM de la columna2
 
    bl Activarfilas


    // Cambiar al siguiente estado 
    mov r1, #col1
    str r1, [r4, #var_estado_M0]        // le dice a la maquina que el estado es el siguiente
    mov r2, #0
    str r2, [r4, entrada_tiempo_M0]     //reinicia el tiempo
    pop {lr}
    bx lr 

 
fin_estado:
    pop {lr}
    bx lr

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


.section .rodata
      .align 2                // Alinear la tabla de direcciones a 4 bytes (2^2 = 4)
// Lista de direcciones de los estados
dir_tabla_estados:         // guarda estos datos en una lista: la direccion se pone automaticamente
  .long COL1           //0
  .long COL2           //1
  .long COL3           //2
  .long COL4           //3
  .long COL5
  .long COL6
  .long COL7
  .long COL8           //7
 