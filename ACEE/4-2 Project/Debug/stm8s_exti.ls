   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 53 void EXTI_DeInit(void)
  43                     ; 54 {
  45                     	switch	.text
  46  0000               _EXTI_DeInit:
  50                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 57 }
  59  0008 81            	ret
 185                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 185                     ; 71 {
 186                     	switch	.text
 187  0009               _EXTI_SetExtIntSensitivity:
 189  0009 89            	pushw	x
 190       00000000      OFST:	set	0
 193                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 195  000a 9e            	ld	a,xh
 196  000b 4d            	tnz	a
 197  000c 2714          	jreq	L21
 198  000e 9e            	ld	a,xh
 199  000f a101          	cp	a,#1
 200  0011 270f          	jreq	L21
 201  0013 9e            	ld	a,xh
 202  0014 a102          	cp	a,#2
 203  0016 270a          	jreq	L21
 204  0018 9e            	ld	a,xh
 205  0019 a103          	cp	a,#3
 206  001b 2705          	jreq	L21
 207  001d 9e            	ld	a,xh
 208  001e a104          	cp	a,#4
 209  0020 2603          	jrne	L01
 210  0022               L21:
 211  0022 4f            	clr	a
 212  0023 2010          	jra	L41
 213  0025               L01:
 214  0025 ae0049        	ldw	x,#73
 215  0028 89            	pushw	x
 216  0029 ae0000        	ldw	x,#0
 217  002c 89            	pushw	x
 218  002d ae0000        	ldw	x,#L111
 219  0030 cd0000        	call	_assert_failed
 221  0033 5b04          	addw	sp,#4
 222  0035               L41:
 223                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 225  0035 0d02          	tnz	(OFST+2,sp)
 226  0037 2712          	jreq	L02
 227  0039 7b02          	ld	a,(OFST+2,sp)
 228  003b a101          	cp	a,#1
 229  003d 270c          	jreq	L02
 230  003f 7b02          	ld	a,(OFST+2,sp)
 231  0041 a102          	cp	a,#2
 232  0043 2706          	jreq	L02
 233  0045 7b02          	ld	a,(OFST+2,sp)
 234  0047 a103          	cp	a,#3
 235  0049 2603          	jrne	L61
 236  004b               L02:
 237  004b 4f            	clr	a
 238  004c 2010          	jra	L22
 239  004e               L61:
 240  004e ae004a        	ldw	x,#74
 241  0051 89            	pushw	x
 242  0052 ae0000        	ldw	x,#0
 243  0055 89            	pushw	x
 244  0056 ae0000        	ldw	x,#L111
 245  0059 cd0000        	call	_assert_failed
 247  005c 5b04          	addw	sp,#4
 248  005e               L22:
 249                     ; 77   switch (Port)
 251  005e 7b01          	ld	a,(OFST+1,sp)
 253                     ; 99   default:
 253                     ; 100     break;
 254  0060 4d            	tnz	a
 255  0061 270e          	jreq	L12
 256  0063 4a            	dec	a
 257  0064 271d          	jreq	L32
 258  0066 4a            	dec	a
 259  0067 272e          	jreq	L52
 260  0069 4a            	dec	a
 261  006a 2742          	jreq	L72
 262  006c 4a            	dec	a
 263  006d 2756          	jreq	L13
 264  006f 2064          	jra	L511
 265  0071               L12:
 266                     ; 79   case EXTI_PORT_GPIOA:
 266                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 268  0071 c650a0        	ld	a,20640
 269  0074 a4fc          	and	a,#252
 270  0076 c750a0        	ld	20640,a
 271                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 273  0079 c650a0        	ld	a,20640
 274  007c 1a02          	or	a,(OFST+2,sp)
 275  007e c750a0        	ld	20640,a
 276                     ; 82     break;
 278  0081 2052          	jra	L511
 279  0083               L32:
 280                     ; 83   case EXTI_PORT_GPIOB:
 280                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 282  0083 c650a0        	ld	a,20640
 283  0086 a4f3          	and	a,#243
 284  0088 c750a0        	ld	20640,a
 285                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 287  008b 7b02          	ld	a,(OFST+2,sp)
 288  008d 48            	sll	a
 289  008e 48            	sll	a
 290  008f ca50a0        	or	a,20640
 291  0092 c750a0        	ld	20640,a
 292                     ; 86     break;
 294  0095 203e          	jra	L511
 295  0097               L52:
 296                     ; 87   case EXTI_PORT_GPIOC:
 296                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 298  0097 c650a0        	ld	a,20640
 299  009a a4cf          	and	a,#207
 300  009c c750a0        	ld	20640,a
 301                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 303  009f 7b02          	ld	a,(OFST+2,sp)
 304  00a1 97            	ld	xl,a
 305  00a2 a610          	ld	a,#16
 306  00a4 42            	mul	x,a
 307  00a5 9f            	ld	a,xl
 308  00a6 ca50a0        	or	a,20640
 309  00a9 c750a0        	ld	20640,a
 310                     ; 90     break;
 312  00ac 2027          	jra	L511
 313  00ae               L72:
 314                     ; 91   case EXTI_PORT_GPIOD:
 314                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 316  00ae c650a0        	ld	a,20640
 317  00b1 a43f          	and	a,#63
 318  00b3 c750a0        	ld	20640,a
 319                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 321  00b6 7b02          	ld	a,(OFST+2,sp)
 322  00b8 97            	ld	xl,a
 323  00b9 a640          	ld	a,#64
 324  00bb 42            	mul	x,a
 325  00bc 9f            	ld	a,xl
 326  00bd ca50a0        	or	a,20640
 327  00c0 c750a0        	ld	20640,a
 328                     ; 94     break;
 330  00c3 2010          	jra	L511
 331  00c5               L13:
 332                     ; 95   case EXTI_PORT_GPIOE:
 332                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 334  00c5 c650a1        	ld	a,20641
 335  00c8 a4fc          	and	a,#252
 336  00ca c750a1        	ld	20641,a
 337                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 339  00cd c650a1        	ld	a,20641
 340  00d0 1a02          	or	a,(OFST+2,sp)
 341  00d2 c750a1        	ld	20641,a
 342                     ; 98     break;
 344  00d5               L33:
 345                     ; 99   default:
 345                     ; 100     break;
 347  00d5               L511:
 348                     ; 102 }
 351  00d5 85            	popw	x
 352  00d6 81            	ret
 411                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 411                     ; 112 {
 412                     	switch	.text
 413  00d7               _EXTI_SetTLISensitivity:
 415  00d7 88            	push	a
 416       00000000      OFST:	set	0
 419                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 421  00d8 4d            	tnz	a
 422  00d9 2704          	jreq	L03
 423  00db a104          	cp	a,#4
 424  00dd 2603          	jrne	L62
 425  00df               L03:
 426  00df 4f            	clr	a
 427  00e0 2010          	jra	L23
 428  00e2               L62:
 429  00e2 ae0072        	ldw	x,#114
 430  00e5 89            	pushw	x
 431  00e6 ae0000        	ldw	x,#0
 432  00e9 89            	pushw	x
 433  00ea ae0000        	ldw	x,#L111
 434  00ed cd0000        	call	_assert_failed
 436  00f0 5b04          	addw	sp,#4
 437  00f2               L23:
 438                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 440  00f2 721550a1      	bres	20641,#2
 441                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 443  00f6 c650a1        	ld	a,20641
 444  00f9 1a01          	or	a,(OFST+1,sp)
 445  00fb c750a1        	ld	20641,a
 446                     ; 119 }
 449  00fe 84            	pop	a
 450  00ff 81            	ret
 497                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 497                     ; 127 {
 498                     	switch	.text
 499  0100               _EXTI_GetExtIntSensitivity:
 501  0100 88            	push	a
 502  0101 88            	push	a
 503       00000001      OFST:	set	1
 506                     ; 128   uint8_t value = 0;
 508  0102 0f01          	clr	(OFST+0,sp)
 509                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 511  0104 4d            	tnz	a
 512  0105 2710          	jreq	L04
 513  0107 a101          	cp	a,#1
 514  0109 270c          	jreq	L04
 515  010b a102          	cp	a,#2
 516  010d 2708          	jreq	L04
 517  010f a103          	cp	a,#3
 518  0111 2704          	jreq	L04
 519  0113 a104          	cp	a,#4
 520  0115 2603          	jrne	L63
 521  0117               L04:
 522  0117 4f            	clr	a
 523  0118 2010          	jra	L24
 524  011a               L63:
 525  011a ae0083        	ldw	x,#131
 526  011d 89            	pushw	x
 527  011e ae0000        	ldw	x,#0
 528  0121 89            	pushw	x
 529  0122 ae0000        	ldw	x,#L111
 530  0125 cd0000        	call	_assert_failed
 532  0128 5b04          	addw	sp,#4
 533  012a               L24:
 534                     ; 133   switch (Port)
 536  012a 7b02          	ld	a,(OFST+1,sp)
 538                     ; 150   default:
 538                     ; 151     break;
 539  012c 4d            	tnz	a
 540  012d 270e          	jreq	L541
 541  012f 4a            	dec	a
 542  0130 2714          	jreq	L741
 543  0132 4a            	dec	a
 544  0133 271c          	jreq	L151
 545  0135 4a            	dec	a
 546  0136 2725          	jreq	L351
 547  0138 4a            	dec	a
 548  0139 2730          	jreq	L551
 549  013b 2035          	jra	L502
 550  013d               L541:
 551                     ; 135   case EXTI_PORT_GPIOA:
 551                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 553  013d c650a0        	ld	a,20640
 554  0140 a403          	and	a,#3
 555  0142 6b01          	ld	(OFST+0,sp),a
 556                     ; 137     break;
 558  0144 202c          	jra	L502
 559  0146               L741:
 560                     ; 138   case EXTI_PORT_GPIOB:
 560                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 562  0146 c650a0        	ld	a,20640
 563  0149 a40c          	and	a,#12
 564  014b 44            	srl	a
 565  014c 44            	srl	a
 566  014d 6b01          	ld	(OFST+0,sp),a
 567                     ; 140     break;
 569  014f 2021          	jra	L502
 570  0151               L151:
 571                     ; 141   case EXTI_PORT_GPIOC:
 571                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 573  0151 c650a0        	ld	a,20640
 574  0154 a430          	and	a,#48
 575  0156 4e            	swap	a
 576  0157 a40f          	and	a,#15
 577  0159 6b01          	ld	(OFST+0,sp),a
 578                     ; 143     break;
 580  015b 2015          	jra	L502
 581  015d               L351:
 582                     ; 144   case EXTI_PORT_GPIOD:
 582                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 584  015d c650a0        	ld	a,20640
 585  0160 a4c0          	and	a,#192
 586  0162 4e            	swap	a
 587  0163 44            	srl	a
 588  0164 44            	srl	a
 589  0165 a403          	and	a,#3
 590  0167 6b01          	ld	(OFST+0,sp),a
 591                     ; 146     break;
 593  0169 2007          	jra	L502
 594  016b               L551:
 595                     ; 147   case EXTI_PORT_GPIOE:
 595                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 597  016b c650a1        	ld	a,20641
 598  016e a403          	and	a,#3
 599  0170 6b01          	ld	(OFST+0,sp),a
 600                     ; 149     break;
 602  0172               L751:
 603                     ; 150   default:
 603                     ; 151     break;
 605  0172               L502:
 606                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 608  0172 7b01          	ld	a,(OFST+0,sp)
 611  0174 85            	popw	x
 612  0175 81            	ret
 648                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 648                     ; 163 {
 649                     	switch	.text
 650  0176               _EXTI_GetTLISensitivity:
 652  0176 88            	push	a
 653       00000001      OFST:	set	1
 656                     ; 164   uint8_t value = 0;
 658                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 660  0177 c650a1        	ld	a,20641
 661  017a a404          	and	a,#4
 662  017c 6b01          	ld	(OFST+0,sp),a
 663                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 665  017e 7b01          	ld	a,(OFST+0,sp)
 668  0180 5b01          	addw	sp,#1
 669  0182 81            	ret
 682                     	xdef	_EXTI_GetTLISensitivity
 683                     	xdef	_EXTI_GetExtIntSensitivity
 684                     	xdef	_EXTI_SetTLISensitivity
 685                     	xdef	_EXTI_SetExtIntSensitivity
 686                     	xdef	_EXTI_DeInit
 687                     	xref	_assert_failed
 688                     .const:	section	.text
 689  0000               L111:
 690  0000 2e2e5c737476  	dc.b	"..\stvd\cosmic\stm"
 691  0012 38735f737464  	dc.b	"8s_stdperiph_lib\l"
 692  0024 696272617269  	dc.b	"ibraries\stm8s_std"
 693  0036 706572697068  	dc.b	"periph_driver\src\"
 694  0048 73746d38735f  	dc.b	"stm8s_exti.c",0
 714                     	end
