   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 50 uint8_t ITC_GetCPUCC(void)
  44                     ; 51 {
  46                     .text:	section	.text,new
  47  0000               _ITC_GetCPUCC:
  51                     ; 53   _asm("push cc");
  54  0000 8a            push cc
  56                     ; 54   _asm("pop a");
  59  0001 84            pop a
  61                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  64  0002 81            	ret
  87                     ; 80 void ITC_DeInit(void)
  87                     ; 81 {
  88                     .text:	section	.text,new
  89  0000               _ITC_DeInit:
  93                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  95  0000 35ff7f70      	mov	32624,#255
  96                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  98  0004 35ff7f71      	mov	32625,#255
  99                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 101  0008 35ff7f72      	mov	32626,#255
 102                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 104  000c 35ff7f73      	mov	32627,#255
 105                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 107  0010 35ff7f74      	mov	32628,#255
 108                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 110  0014 35ff7f75      	mov	32629,#255
 111                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 113  0018 35ff7f76      	mov	32630,#255
 114                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 116  001c 35ff7f77      	mov	32631,#255
 117                     ; 90 }
 120  0020 81            	ret
 145                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 145                     ; 98 {
 146                     .text:	section	.text,new
 147  0000               _ITC_GetSoftIntStatus:
 151                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 153  0000 cd0000        	call	_ITC_GetCPUCC
 155  0003 a428          	and	a,#40
 158  0005 81            	ret
 408                     .const:	section	.text
 409  0000               L62:
 410  0000 003c          	dc.w	L14
 411  0002 003c          	dc.w	L14
 412  0004 003c          	dc.w	L14
 413  0006 003c          	dc.w	L14
 414  0008 0045          	dc.w	L34
 415  000a 0045          	dc.w	L34
 416  000c 0045          	dc.w	L34
 417  000e 0045          	dc.w	L34
 418  0010 0079          	dc.w	L502
 419  0012 0079          	dc.w	L502
 420  0014 004e          	dc.w	L54
 421  0016 004e          	dc.w	L54
 422  0018 0057          	dc.w	L74
 423  001a 0057          	dc.w	L74
 424  001c 0057          	dc.w	L74
 425  001e 0057          	dc.w	L74
 426  0020 0060          	dc.w	L15
 427  0022 0060          	dc.w	L15
 428  0024 0060          	dc.w	L15
 429  0026 0060          	dc.w	L15
 430  0028 0079          	dc.w	L502
 431  002a 0079          	dc.w	L502
 432  002c 0069          	dc.w	L35
 433  002e 0069          	dc.w	L35
 434  0030 0072          	dc.w	L55
 435                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 435                     ; 108 {
 436                     .text:	section	.text,new
 437  0000               _ITC_GetSoftwarePriority:
 439  0000 88            	push	a
 440  0001 89            	pushw	x
 441       00000002      OFST:	set	2
 444                     ; 109   uint8_t Value = 0;
 446  0002 0f02          	clr	(OFST+0,sp)
 447                     ; 110   uint8_t Mask = 0;
 449                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 451  0004 a119          	cp	a,#25
 452  0006 2403          	jruge	L41
 453  0008 4f            	clr	a
 454  0009 2010          	jra	L61
 455  000b               L41:
 456  000b ae0071        	ldw	x,#113
 457  000e 89            	pushw	x
 458  000f ae0000        	ldw	x,#0
 459  0012 89            	pushw	x
 460  0013 ae0064        	ldw	x,#L102
 461  0016 cd0000        	call	_assert_failed
 463  0019 5b04          	addw	sp,#4
 464  001b               L61:
 465                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 467  001b 7b03          	ld	a,(OFST+1,sp)
 468  001d a403          	and	a,#3
 469  001f 48            	sll	a
 470  0020 5f            	clrw	x
 471  0021 97            	ld	xl,a
 472  0022 a603          	ld	a,#3
 473  0024 5d            	tnzw	x
 474  0025 2704          	jreq	L02
 475  0027               L22:
 476  0027 48            	sll	a
 477  0028 5a            	decw	x
 478  0029 26fc          	jrne	L22
 479  002b               L02:
 480  002b 6b01          	ld	(OFST-1,sp),a
 481                     ; 118   switch (IrqNum)
 483  002d 7b03          	ld	a,(OFST+1,sp)
 485                     ; 198   default:
 485                     ; 199     break;
 486  002f a119          	cp	a,#25
 487  0031 2407          	jruge	L42
 488  0033 5f            	clrw	x
 489  0034 97            	ld	xl,a
 490  0035 58            	sllw	x
 491  0036 de0000        	ldw	x,(L62,x)
 492  0039 fc            	jp	(x)
 493  003a               L42:
 494  003a 203d          	jra	L502
 495  003c               L14:
 496                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 496                     ; 121   case ITC_IRQ_AWU:
 496                     ; 122   case ITC_IRQ_CLK:
 496                     ; 123   case ITC_IRQ_PORTA:
 496                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 498  003c c67f70        	ld	a,32624
 499  003f 1401          	and	a,(OFST-1,sp)
 500  0041 6b02          	ld	(OFST+0,sp),a
 501                     ; 125     break;
 503  0043 2034          	jra	L502
 504  0045               L34:
 505                     ; 127   case ITC_IRQ_PORTB:
 505                     ; 128   case ITC_IRQ_PORTC:
 505                     ; 129   case ITC_IRQ_PORTD:
 505                     ; 130   case ITC_IRQ_PORTE:
 505                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 507  0045 c67f71        	ld	a,32625
 508  0048 1401          	and	a,(OFST-1,sp)
 509  004a 6b02          	ld	(OFST+0,sp),a
 510                     ; 132     break;
 512  004c 202b          	jra	L502
 513  004e               L54:
 514                     ; 141   case ITC_IRQ_SPI:
 514                     ; 142   case ITC_IRQ_TIM1_OVF:
 514                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 516  004e c67f72        	ld	a,32626
 517  0051 1401          	and	a,(OFST-1,sp)
 518  0053 6b02          	ld	(OFST+0,sp),a
 519                     ; 144     break;
 521  0055 2022          	jra	L502
 522  0057               L74:
 523                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 523                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 523                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 523                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 523                     ; 150 #else
 523                     ; 151   case ITC_IRQ_TIM2_OVF:
 523                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 523                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 523                     ; 154   case ITC_IRQ_TIM3_OVF:
 523                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 525  0057 c67f73        	ld	a,32627
 526  005a 1401          	and	a,(OFST-1,sp)
 527  005c 6b02          	ld	(OFST+0,sp),a
 528                     ; 156     break;
 530  005e 2019          	jra	L502
 531  0060               L15:
 532                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 532                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 532                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 532                     ; 161   case ITC_IRQ_UART1_TX:
 532                     ; 162   case ITC_IRQ_UART1_RX:
 532                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 532                     ; 164 #if defined(STM8AF622x)
 532                     ; 165   case ITC_IRQ_UART4_TX:
 532                     ; 166   case ITC_IRQ_UART4_RX:
 532                     ; 167 #endif /*STM8AF622x */
 532                     ; 168   case ITC_IRQ_I2C:
 532                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 534  0060 c67f74        	ld	a,32628
 535  0063 1401          	and	a,(OFST-1,sp)
 536  0065 6b02          	ld	(OFST+0,sp),a
 537                     ; 170     break;
 539  0067 2010          	jra	L502
 540  0069               L35:
 541                     ; 184   case ITC_IRQ_ADC1:
 541                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 541                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 541                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 541                     ; 188 #else
 541                     ; 189   case ITC_IRQ_TIM4_OVF:
 541                     ; 190 #endif /*STM8S903 or STM8AF622x */
 541                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 543  0069 c67f75        	ld	a,32629
 544  006c 1401          	and	a,(OFST-1,sp)
 545  006e 6b02          	ld	(OFST+0,sp),a
 546                     ; 192     break;
 548  0070 2007          	jra	L502
 549  0072               L55:
 550                     ; 194   case ITC_IRQ_EEPROM_EEC:
 550                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 552  0072 c67f76        	ld	a,32630
 553  0075 1401          	and	a,(OFST-1,sp)
 554  0077 6b02          	ld	(OFST+0,sp),a
 555                     ; 196     break;
 557  0079               L75:
 558                     ; 198   default:
 558                     ; 199     break;
 560  0079               L502:
 561                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 563  0079 7b03          	ld	a,(OFST+1,sp)
 564  007b a403          	and	a,#3
 565  007d 48            	sll	a
 566  007e 5f            	clrw	x
 567  007f 97            	ld	xl,a
 568  0080 7b02          	ld	a,(OFST+0,sp)
 569  0082 5d            	tnzw	x
 570  0083 2704          	jreq	L03
 571  0085               L23:
 572  0085 44            	srl	a
 573  0086 5a            	decw	x
 574  0087 26fc          	jrne	L23
 575  0089               L03:
 576  0089 6b02          	ld	(OFST+0,sp),a
 577                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 579  008b 7b02          	ld	a,(OFST+0,sp)
 582  008d 5b03          	addw	sp,#3
 583  008f 81            	ret
 649                     	switch	.const
 650  0032               L66:
 651  0032 0091          	dc.w	L702
 652  0034 0091          	dc.w	L702
 653  0036 0091          	dc.w	L702
 654  0038 0091          	dc.w	L702
 655  003a 00a3          	dc.w	L112
 656  003c 00a3          	dc.w	L112
 657  003e 00a3          	dc.w	L112
 658  0040 00a3          	dc.w	L112
 659  0042 010d          	dc.w	L362
 660  0044 010d          	dc.w	L362
 661  0046 00b5          	dc.w	L312
 662  0048 00b5          	dc.w	L312
 663  004a 00c7          	dc.w	L512
 664  004c 00c7          	dc.w	L512
 665  004e 00c7          	dc.w	L512
 666  0050 00c7          	dc.w	L512
 667  0052 00d9          	dc.w	L712
 668  0054 00d9          	dc.w	L712
 669  0056 00d9          	dc.w	L712
 670  0058 00d9          	dc.w	L712
 671  005a 010d          	dc.w	L362
 672  005c 010d          	dc.w	L362
 673  005e 00eb          	dc.w	L122
 674  0060 00eb          	dc.w	L122
 675  0062 00fd          	dc.w	L322
 676                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 676                     ; 221 {
 677                     .text:	section	.text,new
 678  0000               _ITC_SetSoftwarePriority:
 680  0000 89            	pushw	x
 681  0001 89            	pushw	x
 682       00000002      OFST:	set	2
 685                     ; 222   uint8_t Mask = 0;
 687                     ; 223   uint8_t NewPriority = 0;
 689                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 691  0002 9e            	ld	a,xh
 692  0003 a119          	cp	a,#25
 693  0005 2403          	jruge	L63
 694  0007 4f            	clr	a
 695  0008 2010          	jra	L04
 696  000a               L63:
 697  000a ae00e2        	ldw	x,#226
 698  000d 89            	pushw	x
 699  000e ae0000        	ldw	x,#0
 700  0011 89            	pushw	x
 701  0012 ae0064        	ldw	x,#L102
 702  0015 cd0000        	call	_assert_failed
 704  0018 5b04          	addw	sp,#4
 705  001a               L04:
 706                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 708  001a 7b04          	ld	a,(OFST+2,sp)
 709  001c a102          	cp	a,#2
 710  001e 2710          	jreq	L44
 711  0020 7b04          	ld	a,(OFST+2,sp)
 712  0022 a101          	cp	a,#1
 713  0024 270a          	jreq	L44
 714  0026 0d04          	tnz	(OFST+2,sp)
 715  0028 2706          	jreq	L44
 716  002a 7b04          	ld	a,(OFST+2,sp)
 717  002c a103          	cp	a,#3
 718  002e 2603          	jrne	L24
 719  0030               L44:
 720  0030 4f            	clr	a
 721  0031 2010          	jra	L64
 722  0033               L24:
 723  0033 ae00e3        	ldw	x,#227
 724  0036 89            	pushw	x
 725  0037 ae0000        	ldw	x,#0
 726  003a 89            	pushw	x
 727  003b ae0064        	ldw	x,#L102
 728  003e cd0000        	call	_assert_failed
 730  0041 5b04          	addw	sp,#4
 731  0043               L64:
 732                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 734  0043 cd0000        	call	_ITC_GetSoftIntStatus
 736  0046 a128          	cp	a,#40
 737  0048 2603          	jrne	L05
 738  004a 4f            	clr	a
 739  004b 2010          	jra	L25
 740  004d               L05:
 741  004d ae00e6        	ldw	x,#230
 742  0050 89            	pushw	x
 743  0051 ae0000        	ldw	x,#0
 744  0054 89            	pushw	x
 745  0055 ae0064        	ldw	x,#L102
 746  0058 cd0000        	call	_assert_failed
 748  005b 5b04          	addw	sp,#4
 749  005d               L25:
 750                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 752  005d 7b03          	ld	a,(OFST+1,sp)
 753  005f a403          	and	a,#3
 754  0061 48            	sll	a
 755  0062 5f            	clrw	x
 756  0063 97            	ld	xl,a
 757  0064 a603          	ld	a,#3
 758  0066 5d            	tnzw	x
 759  0067 2704          	jreq	L45
 760  0069               L65:
 761  0069 48            	sll	a
 762  006a 5a            	decw	x
 763  006b 26fc          	jrne	L65
 764  006d               L45:
 765  006d 43            	cpl	a
 766  006e 6b01          	ld	(OFST-1,sp),a
 767                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 769  0070 7b03          	ld	a,(OFST+1,sp)
 770  0072 a403          	and	a,#3
 771  0074 48            	sll	a
 772  0075 5f            	clrw	x
 773  0076 97            	ld	xl,a
 774  0077 7b04          	ld	a,(OFST+2,sp)
 775  0079 5d            	tnzw	x
 776  007a 2704          	jreq	L06
 777  007c               L26:
 778  007c 48            	sll	a
 779  007d 5a            	decw	x
 780  007e 26fc          	jrne	L26
 781  0080               L06:
 782  0080 6b02          	ld	(OFST+0,sp),a
 783                     ; 239   switch (IrqNum)
 785  0082 7b03          	ld	a,(OFST+1,sp)
 787                     ; 329   default:
 787                     ; 330     break;
 788  0084 a119          	cp	a,#25
 789  0086 2407          	jruge	L46
 790  0088 5f            	clrw	x
 791  0089 97            	ld	xl,a
 792  008a 58            	sllw	x
 793  008b de0032        	ldw	x,(L66,x)
 794  008e fc            	jp	(x)
 795  008f               L46:
 796  008f 207c          	jra	L362
 797  0091               L702:
 798                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 798                     ; 242   case ITC_IRQ_AWU:
 798                     ; 243   case ITC_IRQ_CLK:
 798                     ; 244   case ITC_IRQ_PORTA:
 798                     ; 245     ITC->ISPR1 &= Mask;
 800  0091 c67f70        	ld	a,32624
 801  0094 1401          	and	a,(OFST-1,sp)
 802  0096 c77f70        	ld	32624,a
 803                     ; 246     ITC->ISPR1 |= NewPriority;
 805  0099 c67f70        	ld	a,32624
 806  009c 1a02          	or	a,(OFST+0,sp)
 807  009e c77f70        	ld	32624,a
 808                     ; 247     break;
 810  00a1 206a          	jra	L362
 811  00a3               L112:
 812                     ; 249   case ITC_IRQ_PORTB:
 812                     ; 250   case ITC_IRQ_PORTC:
 812                     ; 251   case ITC_IRQ_PORTD:
 812                     ; 252   case ITC_IRQ_PORTE:
 812                     ; 253     ITC->ISPR2 &= Mask;
 814  00a3 c67f71        	ld	a,32625
 815  00a6 1401          	and	a,(OFST-1,sp)
 816  00a8 c77f71        	ld	32625,a
 817                     ; 254     ITC->ISPR2 |= NewPriority;
 819  00ab c67f71        	ld	a,32625
 820  00ae 1a02          	or	a,(OFST+0,sp)
 821  00b0 c77f71        	ld	32625,a
 822                     ; 255     break;
 824  00b3 2058          	jra	L362
 825  00b5               L312:
 826                     ; 264   case ITC_IRQ_SPI:
 826                     ; 265   case ITC_IRQ_TIM1_OVF:
 826                     ; 266     ITC->ISPR3 &= Mask;
 828  00b5 c67f72        	ld	a,32626
 829  00b8 1401          	and	a,(OFST-1,sp)
 830  00ba c77f72        	ld	32626,a
 831                     ; 267     ITC->ISPR3 |= NewPriority;
 833  00bd c67f72        	ld	a,32626
 834  00c0 1a02          	or	a,(OFST+0,sp)
 835  00c2 c77f72        	ld	32626,a
 836                     ; 268     break;
 838  00c5 2046          	jra	L362
 839  00c7               L512:
 840                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 840                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 840                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 840                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 840                     ; 274 #else
 840                     ; 275   case ITC_IRQ_TIM2_OVF:
 840                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 840                     ; 277 #endif /*STM8S903 or STM8AF622x */
 840                     ; 278   case ITC_IRQ_TIM3_OVF:
 840                     ; 279     ITC->ISPR4 &= Mask;
 842  00c7 c67f73        	ld	a,32627
 843  00ca 1401          	and	a,(OFST-1,sp)
 844  00cc c77f73        	ld	32627,a
 845                     ; 280     ITC->ISPR4 |= NewPriority;
 847  00cf c67f73        	ld	a,32627
 848  00d2 1a02          	or	a,(OFST+0,sp)
 849  00d4 c77f73        	ld	32627,a
 850                     ; 281     break;
 852  00d7 2034          	jra	L362
 853  00d9               L712:
 854                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 854                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 854                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 854                     ; 286   case ITC_IRQ_UART1_TX:
 854                     ; 287   case ITC_IRQ_UART1_RX:
 854                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 854                     ; 289 #if defined(STM8AF622x)
 854                     ; 290   case ITC_IRQ_UART4_TX:
 854                     ; 291   case ITC_IRQ_UART4_RX:
 854                     ; 292 #endif /*STM8AF622x */
 854                     ; 293   case ITC_IRQ_I2C:
 854                     ; 294     ITC->ISPR5 &= Mask;
 856  00d9 c67f74        	ld	a,32628
 857  00dc 1401          	and	a,(OFST-1,sp)
 858  00de c77f74        	ld	32628,a
 859                     ; 295     ITC->ISPR5 |= NewPriority;
 861  00e1 c67f74        	ld	a,32628
 862  00e4 1a02          	or	a,(OFST+0,sp)
 863  00e6 c77f74        	ld	32628,a
 864                     ; 296     break;
 866  00e9 2022          	jra	L362
 867  00eb               L122:
 868                     ; 312   case ITC_IRQ_ADC1:
 868                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 868                     ; 314     
 868                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 868                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 868                     ; 317 #else
 868                     ; 318   case ITC_IRQ_TIM4_OVF:
 868                     ; 319 #endif /* STM8S903 or STM8AF622x */
 868                     ; 320     ITC->ISPR6 &= Mask;
 870  00eb c67f75        	ld	a,32629
 871  00ee 1401          	and	a,(OFST-1,sp)
 872  00f0 c77f75        	ld	32629,a
 873                     ; 321     ITC->ISPR6 |= NewPriority;
 875  00f3 c67f75        	ld	a,32629
 876  00f6 1a02          	or	a,(OFST+0,sp)
 877  00f8 c77f75        	ld	32629,a
 878                     ; 322     break;
 880  00fb 2010          	jra	L362
 881  00fd               L322:
 882                     ; 324   case ITC_IRQ_EEPROM_EEC:
 882                     ; 325     ITC->ISPR7 &= Mask;
 884  00fd c67f76        	ld	a,32630
 885  0100 1401          	and	a,(OFST-1,sp)
 886  0102 c77f76        	ld	32630,a
 887                     ; 326     ITC->ISPR7 |= NewPriority;
 889  0105 c67f76        	ld	a,32630
 890  0108 1a02          	or	a,(OFST+0,sp)
 891  010a c77f76        	ld	32630,a
 892                     ; 327     break;
 894  010d               L522:
 895                     ; 329   default:
 895                     ; 330     break;
 897  010d               L362:
 898                     ; 332 }
 901  010d 5b04          	addw	sp,#4
 902  010f 81            	ret
 915                     	xdef	_ITC_GetSoftwarePriority
 916                     	xdef	_ITC_SetSoftwarePriority
 917                     	xdef	_ITC_GetSoftIntStatus
 918                     	xdef	_ITC_DeInit
 919                     	xdef	_ITC_GetCPUCC
 920                     	xref	_assert_failed
 921                     	switch	.const
 922  0064               L102:
 923  0064 2e2e5c737476  	dc.b	"..\stvd\cosmic\stm"
 924  0076 38735f737464  	dc.b	"8s_stdperiph_lib\l"
 925  0088 696272617269  	dc.b	"ibraries\stm8s_std"
 926  009a 706572697068  	dc.b	"periph_driver\src\"
 927  00ac 73746d38735f  	dc.b	"stm8s_itc.c",0
 947                     	end
