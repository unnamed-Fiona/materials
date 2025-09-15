   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 48 {
  46                     .text:	section	.text,new
  47  0000               f_NonHandledInterrupt:
  51                     ; 52 }
  54  0000 80            	iret
  76                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 61 {
  77                     .text:	section	.text,new
  78  0000               f_TRAP_IRQHandler:
  82                     ; 65 }
  85  0000 80            	iret
 107                     ; 67 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 68 
 107                     ; 69 {
 108                     .text:	section	.text,new
 109  0000               f_TLI_IRQHandler:
 113                     ; 73 }
 116  0000 80            	iret
 138                     ; 75 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 76 {
 139                     .text:	section	.text,new
 140  0000               f_AWU_IRQHandler:
 144                     ; 80 }
 147  0000 80            	iret
 169                     ; 82 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 83 {
 170                     .text:	section	.text,new
 171  0000               f_CLK_IRQHandler:
 175                     ; 87 }
 178  0000 80            	iret
 201                     ; 89 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 90 {
 202                     .text:	section	.text,new
 203  0000               f_EXTI_PORTA_IRQHandler:
 207                     ; 94 }
 210  0000 80            	iret
 233                     ; 96 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 97 {
 234                     .text:	section	.text,new
 235  0000               f_EXTI_PORTB_IRQHandler:
 239                     ; 101 }
 242  0000 80            	iret
 265                     ; 104 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 265                     ; 105 {
 266                     .text:	section	.text,new
 267  0000               f_EXTI_PORTD_IRQHandler:
 271                     ; 109 }
 274  0000 80            	iret
 297                     ; 111 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 297                     ; 112 {
 298                     .text:	section	.text,new
 299  0000               f_EXTI_PORTE_IRQHandler:
 303                     ; 116 }
 306  0000 80            	iret
 329                     ; 118  INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 329                     ; 119  {
 330                     .text:	section	.text,new
 331  0000               f_EXTI_PORTF_IRQHandler:
 335                     ; 123  }
 338  0000 80            	iret
 360                     ; 125 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 360                     ; 126 {
 361                     .text:	section	.text,new
 362  0000               f_SPI_IRQHandler:
 366                     ; 130 }
 369  0000 80            	iret
 392                     ; 132 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 392                     ; 133 {
 393                     .text:	section	.text,new
 394  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398                     ; 137 }
 401  0000 80            	iret
 424                     ; 139 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 424                     ; 140 {
 425                     .text:	section	.text,new
 426  0000               f_TIM1_CAP_COM_IRQHandler:
 430                     ; 144 }
 433  0000 80            	iret
 456                     ; 147  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 456                     ; 148  {
 457                     .text:	section	.text,new
 458  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 462                     ; 152  }
 465  0000 80            	iret
 488                     ; 155  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 488                     ; 156  {
 489                     .text:	section	.text,new
 490  0000               f_TIM2_CAP_COM_IRQHandler:
 494                     ; 160  }
 497  0000 80            	iret
 520                     ; 162  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 520                     ; 163  {
 521                     .text:	section	.text,new
 522  0000               f_UART1_TX_IRQHandler:
 526                     ; 167  }
 529  0000 80            	iret
 552                     ; 169  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 552                     ; 170  {
 553                     .text:	section	.text,new
 554  0000               f_UART1_RX_IRQHandler:
 558                     ; 174  }
 561  0000 80            	iret
 583                     ; 176 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 583                     ; 177 {
 584                     .text:	section	.text,new
 585  0000               f_I2C_IRQHandler:
 589                     ; 181 }
 592  0000 80            	iret
 614                     ; 185  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 614                     ; 186  {
 615                     .text:	section	.text,new
 616  0000               f_ADC1_IRQHandler:
 620                     ; 190  }
 623  0000 80            	iret
 646                     ; 192 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 646                     ; 193 {
 647                     .text:	section	.text,new
 648  0000               f_EEPROM_EEC_IRQHandler:
 652                     ; 197 }
 655  0000 80            	iret
 667                     	xdef	f_EXTI_PORTF_IRQHandler
 668                     	xdef	f_EEPROM_EEC_IRQHandler
 669                     	xdef	f_ADC1_IRQHandler
 670                     	xdef	f_I2C_IRQHandler
 671                     	xdef	f_UART1_RX_IRQHandler
 672                     	xdef	f_UART1_TX_IRQHandler
 673                     	xdef	f_TIM2_CAP_COM_IRQHandler
 674                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 675                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 676                     	xdef	f_TIM1_CAP_COM_IRQHandler
 677                     	xdef	f_SPI_IRQHandler
 678                     	xdef	f_EXTI_PORTE_IRQHandler
 679                     	xdef	f_EXTI_PORTD_IRQHandler
 680                     	xdef	f_EXTI_PORTB_IRQHandler
 681                     	xdef	f_EXTI_PORTA_IRQHandler
 682                     	xdef	f_CLK_IRQHandler
 683                     	xdef	f_AWU_IRQHandler
 684                     	xdef	f_TLI_IRQHandler
 685                     	xdef	f_TRAP_IRQHandler
 686                     	xdef	f_NonHandledInterrupt
 705                     	end
