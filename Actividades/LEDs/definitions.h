.text

// TIEMPOS
.equ TIEMPO, 1     //Tiempo Límite de persepcion del hombre

// DEFINICION ESTADOS
    .equ col1, 0
    .equ col2, 1
    .equ col3, 2
    .equ col4, 3
    .equ col5, 4
    .equ col6, 5
    .equ col7, 6
    .equ col8, 7

// BASE LOGO
.equ base_logo, 0x20000000

//----------------------------------------- PUERTOS ------------------------------------
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
 

 //-------------------------------------- GPIO -----------------------------------
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
 

//------------------------------------Systick -----------------------------------

 // Direcciones de los registros SysTick
.equ SYSTICK_BASE, 0xE000E010        // Base del SysTick
.equ SYST_CSR, (SYSTICK_BASE + 0x0)  // SysTick Control and Status Register
.equ SYST_RVR, (SYSTICK_BASE + 0x4)  // SysTick Reload Value Register
.equ SYST_CVR, (SYSTICK_BASE + 0x8)  // SysTick Current Value Register

.equ SYSTICK_ENABLE, 0x1             // Bit para habilitar el SysTick
.equ SYSTICK_TICKINT, 0x2            // Bit para habilitar la interrupción del SysTick
.equ SYSTICK_CLKSOURCE, 0x4          // Bit para seleccionar el reloj del procesador

.equ SYSTICK_RELOAD_1MS, 48000-1     // Valor para recargar el SysTick cada 1 ms (suponiendo un reloj de 48 MHz)

.equ Base_maquina_0, 0x20001000      // Dirección base compartida
.equ var_estado_M0, 0                // Offset para la variable de estado
.equ entrada_tiempo_M0, 4            // Offset para la entrada de tiempo transcurrido

.thumb_func
 