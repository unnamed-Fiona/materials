   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     .const:	section	.text
  17  0000               _HSIDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004               _CLKPrescTable:
  23  0004 01            	dc.b	1
  24  0005 02            	dc.b	2
  25  0006 04            	dc.b	4
  26  0007 08            	dc.b	8
  27  0008 0a            	dc.b	10
  28  0009 10            	dc.b	16
  29  000a 14            	dc.b	20
  30  000b 28            	dc.b	40
  59                     ; 72 void CLK_DeInit(void)
  59                     ; 73 {
  61                     .text:	section	.text,new
  62  0000               _CLK_DeInit:
  66                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  68  0000 350150c0      	mov	20672,#1
  69                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  71  0004 725f50c1      	clr	20673
  72                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  74  0008 35e150c4      	mov	20676,#225
  75                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  77  000c 725f50c5      	clr	20677
  78                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  80  0010 351850c6      	mov	20678,#24
  81                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  83  0014 35ff50c7      	mov	20679,#255
  84                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  86  0018 35ff50ca      	mov	20682,#255
  87                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  001c 725f50c8      	clr	20680
  90                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  0020 725f50c9      	clr	20681
  94  0024               L52:
  95                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  97  0024 c650c9        	ld	a,20681
  98  0027 a501          	bcp	a,#1
  99  0029 26f9          	jrne	L52
 100                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  002b 725f50c9      	clr	20681
 103                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002f 725f50cc      	clr	20684
 106                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0033 725f50cd      	clr	20685
 109                     ; 88 }
 112  0037 81            	ret
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     .text:	section	.text,new
 171  0000               _CLK_FastHaltWakeUpCmd:
 173  0000 88            	push	a
 174       00000000      OFST:	set	0
 177                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 179  0001 4d            	tnz	a
 180  0002 2704          	jreq	L21
 181  0004 a101          	cp	a,#1
 182  0006 2603          	jrne	L01
 183  0008               L21:
 184  0008 4f            	clr	a
 185  0009 2010          	jra	L41
 186  000b               L01:
 187  000b ae0066        	ldw	x,#102
 188  000e 89            	pushw	x
 189  000f ae0000        	ldw	x,#0
 190  0012 89            	pushw	x
 191  0013 ae000c        	ldw	x,#L75
 192  0016 cd0000        	call	_assert_failed
 194  0019 5b04          	addw	sp,#4
 195  001b               L41:
 196                     ; 104   if (NewState != DISABLE)
 198  001b 0d01          	tnz	(OFST+1,sp)
 199  001d 2706          	jreq	L16
 200                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 202  001f 721450c0      	bset	20672,#2
 204  0023 2004          	jra	L36
 205  0025               L16:
 206                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 208  0025 721550c0      	bres	20672,#2
 209  0029               L36:
 210                     ; 114 }
 213  0029 84            	pop	a
 214  002a 81            	ret
 250                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 250                     ; 122 {
 251                     .text:	section	.text,new
 252  0000               _CLK_HSECmd:
 254  0000 88            	push	a
 255       00000000      OFST:	set	0
 258                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 260  0001 4d            	tnz	a
 261  0002 2704          	jreq	L22
 262  0004 a101          	cp	a,#1
 263  0006 2603          	jrne	L02
 264  0008               L22:
 265  0008 4f            	clr	a
 266  0009 2010          	jra	L42
 267  000b               L02:
 268  000b ae007c        	ldw	x,#124
 269  000e 89            	pushw	x
 270  000f ae0000        	ldw	x,#0
 271  0012 89            	pushw	x
 272  0013 ae000c        	ldw	x,#L75
 273  0016 cd0000        	call	_assert_failed
 275  0019 5b04          	addw	sp,#4
 276  001b               L42:
 277                     ; 126   if (NewState != DISABLE)
 279  001b 0d01          	tnz	(OFST+1,sp)
 280  001d 2706          	jreq	L301
 281                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 283  001f 721050c1      	bset	20673,#0
 285  0023 2004          	jra	L501
 286  0025               L301:
 287                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 289  0025 721150c1      	bres	20673,#0
 290  0029               L501:
 291                     ; 136 }
 294  0029 84            	pop	a
 295  002a 81            	ret
 331                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 331                     ; 144 {
 332                     .text:	section	.text,new
 333  0000               _CLK_HSICmd:
 335  0000 88            	push	a
 336       00000000      OFST:	set	0
 339                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 341  0001 4d            	tnz	a
 342  0002 2704          	jreq	L23
 343  0004 a101          	cp	a,#1
 344  0006 2603          	jrne	L03
 345  0008               L23:
 346  0008 4f            	clr	a
 347  0009 2010          	jra	L43
 348  000b               L03:
 349  000b ae0092        	ldw	x,#146
 350  000e 89            	pushw	x
 351  000f ae0000        	ldw	x,#0
 352  0012 89            	pushw	x
 353  0013 ae000c        	ldw	x,#L75
 354  0016 cd0000        	call	_assert_failed
 356  0019 5b04          	addw	sp,#4
 357  001b               L43:
 358                     ; 148   if (NewState != DISABLE)
 360  001b 0d01          	tnz	(OFST+1,sp)
 361  001d 2706          	jreq	L521
 362                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 364  001f 721050c0      	bset	20672,#0
 366  0023 2004          	jra	L721
 367  0025               L521:
 368                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 370  0025 721150c0      	bres	20672,#0
 371  0029               L721:
 372                     ; 158 }
 375  0029 84            	pop	a
 376  002a 81            	ret
 412                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 412                     ; 167 {
 413                     .text:	section	.text,new
 414  0000               _CLK_LSICmd:
 416  0000 88            	push	a
 417       00000000      OFST:	set	0
 420                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 422  0001 4d            	tnz	a
 423  0002 2704          	jreq	L24
 424  0004 a101          	cp	a,#1
 425  0006 2603          	jrne	L04
 426  0008               L24:
 427  0008 4f            	clr	a
 428  0009 2010          	jra	L44
 429  000b               L04:
 430  000b ae00a9        	ldw	x,#169
 431  000e 89            	pushw	x
 432  000f ae0000        	ldw	x,#0
 433  0012 89            	pushw	x
 434  0013 ae000c        	ldw	x,#L75
 435  0016 cd0000        	call	_assert_failed
 437  0019 5b04          	addw	sp,#4
 438  001b               L44:
 439                     ; 171   if (NewState != DISABLE)
 441  001b 0d01          	tnz	(OFST+1,sp)
 442  001d 2706          	jreq	L741
 443                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 445  001f 721650c0      	bset	20672,#3
 447  0023 2004          	jra	L151
 448  0025               L741:
 449                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 451  0025 721750c0      	bres	20672,#3
 452  0029               L151:
 453                     ; 181 }
 456  0029 84            	pop	a
 457  002a 81            	ret
 493                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 493                     ; 190 {
 494                     .text:	section	.text,new
 495  0000               _CLK_CCOCmd:
 497  0000 88            	push	a
 498       00000000      OFST:	set	0
 501                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 503  0001 4d            	tnz	a
 504  0002 2704          	jreq	L25
 505  0004 a101          	cp	a,#1
 506  0006 2603          	jrne	L05
 507  0008               L25:
 508  0008 4f            	clr	a
 509  0009 2010          	jra	L45
 510  000b               L05:
 511  000b ae00c0        	ldw	x,#192
 512  000e 89            	pushw	x
 513  000f ae0000        	ldw	x,#0
 514  0012 89            	pushw	x
 515  0013 ae000c        	ldw	x,#L75
 516  0016 cd0000        	call	_assert_failed
 518  0019 5b04          	addw	sp,#4
 519  001b               L45:
 520                     ; 194   if (NewState != DISABLE)
 522  001b 0d01          	tnz	(OFST+1,sp)
 523  001d 2706          	jreq	L171
 524                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 526  001f 721050c9      	bset	20681,#0
 528  0023 2004          	jra	L371
 529  0025               L171:
 530                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 532  0025 721150c9      	bres	20681,#0
 533  0029               L371:
 534                     ; 204 }
 537  0029 84            	pop	a
 538  002a 81            	ret
 574                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 574                     ; 214 {
 575                     .text:	section	.text,new
 576  0000               _CLK_ClockSwitchCmd:
 578  0000 88            	push	a
 579       00000000      OFST:	set	0
 582                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 584  0001 4d            	tnz	a
 585  0002 2704          	jreq	L26
 586  0004 a101          	cp	a,#1
 587  0006 2603          	jrne	L06
 588  0008               L26:
 589  0008 4f            	clr	a
 590  0009 2010          	jra	L46
 591  000b               L06:
 592  000b ae00d8        	ldw	x,#216
 593  000e 89            	pushw	x
 594  000f ae0000        	ldw	x,#0
 595  0012 89            	pushw	x
 596  0013 ae000c        	ldw	x,#L75
 597  0016 cd0000        	call	_assert_failed
 599  0019 5b04          	addw	sp,#4
 600  001b               L46:
 601                     ; 218   if (NewState != DISABLE )
 603  001b 0d01          	tnz	(OFST+1,sp)
 604  001d 2706          	jreq	L312
 605                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 607  001f 721250c5      	bset	20677,#1
 609  0023 2004          	jra	L512
 610  0025               L312:
 611                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 613  0025 721350c5      	bres	20677,#1
 614  0029               L512:
 615                     ; 228 }
 618  0029 84            	pop	a
 619  002a 81            	ret
 656                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 656                     ; 239 {
 657                     .text:	section	.text,new
 658  0000               _CLK_SlowActiveHaltWakeUpCmd:
 660  0000 88            	push	a
 661       00000000      OFST:	set	0
 664                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 666  0001 4d            	tnz	a
 667  0002 2704          	jreq	L27
 668  0004 a101          	cp	a,#1
 669  0006 2603          	jrne	L07
 670  0008               L27:
 671  0008 4f            	clr	a
 672  0009 2010          	jra	L47
 673  000b               L07:
 674  000b ae00f1        	ldw	x,#241
 675  000e 89            	pushw	x
 676  000f ae0000        	ldw	x,#0
 677  0012 89            	pushw	x
 678  0013 ae000c        	ldw	x,#L75
 679  0016 cd0000        	call	_assert_failed
 681  0019 5b04          	addw	sp,#4
 682  001b               L47:
 683                     ; 243   if (NewState != DISABLE)
 685  001b 0d01          	tnz	(OFST+1,sp)
 686  001d 2706          	jreq	L532
 687                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 689  001f 721a50c0      	bset	20672,#5
 691  0023 2004          	jra	L732
 692  0025               L532:
 693                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 695  0025 721b50c0      	bres	20672,#5
 696  0029               L732:
 697                     ; 253 }
 700  0029 84            	pop	a
 701  002a 81            	ret
 861                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 861                     ; 264 {
 862                     .text:	section	.text,new
 863  0000               _CLK_PeripheralClockConfig:
 865  0000 89            	pushw	x
 866       00000000      OFST:	set	0
 869                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 871  0001 9f            	ld	a,xl
 872  0002 4d            	tnz	a
 873  0003 2705          	jreq	L201
 874  0005 9f            	ld	a,xl
 875  0006 a101          	cp	a,#1
 876  0008 2603          	jrne	L001
 877  000a               L201:
 878  000a 4f            	clr	a
 879  000b 2010          	jra	L401
 880  000d               L001:
 881  000d ae010a        	ldw	x,#266
 882  0010 89            	pushw	x
 883  0011 ae0000        	ldw	x,#0
 884  0014 89            	pushw	x
 885  0015 ae000c        	ldw	x,#L75
 886  0018 cd0000        	call	_assert_failed
 888  001b 5b04          	addw	sp,#4
 889  001d               L401:
 890                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 892  001d 0d01          	tnz	(OFST+1,sp)
 893  001f 274e          	jreq	L011
 894  0021 7b01          	ld	a,(OFST+1,sp)
 895  0023 a101          	cp	a,#1
 896  0025 2748          	jreq	L011
 897  0027 7b01          	ld	a,(OFST+1,sp)
 898  0029 a103          	cp	a,#3
 899  002b 2742          	jreq	L011
 900  002d 7b01          	ld	a,(OFST+1,sp)
 901  002f a103          	cp	a,#3
 902  0031 273c          	jreq	L011
 903  0033 7b01          	ld	a,(OFST+1,sp)
 904  0035 a103          	cp	a,#3
 905  0037 2736          	jreq	L011
 906  0039 7b01          	ld	a,(OFST+1,sp)
 907  003b a104          	cp	a,#4
 908  003d 2730          	jreq	L011
 909  003f 7b01          	ld	a,(OFST+1,sp)
 910  0041 a105          	cp	a,#5
 911  0043 272a          	jreq	L011
 912  0045 7b01          	ld	a,(OFST+1,sp)
 913  0047 a105          	cp	a,#5
 914  0049 2724          	jreq	L011
 915  004b 7b01          	ld	a,(OFST+1,sp)
 916  004d a104          	cp	a,#4
 917  004f 271e          	jreq	L011
 918  0051 7b01          	ld	a,(OFST+1,sp)
 919  0053 a106          	cp	a,#6
 920  0055 2718          	jreq	L011
 921  0057 7b01          	ld	a,(OFST+1,sp)
 922  0059 a107          	cp	a,#7
 923  005b 2712          	jreq	L011
 924  005d 7b01          	ld	a,(OFST+1,sp)
 925  005f a117          	cp	a,#23
 926  0061 270c          	jreq	L011
 927  0063 7b01          	ld	a,(OFST+1,sp)
 928  0065 a113          	cp	a,#19
 929  0067 2706          	jreq	L011
 930  0069 7b01          	ld	a,(OFST+1,sp)
 931  006b a112          	cp	a,#18
 932  006d 2603          	jrne	L601
 933  006f               L011:
 934  006f 4f            	clr	a
 935  0070 2010          	jra	L211
 936  0072               L601:
 937  0072 ae010b        	ldw	x,#267
 938  0075 89            	pushw	x
 939  0076 ae0000        	ldw	x,#0
 940  0079 89            	pushw	x
 941  007a ae000c        	ldw	x,#L75
 942  007d cd0000        	call	_assert_failed
 944  0080 5b04          	addw	sp,#4
 945  0082               L211:
 946                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 948  0082 7b01          	ld	a,(OFST+1,sp)
 949  0084 a510          	bcp	a,#16
 950  0086 2633          	jrne	L323
 951                     ; 271     if (NewState != DISABLE)
 953  0088 0d02          	tnz	(OFST+2,sp)
 954  008a 2717          	jreq	L523
 955                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 957  008c 7b01          	ld	a,(OFST+1,sp)
 958  008e a40f          	and	a,#15
 959  0090 5f            	clrw	x
 960  0091 97            	ld	xl,a
 961  0092 a601          	ld	a,#1
 962  0094 5d            	tnzw	x
 963  0095 2704          	jreq	L411
 964  0097               L611:
 965  0097 48            	sll	a
 966  0098 5a            	decw	x
 967  0099 26fc          	jrne	L611
 968  009b               L411:
 969  009b ca50c7        	or	a,20679
 970  009e c750c7        	ld	20679,a
 972  00a1 2049          	jra	L133
 973  00a3               L523:
 974                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 976  00a3 7b01          	ld	a,(OFST+1,sp)
 977  00a5 a40f          	and	a,#15
 978  00a7 5f            	clrw	x
 979  00a8 97            	ld	xl,a
 980  00a9 a601          	ld	a,#1
 981  00ab 5d            	tnzw	x
 982  00ac 2704          	jreq	L021
 983  00ae               L221:
 984  00ae 48            	sll	a
 985  00af 5a            	decw	x
 986  00b0 26fc          	jrne	L221
 987  00b2               L021:
 988  00b2 43            	cpl	a
 989  00b3 c450c7        	and	a,20679
 990  00b6 c750c7        	ld	20679,a
 991  00b9 2031          	jra	L133
 992  00bb               L323:
 993                     ; 284     if (NewState != DISABLE)
 995  00bb 0d02          	tnz	(OFST+2,sp)
 996  00bd 2717          	jreq	L333
 997                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 999  00bf 7b01          	ld	a,(OFST+1,sp)
1000  00c1 a40f          	and	a,#15
1001  00c3 5f            	clrw	x
1002  00c4 97            	ld	xl,a
1003  00c5 a601          	ld	a,#1
1004  00c7 5d            	tnzw	x
1005  00c8 2704          	jreq	L421
1006  00ca               L621:
1007  00ca 48            	sll	a
1008  00cb 5a            	decw	x
1009  00cc 26fc          	jrne	L621
1010  00ce               L421:
1011  00ce ca50ca        	or	a,20682
1012  00d1 c750ca        	ld	20682,a
1014  00d4 2016          	jra	L133
1015  00d6               L333:
1016                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1018  00d6 7b01          	ld	a,(OFST+1,sp)
1019  00d8 a40f          	and	a,#15
1020  00da 5f            	clrw	x
1021  00db 97            	ld	xl,a
1022  00dc a601          	ld	a,#1
1023  00de 5d            	tnzw	x
1024  00df 2704          	jreq	L031
1025  00e1               L231:
1026  00e1 48            	sll	a
1027  00e2 5a            	decw	x
1028  00e3 26fc          	jrne	L231
1029  00e5               L031:
1030  00e5 43            	cpl	a
1031  00e6 c450ca        	and	a,20682
1032  00e9 c750ca        	ld	20682,a
1033  00ec               L133:
1034                     ; 295 }
1037  00ec 85            	popw	x
1038  00ed 81            	ret
1227                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1227                     ; 310 {
1228                     .text:	section	.text,new
1229  0000               _CLK_ClockSwitchConfig:
1231  0000 89            	pushw	x
1232  0001 5204          	subw	sp,#4
1233       00000004      OFST:	set	4
1236                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1238  0003 aeffff        	ldw	x,#65535
1239  0006 1f03          	ldw	(OFST-1,sp),x
1240                     ; 313   ErrorStatus Swif = ERROR;
1242                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1244  0008 7b06          	ld	a,(OFST+2,sp)
1245  000a a1e1          	cp	a,#225
1246  000c 270c          	jreq	L041
1247  000e 7b06          	ld	a,(OFST+2,sp)
1248  0010 a1d2          	cp	a,#210
1249  0012 2706          	jreq	L041
1250  0014 7b06          	ld	a,(OFST+2,sp)
1251  0016 a1b4          	cp	a,#180
1252  0018 2603          	jrne	L631
1253  001a               L041:
1254  001a 4f            	clr	a
1255  001b 2010          	jra	L241
1256  001d               L631:
1257  001d ae013c        	ldw	x,#316
1258  0020 89            	pushw	x
1259  0021 ae0000        	ldw	x,#0
1260  0024 89            	pushw	x
1261  0025 ae000c        	ldw	x,#L75
1262  0028 cd0000        	call	_assert_failed
1264  002b 5b04          	addw	sp,#4
1265  002d               L241:
1266                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1268  002d 0d05          	tnz	(OFST+1,sp)
1269  002f 2706          	jreq	L641
1270  0031 7b05          	ld	a,(OFST+1,sp)
1271  0033 a101          	cp	a,#1
1272  0035 2603          	jrne	L441
1273  0037               L641:
1274  0037 4f            	clr	a
1275  0038 2010          	jra	L051
1276  003a               L441:
1277  003a ae013d        	ldw	x,#317
1278  003d 89            	pushw	x
1279  003e ae0000        	ldw	x,#0
1280  0041 89            	pushw	x
1281  0042 ae000c        	ldw	x,#L75
1282  0045 cd0000        	call	_assert_failed
1284  0048 5b04          	addw	sp,#4
1285  004a               L051:
1286                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1288  004a 0d09          	tnz	(OFST+5,sp)
1289  004c 2706          	jreq	L451
1290  004e 7b09          	ld	a,(OFST+5,sp)
1291  0050 a101          	cp	a,#1
1292  0052 2603          	jrne	L251
1293  0054               L451:
1294  0054 4f            	clr	a
1295  0055 2010          	jra	L651
1296  0057               L251:
1297  0057 ae013e        	ldw	x,#318
1298  005a 89            	pushw	x
1299  005b ae0000        	ldw	x,#0
1300  005e 89            	pushw	x
1301  005f ae000c        	ldw	x,#L75
1302  0062 cd0000        	call	_assert_failed
1304  0065 5b04          	addw	sp,#4
1305  0067               L651:
1306                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1308  0067 0d0a          	tnz	(OFST+6,sp)
1309  0069 2706          	jreq	L261
1310  006b 7b0a          	ld	a,(OFST+6,sp)
1311  006d a101          	cp	a,#1
1312  006f 2603          	jrne	L061
1313  0071               L261:
1314  0071 4f            	clr	a
1315  0072 2010          	jra	L461
1316  0074               L061:
1317  0074 ae013f        	ldw	x,#319
1318  0077 89            	pushw	x
1319  0078 ae0000        	ldw	x,#0
1320  007b 89            	pushw	x
1321  007c ae000c        	ldw	x,#L75
1322  007f cd0000        	call	_assert_failed
1324  0082 5b04          	addw	sp,#4
1325  0084               L461:
1326                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1328  0084 c650c3        	ld	a,20675
1329  0087 6b01          	ld	(OFST-3,sp),a
1330                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1332  0089 7b05          	ld	a,(OFST+1,sp)
1333  008b a101          	cp	a,#1
1334  008d 264b          	jrne	L744
1335                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1337  008f 721250c5      	bset	20677,#1
1338                     ; 331     if (ITState != DISABLE)
1340  0093 0d09          	tnz	(OFST+5,sp)
1341  0095 2706          	jreq	L154
1342                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1344  0097 721450c5      	bset	20677,#2
1346  009b 2004          	jra	L354
1347  009d               L154:
1348                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1350  009d 721550c5      	bres	20677,#2
1351  00a1               L354:
1352                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1354  00a1 7b06          	ld	a,(OFST+2,sp)
1355  00a3 c750c4        	ld	20676,a
1357  00a6 2007          	jra	L164
1358  00a8               L554:
1359                     ; 346       DownCounter--;
1361  00a8 1e03          	ldw	x,(OFST-1,sp)
1362  00aa 1d0001        	subw	x,#1
1363  00ad 1f03          	ldw	(OFST-1,sp),x
1364  00af               L164:
1365                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1367  00af c650c5        	ld	a,20677
1368  00b2 a501          	bcp	a,#1
1369  00b4 2704          	jreq	L564
1371  00b6 1e03          	ldw	x,(OFST-1,sp)
1372  00b8 26ee          	jrne	L554
1373  00ba               L564:
1374                     ; 349     if(DownCounter != 0)
1376  00ba 1e03          	ldw	x,(OFST-1,sp)
1377  00bc 2706          	jreq	L764
1378                     ; 351       Swif = SUCCESS;
1380  00be a601          	ld	a,#1
1381  00c0 6b02          	ld	(OFST-2,sp),a
1383  00c2 2002          	jra	L374
1384  00c4               L764:
1385                     ; 355       Swif = ERROR;
1387  00c4 0f02          	clr	(OFST-2,sp)
1388  00c6               L374:
1389                     ; 390   if(Swif != ERROR)
1391  00c6 0d02          	tnz	(OFST-2,sp)
1392  00c8 2767          	jreq	L715
1393                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1395  00ca 0d0a          	tnz	(OFST+6,sp)
1396  00cc 2645          	jrne	L125
1398  00ce 7b01          	ld	a,(OFST-3,sp)
1399  00d0 a1e1          	cp	a,#225
1400  00d2 263f          	jrne	L125
1401                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1403  00d4 721150c0      	bres	20672,#0
1405  00d8 2057          	jra	L715
1406  00da               L744:
1407                     ; 361     if (ITState != DISABLE)
1409  00da 0d09          	tnz	(OFST+5,sp)
1410  00dc 2706          	jreq	L574
1411                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1413  00de 721450c5      	bset	20677,#2
1415  00e2 2004          	jra	L774
1416  00e4               L574:
1417                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1419  00e4 721550c5      	bres	20677,#2
1420  00e8               L774:
1421                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1423  00e8 7b06          	ld	a,(OFST+2,sp)
1424  00ea c750c4        	ld	20676,a
1426  00ed 2007          	jra	L505
1427  00ef               L105:
1428                     ; 376       DownCounter--;
1430  00ef 1e03          	ldw	x,(OFST-1,sp)
1431  00f1 1d0001        	subw	x,#1
1432  00f4 1f03          	ldw	(OFST-1,sp),x
1433  00f6               L505:
1434                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1436  00f6 c650c5        	ld	a,20677
1437  00f9 a508          	bcp	a,#8
1438  00fb 2704          	jreq	L115
1440  00fd 1e03          	ldw	x,(OFST-1,sp)
1441  00ff 26ee          	jrne	L105
1442  0101               L115:
1443                     ; 379     if(DownCounter != 0)
1445  0101 1e03          	ldw	x,(OFST-1,sp)
1446  0103 270a          	jreq	L315
1447                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1449  0105 721250c5      	bset	20677,#1
1450                     ; 383       Swif = SUCCESS;
1452  0109 a601          	ld	a,#1
1453  010b 6b02          	ld	(OFST-2,sp),a
1455  010d 20b7          	jra	L374
1456  010f               L315:
1457                     ; 387       Swif = ERROR;
1459  010f 0f02          	clr	(OFST-2,sp)
1460  0111 20b3          	jra	L374
1461  0113               L125:
1462                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1464  0113 0d0a          	tnz	(OFST+6,sp)
1465  0115 260c          	jrne	L525
1467  0117 7b01          	ld	a,(OFST-3,sp)
1468  0119 a1d2          	cp	a,#210
1469  011b 2606          	jrne	L525
1470                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1472  011d 721750c0      	bres	20672,#3
1474  0121 200e          	jra	L715
1475  0123               L525:
1476                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1478  0123 0d0a          	tnz	(OFST+6,sp)
1479  0125 260a          	jrne	L715
1481  0127 7b01          	ld	a,(OFST-3,sp)
1482  0129 a1b4          	cp	a,#180
1483  012b 2604          	jrne	L715
1484                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1486  012d 721150c1      	bres	20673,#0
1487  0131               L715:
1488                     ; 406   return(Swif);
1490  0131 7b02          	ld	a,(OFST-2,sp)
1493  0133 5b06          	addw	sp,#6
1494  0135 81            	ret
1633                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1633                     ; 416 {
1634                     .text:	section	.text,new
1635  0000               _CLK_HSIPrescalerConfig:
1637  0000 88            	push	a
1638       00000000      OFST:	set	0
1641                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1643  0001 4d            	tnz	a
1644  0002 270c          	jreq	L271
1645  0004 a108          	cp	a,#8
1646  0006 2708          	jreq	L271
1647  0008 a110          	cp	a,#16
1648  000a 2704          	jreq	L271
1649  000c a118          	cp	a,#24
1650  000e 2603          	jrne	L071
1651  0010               L271:
1652  0010 4f            	clr	a
1653  0011 2010          	jra	L471
1654  0013               L071:
1655  0013 ae01a2        	ldw	x,#418
1656  0016 89            	pushw	x
1657  0017 ae0000        	ldw	x,#0
1658  001a 89            	pushw	x
1659  001b ae000c        	ldw	x,#L75
1660  001e cd0000        	call	_assert_failed
1662  0021 5b04          	addw	sp,#4
1663  0023               L471:
1664                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1666  0023 c650c6        	ld	a,20678
1667  0026 a4e7          	and	a,#231
1668  0028 c750c6        	ld	20678,a
1669                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1671  002b c650c6        	ld	a,20678
1672  002e 1a01          	or	a,(OFST+1,sp)
1673  0030 c750c6        	ld	20678,a
1674                     ; 425 }
1677  0033 84            	pop	a
1678  0034 81            	ret
1814                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1814                     ; 437 {
1815                     .text:	section	.text,new
1816  0000               _CLK_CCOConfig:
1818  0000 88            	push	a
1819       00000000      OFST:	set	0
1822                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1824  0001 4d            	tnz	a
1825  0002 2730          	jreq	L202
1826  0004 a104          	cp	a,#4
1827  0006 272c          	jreq	L202
1828  0008 a102          	cp	a,#2
1829  000a 2728          	jreq	L202
1830  000c a108          	cp	a,#8
1831  000e 2724          	jreq	L202
1832  0010 a10a          	cp	a,#10
1833  0012 2720          	jreq	L202
1834  0014 a10c          	cp	a,#12
1835  0016 271c          	jreq	L202
1836  0018 a10e          	cp	a,#14
1837  001a 2718          	jreq	L202
1838  001c a110          	cp	a,#16
1839  001e 2714          	jreq	L202
1840  0020 a112          	cp	a,#18
1841  0022 2710          	jreq	L202
1842  0024 a114          	cp	a,#20
1843  0026 270c          	jreq	L202
1844  0028 a116          	cp	a,#22
1845  002a 2708          	jreq	L202
1846  002c a118          	cp	a,#24
1847  002e 2704          	jreq	L202
1848  0030 a11a          	cp	a,#26
1849  0032 2603          	jrne	L002
1850  0034               L202:
1851  0034 4f            	clr	a
1852  0035 2010          	jra	L402
1853  0037               L002:
1854  0037 ae01b7        	ldw	x,#439
1855  003a 89            	pushw	x
1856  003b ae0000        	ldw	x,#0
1857  003e 89            	pushw	x
1858  003f ae000c        	ldw	x,#L75
1859  0042 cd0000        	call	_assert_failed
1861  0045 5b04          	addw	sp,#4
1862  0047               L402:
1863                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1865  0047 c650c9        	ld	a,20681
1866  004a a4e1          	and	a,#225
1867  004c c750c9        	ld	20681,a
1868                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1870  004f c650c9        	ld	a,20681
1871  0052 1a01          	or	a,(OFST+1,sp)
1872  0054 c750c9        	ld	20681,a
1873                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1875  0057 721050c9      	bset	20681,#0
1876                     ; 449 }
1879  005b 84            	pop	a
1880  005c 81            	ret
1946                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1946                     ; 460 {
1947                     .text:	section	.text,new
1948  0000               _CLK_ITConfig:
1950  0000 89            	pushw	x
1951       00000000      OFST:	set	0
1954                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1956  0001 9f            	ld	a,xl
1957  0002 4d            	tnz	a
1958  0003 2705          	jreq	L212
1959  0005 9f            	ld	a,xl
1960  0006 a101          	cp	a,#1
1961  0008 2603          	jrne	L012
1962  000a               L212:
1963  000a 4f            	clr	a
1964  000b 2010          	jra	L412
1965  000d               L012:
1966  000d ae01ce        	ldw	x,#462
1967  0010 89            	pushw	x
1968  0011 ae0000        	ldw	x,#0
1969  0014 89            	pushw	x
1970  0015 ae000c        	ldw	x,#L75
1971  0018 cd0000        	call	_assert_failed
1973  001b 5b04          	addw	sp,#4
1974  001d               L412:
1975                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1977  001d 7b01          	ld	a,(OFST+1,sp)
1978  001f a10c          	cp	a,#12
1979  0021 2706          	jreq	L022
1980  0023 7b01          	ld	a,(OFST+1,sp)
1981  0025 a11c          	cp	a,#28
1982  0027 2603          	jrne	L612
1983  0029               L022:
1984  0029 4f            	clr	a
1985  002a 2010          	jra	L222
1986  002c               L612:
1987  002c ae01cf        	ldw	x,#463
1988  002f 89            	pushw	x
1989  0030 ae0000        	ldw	x,#0
1990  0033 89            	pushw	x
1991  0034 ae000c        	ldw	x,#L75
1992  0037 cd0000        	call	_assert_failed
1994  003a 5b04          	addw	sp,#4
1995  003c               L222:
1996                     ; 465   if (NewState != DISABLE)
1998  003c 0d02          	tnz	(OFST+2,sp)
1999  003e 271a          	jreq	L727
2000                     ; 467     switch (CLK_IT)
2002  0040 7b01          	ld	a,(OFST+1,sp)
2004                     ; 475     default:
2004                     ; 476       break;
2005  0042 a00c          	sub	a,#12
2006  0044 270a          	jreq	L366
2007  0046 a010          	sub	a,#16
2008  0048 2624          	jrne	L537
2009                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
2009                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
2011  004a 721450c5      	bset	20677,#2
2012                     ; 471       break;
2014  004e 201e          	jra	L537
2015  0050               L366:
2016                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
2016                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
2018  0050 721450c8      	bset	20680,#2
2019                     ; 474       break;
2021  0054 2018          	jra	L537
2022  0056               L566:
2023                     ; 475     default:
2023                     ; 476       break;
2025  0056 2016          	jra	L537
2026  0058               L337:
2028  0058 2014          	jra	L537
2029  005a               L727:
2030                     ; 481     switch (CLK_IT)
2032  005a 7b01          	ld	a,(OFST+1,sp)
2034                     ; 489     default:
2034                     ; 490       break;
2035  005c a00c          	sub	a,#12
2036  005e 270a          	jreq	L176
2037  0060 a010          	sub	a,#16
2038  0062 260a          	jrne	L537
2039                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2039                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2041  0064 721550c5      	bres	20677,#2
2042                     ; 485       break;
2044  0068 2004          	jra	L537
2045  006a               L176:
2046                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2046                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2048  006a 721550c8      	bres	20680,#2
2049                     ; 488       break;
2050  006e               L537:
2051                     ; 493 }
2054  006e 85            	popw	x
2055  006f 81            	ret
2056  0070               L376:
2057                     ; 489     default:
2057                     ; 490       break;
2059  0070 20fc          	jra	L537
2060  0072               L147:
2061  0072 20fa          	jra	L537
2097                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2097                     ; 501 {
2098                     .text:	section	.text,new
2099  0000               _CLK_SYSCLKConfig:
2101  0000 88            	push	a
2102       00000000      OFST:	set	0
2105                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2107  0001 4d            	tnz	a
2108  0002 272c          	jreq	L032
2109  0004 a108          	cp	a,#8
2110  0006 2728          	jreq	L032
2111  0008 a110          	cp	a,#16
2112  000a 2724          	jreq	L032
2113  000c a118          	cp	a,#24
2114  000e 2720          	jreq	L032
2115  0010 a180          	cp	a,#128
2116  0012 271c          	jreq	L032
2117  0014 a181          	cp	a,#129
2118  0016 2718          	jreq	L032
2119  0018 a182          	cp	a,#130
2120  001a 2714          	jreq	L032
2121  001c a183          	cp	a,#131
2122  001e 2710          	jreq	L032
2123  0020 a184          	cp	a,#132
2124  0022 270c          	jreq	L032
2125  0024 a185          	cp	a,#133
2126  0026 2708          	jreq	L032
2127  0028 a186          	cp	a,#134
2128  002a 2704          	jreq	L032
2129  002c a187          	cp	a,#135
2130  002e 2603          	jrne	L622
2131  0030               L032:
2132  0030 4f            	clr	a
2133  0031 2010          	jra	L232
2134  0033               L622:
2135  0033 ae01f7        	ldw	x,#503
2136  0036 89            	pushw	x
2137  0037 ae0000        	ldw	x,#0
2138  003a 89            	pushw	x
2139  003b ae000c        	ldw	x,#L75
2140  003e cd0000        	call	_assert_failed
2142  0041 5b04          	addw	sp,#4
2143  0043               L232:
2144                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2146  0043 7b01          	ld	a,(OFST+1,sp)
2147  0045 a580          	bcp	a,#128
2148  0047 2614          	jrne	L167
2149                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2151  0049 c650c6        	ld	a,20678
2152  004c a4e7          	and	a,#231
2153  004e c750c6        	ld	20678,a
2154                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2156  0051 7b01          	ld	a,(OFST+1,sp)
2157  0053 a418          	and	a,#24
2158  0055 ca50c6        	or	a,20678
2159  0058 c750c6        	ld	20678,a
2161  005b 2012          	jra	L367
2162  005d               L167:
2163                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2165  005d c650c6        	ld	a,20678
2166  0060 a4f8          	and	a,#248
2167  0062 c750c6        	ld	20678,a
2168                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2170  0065 7b01          	ld	a,(OFST+1,sp)
2171  0067 a407          	and	a,#7
2172  0069 ca50c6        	or	a,20678
2173  006c c750c6        	ld	20678,a
2174  006f               L367:
2175                     ; 515 }
2178  006f 84            	pop	a
2179  0070 81            	ret
2236                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2236                     ; 524 {
2237                     .text:	section	.text,new
2238  0000               _CLK_SWIMConfig:
2240  0000 88            	push	a
2241       00000000      OFST:	set	0
2244                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2246  0001 4d            	tnz	a
2247  0002 2704          	jreq	L042
2248  0004 a101          	cp	a,#1
2249  0006 2603          	jrne	L632
2250  0008               L042:
2251  0008 4f            	clr	a
2252  0009 2010          	jra	L242
2253  000b               L632:
2254  000b ae020e        	ldw	x,#526
2255  000e 89            	pushw	x
2256  000f ae0000        	ldw	x,#0
2257  0012 89            	pushw	x
2258  0013 ae000c        	ldw	x,#L75
2259  0016 cd0000        	call	_assert_failed
2261  0019 5b04          	addw	sp,#4
2262  001b               L242:
2263                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2265  001b 0d01          	tnz	(OFST+1,sp)
2266  001d 2706          	jreq	L3101
2267                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2269  001f 721050cd      	bset	20685,#0
2271  0023 2004          	jra	L5101
2272  0025               L3101:
2273                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2275  0025 721150cd      	bres	20685,#0
2276  0029               L5101:
2277                     ; 538 }
2280  0029 84            	pop	a
2281  002a 81            	ret
2305                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2305                     ; 548 {
2306                     .text:	section	.text,new
2307  0000               _CLK_ClockSecuritySystemEnable:
2311                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2313  0000 721050c8      	bset	20680,#0
2314                     ; 551 }
2317  0004 81            	ret
2342                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2342                     ; 560 {
2343                     .text:	section	.text,new
2344  0000               _CLK_GetSYSCLKSource:
2348                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2350  0000 c650c3        	ld	a,20675
2353  0003 81            	ret
2416                     ; 569 uint32_t CLK_GetClockFreq(void)
2416                     ; 570 {
2417                     .text:	section	.text,new
2418  0000               _CLK_GetClockFreq:
2420  0000 5209          	subw	sp,#9
2421       00000009      OFST:	set	9
2424                     ; 571   uint32_t clockfrequency = 0;
2426                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2428                     ; 573   uint8_t tmp = 0, presc = 0;
2432                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2434  0002 c650c3        	ld	a,20675
2435  0005 6b09          	ld	(OFST+0,sp),a
2436                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2438  0007 7b09          	ld	a,(OFST+0,sp)
2439  0009 a1e1          	cp	a,#225
2440  000b 2641          	jrne	L1701
2441                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2443  000d c650c6        	ld	a,20678
2444  0010 a418          	and	a,#24
2445  0012 6b09          	ld	(OFST+0,sp),a
2446                     ; 581     tmp = (uint8_t)(tmp >> 3);
2448  0014 0409          	srl	(OFST+0,sp)
2449  0016 0409          	srl	(OFST+0,sp)
2450  0018 0409          	srl	(OFST+0,sp)
2451                     ; 582     presc = HSIDivFactor[tmp];
2453  001a 7b09          	ld	a,(OFST+0,sp)
2454  001c 5f            	clrw	x
2455  001d 97            	ld	xl,a
2456  001e d60000        	ld	a,(_HSIDivFactor,x)
2457  0021 6b09          	ld	(OFST+0,sp),a
2458                     ; 583     clockfrequency = HSI_VALUE / presc;
2460  0023 7b09          	ld	a,(OFST+0,sp)
2461  0025 b703          	ld	c_lreg+3,a
2462  0027 3f02          	clr	c_lreg+2
2463  0029 3f01          	clr	c_lreg+1
2464  002b 3f00          	clr	c_lreg
2465  002d 96            	ldw	x,sp
2466  002e 1c0001        	addw	x,#OFST-8
2467  0031 cd0000        	call	c_rtol
2469  0034 ae2400        	ldw	x,#9216
2470  0037 bf02          	ldw	c_lreg+2,x
2471  0039 ae00f4        	ldw	x,#244
2472  003c bf00          	ldw	c_lreg,x
2473  003e 96            	ldw	x,sp
2474  003f 1c0001        	addw	x,#OFST-8
2475  0042 cd0000        	call	c_ludv
2477  0045 96            	ldw	x,sp
2478  0046 1c0005        	addw	x,#OFST-4
2479  0049 cd0000        	call	c_rtol
2482  004c 201c          	jra	L3701
2483  004e               L1701:
2484                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2486  004e 7b09          	ld	a,(OFST+0,sp)
2487  0050 a1d2          	cp	a,#210
2488  0052 260c          	jrne	L5701
2489                     ; 587     clockfrequency = LSI_VALUE;
2491  0054 aef400        	ldw	x,#62464
2492  0057 1f07          	ldw	(OFST-2,sp),x
2493  0059 ae0001        	ldw	x,#1
2494  005c 1f05          	ldw	(OFST-4,sp),x
2496  005e 200a          	jra	L3701
2497  0060               L5701:
2498                     ; 591     clockfrequency = HSE_VALUE;
2500  0060 ae2400        	ldw	x,#9216
2501  0063 1f07          	ldw	(OFST-2,sp),x
2502  0065 ae00f4        	ldw	x,#244
2503  0068 1f05          	ldw	(OFST-4,sp),x
2504  006a               L3701:
2505                     ; 594   return((uint32_t)clockfrequency);
2507  006a 96            	ldw	x,sp
2508  006b 1c0005        	addw	x,#OFST-4
2509  006e cd0000        	call	c_ltor
2513  0071 5b09          	addw	sp,#9
2514  0073 81            	ret
2614                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2614                     ; 605 {
2615                     .text:	section	.text,new
2616  0000               _CLK_AdjustHSICalibrationValue:
2618  0000 88            	push	a
2619       00000000      OFST:	set	0
2622                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2624  0001 4d            	tnz	a
2625  0002 271c          	jreq	L652
2626  0004 a101          	cp	a,#1
2627  0006 2718          	jreq	L652
2628  0008 a102          	cp	a,#2
2629  000a 2714          	jreq	L652
2630  000c a103          	cp	a,#3
2631  000e 2710          	jreq	L652
2632  0010 a104          	cp	a,#4
2633  0012 270c          	jreq	L652
2634  0014 a105          	cp	a,#5
2635  0016 2708          	jreq	L652
2636  0018 a106          	cp	a,#6
2637  001a 2704          	jreq	L652
2638  001c a107          	cp	a,#7
2639  001e 2603          	jrne	L452
2640  0020               L652:
2641  0020 4f            	clr	a
2642  0021 2010          	jra	L062
2643  0023               L452:
2644  0023 ae025f        	ldw	x,#607
2645  0026 89            	pushw	x
2646  0027 ae0000        	ldw	x,#0
2647  002a 89            	pushw	x
2648  002b ae000c        	ldw	x,#L75
2649  002e cd0000        	call	_assert_failed
2651  0031 5b04          	addw	sp,#4
2652  0033               L062:
2653                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2655  0033 c650cc        	ld	a,20684
2656  0036 a4f8          	and	a,#248
2657  0038 1a01          	or	a,(OFST+1,sp)
2658  003a c750cc        	ld	20684,a
2659                     ; 611 }
2662  003d 84            	pop	a
2663  003e 81            	ret
2687                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2687                     ; 623 {
2688                     .text:	section	.text,new
2689  0000               _CLK_SYSCLKEmergencyClear:
2693                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2695  0000 721150c5      	bres	20677,#0
2696                     ; 625 }
2699  0004 81            	ret
2853                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2853                     ; 635 {
2854                     .text:	section	.text,new
2855  0000               _CLK_GetFlagStatus:
2857  0000 89            	pushw	x
2858  0001 5203          	subw	sp,#3
2859       00000003      OFST:	set	3
2862                     ; 636   uint16_t statusreg = 0;
2864                     ; 637   uint8_t tmpreg = 0;
2866                     ; 638   FlagStatus bitstatus = RESET;
2868                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2870  0003 a30110        	cpw	x,#272
2871  0006 2728          	jreq	L072
2872  0008 a30102        	cpw	x,#258
2873  000b 2723          	jreq	L072
2874  000d a30202        	cpw	x,#514
2875  0010 271e          	jreq	L072
2876  0012 a30308        	cpw	x,#776
2877  0015 2719          	jreq	L072
2878  0017 a30301        	cpw	x,#769
2879  001a 2714          	jreq	L072
2880  001c a30408        	cpw	x,#1032
2881  001f 270f          	jreq	L072
2882  0021 a30402        	cpw	x,#1026
2883  0024 270a          	jreq	L072
2884  0026 a30504        	cpw	x,#1284
2885  0029 2705          	jreq	L072
2886  002b a30502        	cpw	x,#1282
2887  002e 2603          	jrne	L662
2888  0030               L072:
2889  0030 4f            	clr	a
2890  0031 2010          	jra	L272
2891  0033               L662:
2892  0033 ae0281        	ldw	x,#641
2893  0036 89            	pushw	x
2894  0037 ae0000        	ldw	x,#0
2895  003a 89            	pushw	x
2896  003b ae000c        	ldw	x,#L75
2897  003e cd0000        	call	_assert_failed
2899  0041 5b04          	addw	sp,#4
2900  0043               L272:
2901                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2903  0043 7b04          	ld	a,(OFST+1,sp)
2904  0045 97            	ld	xl,a
2905  0046 7b05          	ld	a,(OFST+2,sp)
2906  0048 9f            	ld	a,xl
2907  0049 a4ff          	and	a,#255
2908  004b 97            	ld	xl,a
2909  004c 4f            	clr	a
2910  004d 02            	rlwa	x,a
2911  004e 1f01          	ldw	(OFST-2,sp),x
2912  0050 01            	rrwa	x,a
2913                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2915  0051 1e01          	ldw	x,(OFST-2,sp)
2916  0053 a30100        	cpw	x,#256
2917  0056 2607          	jrne	L3421
2918                     ; 649     tmpreg = CLK->ICKR;
2920  0058 c650c0        	ld	a,20672
2921  005b 6b03          	ld	(OFST+0,sp),a
2923  005d 202f          	jra	L5421
2924  005f               L3421:
2925                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2927  005f 1e01          	ldw	x,(OFST-2,sp)
2928  0061 a30200        	cpw	x,#512
2929  0064 2607          	jrne	L7421
2930                     ; 653     tmpreg = CLK->ECKR;
2932  0066 c650c1        	ld	a,20673
2933  0069 6b03          	ld	(OFST+0,sp),a
2935  006b 2021          	jra	L5421
2936  006d               L7421:
2937                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2939  006d 1e01          	ldw	x,(OFST-2,sp)
2940  006f a30300        	cpw	x,#768
2941  0072 2607          	jrne	L3521
2942                     ; 657     tmpreg = CLK->SWCR;
2944  0074 c650c5        	ld	a,20677
2945  0077 6b03          	ld	(OFST+0,sp),a
2947  0079 2013          	jra	L5421
2948  007b               L3521:
2949                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2951  007b 1e01          	ldw	x,(OFST-2,sp)
2952  007d a30400        	cpw	x,#1024
2953  0080 2607          	jrne	L7521
2954                     ; 661     tmpreg = CLK->CSSR;
2956  0082 c650c8        	ld	a,20680
2957  0085 6b03          	ld	(OFST+0,sp),a
2959  0087 2005          	jra	L5421
2960  0089               L7521:
2961                     ; 665     tmpreg = CLK->CCOR;
2963  0089 c650c9        	ld	a,20681
2964  008c 6b03          	ld	(OFST+0,sp),a
2965  008e               L5421:
2966                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2968  008e 7b05          	ld	a,(OFST+2,sp)
2969  0090 1503          	bcp	a,(OFST+0,sp)
2970  0092 2706          	jreq	L3621
2971                     ; 670     bitstatus = SET;
2973  0094 a601          	ld	a,#1
2974  0096 6b03          	ld	(OFST+0,sp),a
2976  0098 2002          	jra	L5621
2977  009a               L3621:
2978                     ; 674     bitstatus = RESET;
2980  009a 0f03          	clr	(OFST+0,sp)
2981  009c               L5621:
2982                     ; 678   return((FlagStatus)bitstatus);
2984  009c 7b03          	ld	a,(OFST+0,sp)
2987  009e 5b05          	addw	sp,#5
2988  00a0 81            	ret
3035                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3035                     ; 688 {
3036                     .text:	section	.text,new
3037  0000               _CLK_GetITStatus:
3039  0000 88            	push	a
3040  0001 88            	push	a
3041       00000001      OFST:	set	1
3044                     ; 689   ITStatus bitstatus = RESET;
3046                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
3048  0002 a10c          	cp	a,#12
3049  0004 2704          	jreq	L003
3050  0006 a11c          	cp	a,#28
3051  0008 2603          	jrne	L672
3052  000a               L003:
3053  000a 4f            	clr	a
3054  000b 2010          	jra	L203
3055  000d               L672:
3056  000d ae02b4        	ldw	x,#692
3057  0010 89            	pushw	x
3058  0011 ae0000        	ldw	x,#0
3059  0014 89            	pushw	x
3060  0015 ae000c        	ldw	x,#L75
3061  0018 cd0000        	call	_assert_failed
3063  001b 5b04          	addw	sp,#4
3064  001d               L203:
3065                     ; 694   if (CLK_IT == CLK_IT_SWIF)
3067  001d 7b02          	ld	a,(OFST+1,sp)
3068  001f a11c          	cp	a,#28
3069  0021 2613          	jrne	L1131
3070                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3072  0023 c650c5        	ld	a,20677
3073  0026 1402          	and	a,(OFST+1,sp)
3074  0028 a10c          	cp	a,#12
3075  002a 2606          	jrne	L3131
3076                     ; 699       bitstatus = SET;
3078  002c a601          	ld	a,#1
3079  002e 6b01          	ld	(OFST+0,sp),a
3081  0030 2015          	jra	L7131
3082  0032               L3131:
3083                     ; 703       bitstatus = RESET;
3085  0032 0f01          	clr	(OFST+0,sp)
3086  0034 2011          	jra	L7131
3087  0036               L1131:
3088                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3090  0036 c650c8        	ld	a,20680
3091  0039 1402          	and	a,(OFST+1,sp)
3092  003b a10c          	cp	a,#12
3093  003d 2606          	jrne	L1231
3094                     ; 711       bitstatus = SET;
3096  003f a601          	ld	a,#1
3097  0041 6b01          	ld	(OFST+0,sp),a
3099  0043 2002          	jra	L7131
3100  0045               L1231:
3101                     ; 715       bitstatus = RESET;
3103  0045 0f01          	clr	(OFST+0,sp)
3104  0047               L7131:
3105                     ; 720   return bitstatus;
3107  0047 7b01          	ld	a,(OFST+0,sp)
3110  0049 85            	popw	x
3111  004a 81            	ret
3148                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3148                     ; 730 {
3149                     .text:	section	.text,new
3150  0000               _CLK_ClearITPendingBit:
3152  0000 88            	push	a
3153       00000000      OFST:	set	0
3156                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
3158  0001 a10c          	cp	a,#12
3159  0003 2704          	jreq	L013
3160  0005 a11c          	cp	a,#28
3161  0007 2603          	jrne	L603
3162  0009               L013:
3163  0009 4f            	clr	a
3164  000a 2010          	jra	L213
3165  000c               L603:
3166  000c ae02dc        	ldw	x,#732
3167  000f 89            	pushw	x
3168  0010 ae0000        	ldw	x,#0
3169  0013 89            	pushw	x
3170  0014 ae000c        	ldw	x,#L75
3171  0017 cd0000        	call	_assert_failed
3173  001a 5b04          	addw	sp,#4
3174  001c               L213:
3175                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3177  001c 7b01          	ld	a,(OFST+1,sp)
3178  001e a10c          	cp	a,#12
3179  0020 2606          	jrne	L3431
3180                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3182  0022 721750c8      	bres	20680,#3
3184  0026 2004          	jra	L5431
3185  0028               L3431:
3186                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3188  0028 721750c5      	bres	20677,#3
3189  002c               L5431:
3190                     ; 745 }
3193  002c 84            	pop	a
3194  002d 81            	ret
3229                     	xdef	_CLKPrescTable
3230                     	xdef	_HSIDivFactor
3231                     	xdef	_CLK_ClearITPendingBit
3232                     	xdef	_CLK_GetITStatus
3233                     	xdef	_CLK_GetFlagStatus
3234                     	xdef	_CLK_GetSYSCLKSource
3235                     	xdef	_CLK_GetClockFreq
3236                     	xdef	_CLK_AdjustHSICalibrationValue
3237                     	xdef	_CLK_SYSCLKEmergencyClear
3238                     	xdef	_CLK_ClockSecuritySystemEnable
3239                     	xdef	_CLK_SWIMConfig
3240                     	xdef	_CLK_SYSCLKConfig
3241                     	xdef	_CLK_ITConfig
3242                     	xdef	_CLK_CCOConfig
3243                     	xdef	_CLK_HSIPrescalerConfig
3244                     	xdef	_CLK_ClockSwitchConfig
3245                     	xdef	_CLK_PeripheralClockConfig
3246                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3247                     	xdef	_CLK_FastHaltWakeUpCmd
3248                     	xdef	_CLK_ClockSwitchCmd
3249                     	xdef	_CLK_CCOCmd
3250                     	xdef	_CLK_LSICmd
3251                     	xdef	_CLK_HSICmd
3252                     	xdef	_CLK_HSECmd
3253                     	xdef	_CLK_DeInit
3254                     	xref	_assert_failed
3255                     	switch	.const
3256  000c               L75:
3257  000c 2e2e5c737476  	dc.b	"..\stvd\cosmic\stm"
3258  001e 38735f737464  	dc.b	"8s_stdperiph_lib\l"
3259  0030 696272617269  	dc.b	"ibraries\stm8s_std"
3260  0042 706572697068  	dc.b	"periph_driver\src\"
3261  0054 73746d38735f  	dc.b	"stm8s_clk.c",0
3262                     	xref.b	c_lreg
3263                     	xref.b	c_x
3283                     	xref	c_ltor
3284                     	xref	c_ludv
3285                     	xref	c_rtol
3286                     	end
