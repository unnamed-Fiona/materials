   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 48 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 52 }
  53  0000 80            	iret
  75                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 61 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 65 }
  84  0001 80            	iret
 106                     ; 67 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 68 
 106                     ; 69 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 73 }
 115  0002 80            	iret
 137                     ; 75 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 76 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 80 }
 146  0003 80            	iret
 168                     ; 82 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 83 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 87 }
 177  0004 80            	iret
 200                     ; 89 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 90 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 94 }
 209  0005 80            	iret
 232                     ; 96 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 97 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 101 }
 241  0006 80            	iret
 264                     ; 104 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 264                     ; 105 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTD_IRQHandler:
 270                     ; 109 }
 273  0007 80            	iret
 296                     ; 111 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 296                     ; 112 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTE_IRQHandler:
 302                     ; 116 }
 305  0008 80            	iret
 328                     ; 118  INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 328                     ; 119  {
 329                     	switch	.text
 330  0009               f_EXTI_PORTF_IRQHandler:
 334                     ; 123  }
 337  0009 80            	iret
 359                     ; 125 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 126 {
 360                     	switch	.text
 361  000a               f_SPI_IRQHandler:
 365                     ; 130 }
 368  000a 80            	iret
 391                     ; 132 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 133 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 397                     ; 137 }
 400  000b 80            	iret
 423                     ; 139 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 423                     ; 140 {
 424                     	switch	.text
 425  000c               f_TIM1_CAP_COM_IRQHandler:
 429                     ; 144 }
 432  000c 80            	iret
 455                     ; 147  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 455                     ; 148  {
 456                     	switch	.text
 457  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 461                     ; 152  }
 464  000d 80            	iret
 487                     ; 155  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 487                     ; 156  {
 488                     	switch	.text
 489  000e               f_TIM2_CAP_COM_IRQHandler:
 493                     ; 160  }
 496  000e 80            	iret
 519                     ; 162  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 519                     ; 163  {
 520                     	switch	.text
 521  000f               f_UART1_TX_IRQHandler:
 525                     ; 167  }
 528  000f 80            	iret
 551                     ; 169  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 551                     ; 170  {
 552                     	switch	.text
 553  0010               f_UART1_RX_IRQHandler:
 557                     ; 174  }
 560  0010 80            	iret
 582                     ; 176 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 582                     ; 177 {
 583                     	switch	.text
 584  0011               f_I2C_IRQHandler:
 588                     ; 181 }
 591  0011 80            	iret
 613                     ; 185  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 613                     ; 186  {
 614                     	switch	.text
 615  0012               f_ADC1_IRQHandler:
 619                     ; 190  }
 622  0012 80            	iret
 645                     ; 192 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 645                     ; 193 {
 646                     	switch	.text
 647  0013               f_EEPROM_EEC_IRQHandler:
 651                     ; 197 }
 654  0013 80            	iret
 666                     	xdef	f_EXTI_PORTF_IRQHandler
 667                     	xdef	f_EEPROM_EEC_IRQHandler
 668                     	xdef	f_ADC1_IRQHandler
 669                     	xdef	f_I2C_IRQHandler
 670                     	xdef	f_UART1_RX_IRQHandler
 671                     	xdef	f_UART1_TX_IRQHandler
 672                     	xdef	f_TIM2_CAP_COM_IRQHandler
 673                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 674                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 675                     	xdef	f_TIM1_CAP_COM_IRQHandler
 676                     	xdef	f_SPI_IRQHandler
 677                     	xdef	f_EXTI_PORTE_IRQHandler
 678                     	xdef	f_EXTI_PORTD_IRQHandler
 679                     	xdef	f_EXTI_PORTB_IRQHandler
 680                     	xdef	f_EXTI_PORTA_IRQHandler
 681                     	xdef	f_CLK_IRQHandler
 682                     	xdef	f_AWU_IRQHandler
 683                     	xdef	f_TLI_IRQHandler
 684                     	xdef	f_TRAP_IRQHandler
 685                     	xdef	f_NonHandledInterrupt
 704                     	end
