   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 53 void UART1_DeInit(void)
  44                     ; 54 {
  46                     .text:	section	.text,new
  47  0000               _UART1_DeInit:
  51                     ; 57   (void)UART1->SR;
  53  0000 c65230        	ld	a,21040
  54                     ; 58   (void)UART1->DR;
  56  0003 c65231        	ld	a,21041
  57                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  59  0006 725f5233      	clr	21043
  60                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  62  000a 725f5232      	clr	21042
  63                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  65  000e 725f5234      	clr	21044
  66                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  68  0012 725f5235      	clr	21045
  69                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  71  0016 725f5236      	clr	21046
  72                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  74  001a 725f5237      	clr	21047
  75                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  77  001e 725f5238      	clr	21048
  78                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  80  0022 725f5239      	clr	21049
  81                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  83  0026 725f523a      	clr	21050
  84                     ; 71 }
  87  002a 81            	ret
 391                     .const:	section	.text
 392  0000               L21:
 393  0000 00098969      	dc.l	625001
 394  0004               L25:
 395  0004 00000064      	dc.l	100
 396                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 396                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 396                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 396                     ; 93 {
 397                     .text:	section	.text,new
 398  0000               _UART1_Init:
 400  0000 520c          	subw	sp,#12
 401       0000000c      OFST:	set	12
 404                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 408                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 410  0002 96            	ldw	x,sp
 411  0003 1c000f        	addw	x,#OFST+3
 412  0006 cd0000        	call	c_ltor
 414  0009 ae0000        	ldw	x,#L21
 415  000c cd0000        	call	c_lcmp
 417  000f 2403          	jruge	L01
 418  0011 4f            	clr	a
 419  0012 2010          	jra	L41
 420  0014               L01:
 421  0014 ae0061        	ldw	x,#97
 422  0017 89            	pushw	x
 423  0018 ae0000        	ldw	x,#0
 424  001b 89            	pushw	x
 425  001c ae0008        	ldw	x,#L371
 426  001f cd0000        	call	_assert_failed
 428  0022 5b04          	addw	sp,#4
 429  0024               L41:
 430                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 432  0024 0d13          	tnz	(OFST+7,sp)
 433  0026 2706          	jreq	L02
 434  0028 7b13          	ld	a,(OFST+7,sp)
 435  002a a110          	cp	a,#16
 436  002c 2603          	jrne	L61
 437  002e               L02:
 438  002e 4f            	clr	a
 439  002f 2010          	jra	L22
 440  0031               L61:
 441  0031 ae0062        	ldw	x,#98
 442  0034 89            	pushw	x
 443  0035 ae0000        	ldw	x,#0
 444  0038 89            	pushw	x
 445  0039 ae0008        	ldw	x,#L371
 446  003c cd0000        	call	_assert_failed
 448  003f 5b04          	addw	sp,#4
 449  0041               L22:
 450                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 452  0041 0d14          	tnz	(OFST+8,sp)
 453  0043 2712          	jreq	L62
 454  0045 7b14          	ld	a,(OFST+8,sp)
 455  0047 a110          	cp	a,#16
 456  0049 270c          	jreq	L62
 457  004b 7b14          	ld	a,(OFST+8,sp)
 458  004d a120          	cp	a,#32
 459  004f 2706          	jreq	L62
 460  0051 7b14          	ld	a,(OFST+8,sp)
 461  0053 a130          	cp	a,#48
 462  0055 2603          	jrne	L42
 463  0057               L62:
 464  0057 4f            	clr	a
 465  0058 2010          	jra	L03
 466  005a               L42:
 467  005a ae0063        	ldw	x,#99
 468  005d 89            	pushw	x
 469  005e ae0000        	ldw	x,#0
 470  0061 89            	pushw	x
 471  0062 ae0008        	ldw	x,#L371
 472  0065 cd0000        	call	_assert_failed
 474  0068 5b04          	addw	sp,#4
 475  006a               L03:
 476                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 478  006a 0d15          	tnz	(OFST+9,sp)
 479  006c 270c          	jreq	L43
 480  006e 7b15          	ld	a,(OFST+9,sp)
 481  0070 a104          	cp	a,#4
 482  0072 2706          	jreq	L43
 483  0074 7b15          	ld	a,(OFST+9,sp)
 484  0076 a106          	cp	a,#6
 485  0078 2603          	jrne	L23
 486  007a               L43:
 487  007a 4f            	clr	a
 488  007b 2010          	jra	L63
 489  007d               L23:
 490  007d ae0064        	ldw	x,#100
 491  0080 89            	pushw	x
 492  0081 ae0000        	ldw	x,#0
 493  0084 89            	pushw	x
 494  0085 ae0008        	ldw	x,#L371
 495  0088 cd0000        	call	_assert_failed
 497  008b 5b04          	addw	sp,#4
 498  008d               L63:
 499                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 501  008d 7b17          	ld	a,(OFST+11,sp)
 502  008f a108          	cp	a,#8
 503  0091 2730          	jreq	L24
 504  0093 7b17          	ld	a,(OFST+11,sp)
 505  0095 a140          	cp	a,#64
 506  0097 272a          	jreq	L24
 507  0099 7b17          	ld	a,(OFST+11,sp)
 508  009b a104          	cp	a,#4
 509  009d 2724          	jreq	L24
 510  009f 7b17          	ld	a,(OFST+11,sp)
 511  00a1 a180          	cp	a,#128
 512  00a3 271e          	jreq	L24
 513  00a5 7b17          	ld	a,(OFST+11,sp)
 514  00a7 a10c          	cp	a,#12
 515  00a9 2718          	jreq	L24
 516  00ab 7b17          	ld	a,(OFST+11,sp)
 517  00ad a10c          	cp	a,#12
 518  00af 2712          	jreq	L24
 519  00b1 7b17          	ld	a,(OFST+11,sp)
 520  00b3 a144          	cp	a,#68
 521  00b5 270c          	jreq	L24
 522  00b7 7b17          	ld	a,(OFST+11,sp)
 523  00b9 a1c0          	cp	a,#192
 524  00bb 2706          	jreq	L24
 525  00bd 7b17          	ld	a,(OFST+11,sp)
 526  00bf a188          	cp	a,#136
 527  00c1 2603          	jrne	L04
 528  00c3               L24:
 529  00c3 4f            	clr	a
 530  00c4 2010          	jra	L44
 531  00c6               L04:
 532  00c6 ae0065        	ldw	x,#101
 533  00c9 89            	pushw	x
 534  00ca ae0000        	ldw	x,#0
 535  00cd 89            	pushw	x
 536  00ce ae0008        	ldw	x,#L371
 537  00d1 cd0000        	call	_assert_failed
 539  00d4 5b04          	addw	sp,#4
 540  00d6               L44:
 541                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 543  00d6 7b16          	ld	a,(OFST+10,sp)
 544  00d8 a488          	and	a,#136
 545  00da a188          	cp	a,#136
 546  00dc 271b          	jreq	L64
 547  00de 7b16          	ld	a,(OFST+10,sp)
 548  00e0 a444          	and	a,#68
 549  00e2 a144          	cp	a,#68
 550  00e4 2713          	jreq	L64
 551  00e6 7b16          	ld	a,(OFST+10,sp)
 552  00e8 a422          	and	a,#34
 553  00ea a122          	cp	a,#34
 554  00ec 270b          	jreq	L64
 555  00ee 7b16          	ld	a,(OFST+10,sp)
 556  00f0 a411          	and	a,#17
 557  00f2 a111          	cp	a,#17
 558  00f4 2703          	jreq	L64
 559  00f6 4f            	clr	a
 560  00f7 2010          	jra	L05
 561  00f9               L64:
 562  00f9 ae0066        	ldw	x,#102
 563  00fc 89            	pushw	x
 564  00fd ae0000        	ldw	x,#0
 565  0100 89            	pushw	x
 566  0101 ae0008        	ldw	x,#L371
 567  0104 cd0000        	call	_assert_failed
 569  0107 5b04          	addw	sp,#4
 570  0109               L05:
 571                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 573  0109 72195234      	bres	21044,#4
 574                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 576  010d c65234        	ld	a,21044
 577  0110 1a13          	or	a,(OFST+7,sp)
 578  0112 c75234        	ld	21044,a
 579                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 581  0115 c65236        	ld	a,21046
 582  0118 a4cf          	and	a,#207
 583  011a c75236        	ld	21046,a
 584                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 586  011d c65236        	ld	a,21046
 587  0120 1a14          	or	a,(OFST+8,sp)
 588  0122 c75236        	ld	21046,a
 589                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 591  0125 c65234        	ld	a,21044
 592  0128 a4f9          	and	a,#249
 593  012a c75234        	ld	21044,a
 594                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 596  012d c65234        	ld	a,21044
 597  0130 1a15          	or	a,(OFST+9,sp)
 598  0132 c75234        	ld	21044,a
 599                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 601  0135 725f5232      	clr	21042
 602                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 604  0139 c65233        	ld	a,21043
 605  013c a40f          	and	a,#15
 606  013e c75233        	ld	21043,a
 607                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 609  0141 c65233        	ld	a,21043
 610  0144 a4f0          	and	a,#240
 611  0146 c75233        	ld	21043,a
 612                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 614  0149 96            	ldw	x,sp
 615  014a 1c000f        	addw	x,#OFST+3
 616  014d cd0000        	call	c_ltor
 618  0150 a604          	ld	a,#4
 619  0152 cd0000        	call	c_llsh
 621  0155 96            	ldw	x,sp
 622  0156 1c0001        	addw	x,#OFST-11
 623  0159 cd0000        	call	c_rtol
 625  015c cd0000        	call	_CLK_GetClockFreq
 627  015f 96            	ldw	x,sp
 628  0160 1c0001        	addw	x,#OFST-11
 629  0163 cd0000        	call	c_ludv
 631  0166 96            	ldw	x,sp
 632  0167 1c0009        	addw	x,#OFST-3
 633  016a cd0000        	call	c_rtol
 635                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 637  016d 96            	ldw	x,sp
 638  016e 1c000f        	addw	x,#OFST+3
 639  0171 cd0000        	call	c_ltor
 641  0174 a604          	ld	a,#4
 642  0176 cd0000        	call	c_llsh
 644  0179 96            	ldw	x,sp
 645  017a 1c0001        	addw	x,#OFST-11
 646  017d cd0000        	call	c_rtol
 648  0180 cd0000        	call	_CLK_GetClockFreq
 650  0183 a664          	ld	a,#100
 651  0185 cd0000        	call	c_smul
 653  0188 96            	ldw	x,sp
 654  0189 1c0001        	addw	x,#OFST-11
 655  018c cd0000        	call	c_ludv
 657  018f 96            	ldw	x,sp
 658  0190 1c0005        	addw	x,#OFST-7
 659  0193 cd0000        	call	c_rtol
 661                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 663  0196 96            	ldw	x,sp
 664  0197 1c0009        	addw	x,#OFST-3
 665  019a cd0000        	call	c_ltor
 667  019d a664          	ld	a,#100
 668  019f cd0000        	call	c_smul
 670  01a2 96            	ldw	x,sp
 671  01a3 1c0001        	addw	x,#OFST-11
 672  01a6 cd0000        	call	c_rtol
 674  01a9 96            	ldw	x,sp
 675  01aa 1c0005        	addw	x,#OFST-7
 676  01ad cd0000        	call	c_ltor
 678  01b0 96            	ldw	x,sp
 679  01b1 1c0001        	addw	x,#OFST-11
 680  01b4 cd0000        	call	c_lsub
 682  01b7 a604          	ld	a,#4
 683  01b9 cd0000        	call	c_llsh
 685  01bc ae0004        	ldw	x,#L25
 686  01bf cd0000        	call	c_ludv
 688  01c2 b603          	ld	a,c_lreg+3
 689  01c4 a40f          	and	a,#15
 690  01c6 ca5233        	or	a,21043
 691  01c9 c75233        	ld	21043,a
 692                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 694  01cc 96            	ldw	x,sp
 695  01cd 1c0009        	addw	x,#OFST-3
 696  01d0 cd0000        	call	c_ltor
 698  01d3 a604          	ld	a,#4
 699  01d5 cd0000        	call	c_lursh
 701  01d8 b603          	ld	a,c_lreg+3
 702  01da a4f0          	and	a,#240
 703  01dc b703          	ld	c_lreg+3,a
 704  01de 3f02          	clr	c_lreg+2
 705  01e0 3f01          	clr	c_lreg+1
 706  01e2 3f00          	clr	c_lreg
 707  01e4 b603          	ld	a,c_lreg+3
 708  01e6 ca5233        	or	a,21043
 709  01e9 c75233        	ld	21043,a
 710                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 712  01ec c65232        	ld	a,21042
 713  01ef 1a0c          	or	a,(OFST+0,sp)
 714  01f1 c75232        	ld	21042,a
 715                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 717  01f4 c65235        	ld	a,21045
 718  01f7 a4f3          	and	a,#243
 719  01f9 c75235        	ld	21045,a
 720                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 722  01fc c65236        	ld	a,21046
 723  01ff a4f8          	and	a,#248
 724  0201 c75236        	ld	21046,a
 725                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 725                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 727  0204 7b16          	ld	a,(OFST+10,sp)
 728  0206 a407          	and	a,#7
 729  0208 ca5236        	or	a,21046
 730  020b c75236        	ld	21046,a
 731                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 733  020e 7b17          	ld	a,(OFST+11,sp)
 734  0210 a504          	bcp	a,#4
 735  0212 2706          	jreq	L571
 736                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 738  0214 72165235      	bset	21045,#3
 740  0218 2004          	jra	L771
 741  021a               L571:
 742                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 744  021a 72175235      	bres	21045,#3
 745  021e               L771:
 746                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 748  021e 7b17          	ld	a,(OFST+11,sp)
 749  0220 a508          	bcp	a,#8
 750  0222 2706          	jreq	L102
 751                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 753  0224 72145235      	bset	21045,#2
 755  0228 2004          	jra	L302
 756  022a               L102:
 757                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 759  022a 72155235      	bres	21045,#2
 760  022e               L302:
 761                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 763  022e 7b16          	ld	a,(OFST+10,sp)
 764  0230 a580          	bcp	a,#128
 765  0232 2706          	jreq	L502
 766                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 768  0234 72175236      	bres	21046,#3
 770  0238 200a          	jra	L702
 771  023a               L502:
 772                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 774  023a 7b16          	ld	a,(OFST+10,sp)
 775  023c a408          	and	a,#8
 776  023e ca5236        	or	a,21046
 777  0241 c75236        	ld	21046,a
 778  0244               L702:
 779                     ; 176 }
 782  0244 5b0c          	addw	sp,#12
 783  0246 81            	ret
 838                     ; 184 void UART1_Cmd(FunctionalState NewState)
 838                     ; 185 {
 839                     .text:	section	.text,new
 840  0000               _UART1_Cmd:
 844                     ; 186   if (NewState != DISABLE)
 846  0000 4d            	tnz	a
 847  0001 2706          	jreq	L732
 848                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 850  0003 721b5234      	bres	21044,#5
 852  0007 2004          	jra	L142
 853  0009               L732:
 854                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 856  0009 721a5234      	bset	21044,#5
 857  000d               L142:
 858                     ; 196 }
 861  000d 81            	ret
 987                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 987                     ; 212 {
 988                     .text:	section	.text,new
 989  0000               _UART1_ITConfig:
 991  0000 89            	pushw	x
 992  0001 89            	pushw	x
 993       00000002      OFST:	set	2
 996                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
1000                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
1002  0002 a30100        	cpw	x,#256
1003  0005 2719          	jreq	L26
1004  0007 a30277        	cpw	x,#631
1005  000a 2714          	jreq	L26
1006  000c a30266        	cpw	x,#614
1007  000f 270f          	jreq	L26
1008  0011 a30205        	cpw	x,#517
1009  0014 270a          	jreq	L26
1010  0016 a30244        	cpw	x,#580
1011  0019 2705          	jreq	L26
1012  001b a30346        	cpw	x,#838
1013  001e 2603          	jrne	L06
1014  0020               L26:
1015  0020 4f            	clr	a
1016  0021 2010          	jra	L46
1017  0023               L06:
1018  0023 ae00d8        	ldw	x,#216
1019  0026 89            	pushw	x
1020  0027 ae0000        	ldw	x,#0
1021  002a 89            	pushw	x
1022  002b ae0008        	ldw	x,#L371
1023  002e cd0000        	call	_assert_failed
1025  0031 5b04          	addw	sp,#4
1026  0033               L46:
1027                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1029  0033 0d07          	tnz	(OFST+5,sp)
1030  0035 2706          	jreq	L07
1031  0037 7b07          	ld	a,(OFST+5,sp)
1032  0039 a101          	cp	a,#1
1033  003b 2603          	jrne	L66
1034  003d               L07:
1035  003d 4f            	clr	a
1036  003e 2010          	jra	L27
1037  0040               L66:
1038  0040 ae00d9        	ldw	x,#217
1039  0043 89            	pushw	x
1040  0044 ae0000        	ldw	x,#0
1041  0047 89            	pushw	x
1042  0048 ae0008        	ldw	x,#L371
1043  004b cd0000        	call	_assert_failed
1045  004e 5b04          	addw	sp,#4
1046  0050               L27:
1047                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1049  0050 7b03          	ld	a,(OFST+1,sp)
1050  0052 6b01          	ld	(OFST-1,sp),a
1051                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1053  0054 7b04          	ld	a,(OFST+2,sp)
1054  0056 a40f          	and	a,#15
1055  0058 5f            	clrw	x
1056  0059 97            	ld	xl,a
1057  005a a601          	ld	a,#1
1058  005c 5d            	tnzw	x
1059  005d 2704          	jreq	L47
1060  005f               L67:
1061  005f 48            	sll	a
1062  0060 5a            	decw	x
1063  0061 26fc          	jrne	L67
1064  0063               L47:
1065  0063 6b02          	ld	(OFST+0,sp),a
1066                     ; 224   if (NewState != DISABLE)
1068  0065 0d07          	tnz	(OFST+5,sp)
1069  0067 272a          	jreq	L123
1070                     ; 227     if (uartreg == 0x01)
1072  0069 7b01          	ld	a,(OFST-1,sp)
1073  006b a101          	cp	a,#1
1074  006d 260a          	jrne	L323
1075                     ; 229       UART1->CR1 |= itpos;
1077  006f c65234        	ld	a,21044
1078  0072 1a02          	or	a,(OFST+0,sp)
1079  0074 c75234        	ld	21044,a
1081  0077 2045          	jra	L333
1082  0079               L323:
1083                     ; 231     else if (uartreg == 0x02)
1085  0079 7b01          	ld	a,(OFST-1,sp)
1086  007b a102          	cp	a,#2
1087  007d 260a          	jrne	L723
1088                     ; 233       UART1->CR2 |= itpos;
1090  007f c65235        	ld	a,21045
1091  0082 1a02          	or	a,(OFST+0,sp)
1092  0084 c75235        	ld	21045,a
1094  0087 2035          	jra	L333
1095  0089               L723:
1096                     ; 237       UART1->CR4 |= itpos;
1098  0089 c65237        	ld	a,21047
1099  008c 1a02          	or	a,(OFST+0,sp)
1100  008e c75237        	ld	21047,a
1101  0091 202b          	jra	L333
1102  0093               L123:
1103                     ; 243     if (uartreg == 0x01)
1105  0093 7b01          	ld	a,(OFST-1,sp)
1106  0095 a101          	cp	a,#1
1107  0097 260b          	jrne	L533
1108                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1110  0099 7b02          	ld	a,(OFST+0,sp)
1111  009b 43            	cpl	a
1112  009c c45234        	and	a,21044
1113  009f c75234        	ld	21044,a
1115  00a2 201a          	jra	L333
1116  00a4               L533:
1117                     ; 247     else if (uartreg == 0x02)
1119  00a4 7b01          	ld	a,(OFST-1,sp)
1120  00a6 a102          	cp	a,#2
1121  00a8 260b          	jrne	L143
1122                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1124  00aa 7b02          	ld	a,(OFST+0,sp)
1125  00ac 43            	cpl	a
1126  00ad c45235        	and	a,21045
1127  00b0 c75235        	ld	21045,a
1129  00b3 2009          	jra	L333
1130  00b5               L143:
1131                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1133  00b5 7b02          	ld	a,(OFST+0,sp)
1134  00b7 43            	cpl	a
1135  00b8 c45237        	and	a,21047
1136  00bb c75237        	ld	21047,a
1137  00be               L333:
1138                     ; 257 }
1141  00be 5b04          	addw	sp,#4
1142  00c0 81            	ret
1179                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1179                     ; 266 {
1180                     .text:	section	.text,new
1181  0000               _UART1_HalfDuplexCmd:
1183  0000 88            	push	a
1184       00000000      OFST:	set	0
1187                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1189  0001 4d            	tnz	a
1190  0002 2704          	jreq	L401
1191  0004 a101          	cp	a,#1
1192  0006 2603          	jrne	L201
1193  0008               L401:
1194  0008 4f            	clr	a
1195  0009 2010          	jra	L601
1196  000b               L201:
1197  000b ae010b        	ldw	x,#267
1198  000e 89            	pushw	x
1199  000f ae0000        	ldw	x,#0
1200  0012 89            	pushw	x
1201  0013 ae0008        	ldw	x,#L371
1202  0016 cd0000        	call	_assert_failed
1204  0019 5b04          	addw	sp,#4
1205  001b               L601:
1206                     ; 269   if (NewState != DISABLE)
1208  001b 0d01          	tnz	(OFST+1,sp)
1209  001d 2706          	jreq	L363
1210                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1212  001f 72165238      	bset	21048,#3
1214  0023 2004          	jra	L563
1215  0025               L363:
1216                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1218  0025 72175238      	bres	21048,#3
1219  0029               L563:
1220                     ; 277 }
1223  0029 84            	pop	a
1224  002a 81            	ret
1282                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1282                     ; 286 {
1283                     .text:	section	.text,new
1284  0000               _UART1_IrDAConfig:
1286  0000 88            	push	a
1287       00000000      OFST:	set	0
1290                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1292  0001 a101          	cp	a,#1
1293  0003 2703          	jreq	L411
1294  0005 4d            	tnz	a
1295  0006 2603          	jrne	L211
1296  0008               L411:
1297  0008 4f            	clr	a
1298  0009 2010          	jra	L611
1299  000b               L211:
1300  000b ae011f        	ldw	x,#287
1301  000e 89            	pushw	x
1302  000f ae0000        	ldw	x,#0
1303  0012 89            	pushw	x
1304  0013 ae0008        	ldw	x,#L371
1305  0016 cd0000        	call	_assert_failed
1307  0019 5b04          	addw	sp,#4
1308  001b               L611:
1309                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1311  001b 0d01          	tnz	(OFST+1,sp)
1312  001d 2706          	jreq	L514
1313                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1315  001f 72145238      	bset	21048,#2
1317  0023 2004          	jra	L714
1318  0025               L514:
1319                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1321  0025 72155238      	bres	21048,#2
1322  0029               L714:
1323                     ; 297 }
1326  0029 84            	pop	a
1327  002a 81            	ret
1363                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1363                     ; 306 {
1364                     .text:	section	.text,new
1365  0000               _UART1_IrDACmd:
1367  0000 88            	push	a
1368       00000000      OFST:	set	0
1371                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1373  0001 4d            	tnz	a
1374  0002 2704          	jreq	L421
1375  0004 a101          	cp	a,#1
1376  0006 2603          	jrne	L221
1377  0008               L421:
1378  0008 4f            	clr	a
1379  0009 2010          	jra	L621
1380  000b               L221:
1381  000b ae0134        	ldw	x,#308
1382  000e 89            	pushw	x
1383  000f ae0000        	ldw	x,#0
1384  0012 89            	pushw	x
1385  0013 ae0008        	ldw	x,#L371
1386  0016 cd0000        	call	_assert_failed
1388  0019 5b04          	addw	sp,#4
1389  001b               L621:
1390                     ; 310   if (NewState != DISABLE)
1392  001b 0d01          	tnz	(OFST+1,sp)
1393  001d 2706          	jreq	L734
1394                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1396  001f 72125238      	bset	21048,#1
1398  0023 2004          	jra	L144
1399  0025               L734:
1400                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1402  0025 72135238      	bres	21048,#1
1403  0029               L144:
1404                     ; 320 }
1407  0029 84            	pop	a
1408  002a 81            	ret
1468                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1468                     ; 330 {
1469                     .text:	section	.text,new
1470  0000               _UART1_LINBreakDetectionConfig:
1472  0000 88            	push	a
1473       00000000      OFST:	set	0
1476                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1478  0001 4d            	tnz	a
1479  0002 2704          	jreq	L431
1480  0004 a101          	cp	a,#1
1481  0006 2603          	jrne	L231
1482  0008               L431:
1483  0008 4f            	clr	a
1484  0009 2010          	jra	L631
1485  000b               L231:
1486  000b ae014b        	ldw	x,#331
1487  000e 89            	pushw	x
1488  000f ae0000        	ldw	x,#0
1489  0012 89            	pushw	x
1490  0013 ae0008        	ldw	x,#L371
1491  0016 cd0000        	call	_assert_failed
1493  0019 5b04          	addw	sp,#4
1494  001b               L631:
1495                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1497  001b 0d01          	tnz	(OFST+1,sp)
1498  001d 2706          	jreq	L174
1499                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1501  001f 721a5237      	bset	21047,#5
1503  0023 2004          	jra	L374
1504  0025               L174:
1505                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1507  0025 721b5237      	bres	21047,#5
1508  0029               L374:
1509                     ; 341 }
1512  0029 84            	pop	a
1513  002a 81            	ret
1549                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1549                     ; 350 {
1550                     .text:	section	.text,new
1551  0000               _UART1_LINCmd:
1553  0000 88            	push	a
1554       00000000      OFST:	set	0
1557                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1559  0001 4d            	tnz	a
1560  0002 2704          	jreq	L441
1561  0004 a101          	cp	a,#1
1562  0006 2603          	jrne	L241
1563  0008               L441:
1564  0008 4f            	clr	a
1565  0009 2010          	jra	L641
1566  000b               L241:
1567  000b ae015f        	ldw	x,#351
1568  000e 89            	pushw	x
1569  000f ae0000        	ldw	x,#0
1570  0012 89            	pushw	x
1571  0013 ae0008        	ldw	x,#L371
1572  0016 cd0000        	call	_assert_failed
1574  0019 5b04          	addw	sp,#4
1575  001b               L641:
1576                     ; 353   if (NewState != DISABLE)
1578  001b 0d01          	tnz	(OFST+1,sp)
1579  001d 2706          	jreq	L315
1580                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1582  001f 721c5236      	bset	21046,#6
1584  0023 2004          	jra	L515
1585  0025               L315:
1586                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1588  0025 721d5236      	bres	21046,#6
1589  0029               L515:
1590                     ; 363 }
1593  0029 84            	pop	a
1594  002a 81            	ret
1630                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1630                     ; 372 {
1631                     .text:	section	.text,new
1632  0000               _UART1_SmartCardCmd:
1634  0000 88            	push	a
1635       00000000      OFST:	set	0
1638                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1640  0001 4d            	tnz	a
1641  0002 2704          	jreq	L451
1642  0004 a101          	cp	a,#1
1643  0006 2603          	jrne	L251
1644  0008               L451:
1645  0008 4f            	clr	a
1646  0009 2010          	jra	L651
1647  000b               L251:
1648  000b ae0175        	ldw	x,#373
1649  000e 89            	pushw	x
1650  000f ae0000        	ldw	x,#0
1651  0012 89            	pushw	x
1652  0013 ae0008        	ldw	x,#L371
1653  0016 cd0000        	call	_assert_failed
1655  0019 5b04          	addw	sp,#4
1656  001b               L651:
1657                     ; 375   if (NewState != DISABLE)
1659  001b 0d01          	tnz	(OFST+1,sp)
1660  001d 2706          	jreq	L535
1661                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1663  001f 721a5238      	bset	21048,#5
1665  0023 2004          	jra	L735
1666  0025               L535:
1667                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1669  0025 721b5238      	bres	21048,#5
1670  0029               L735:
1671                     ; 385 }
1674  0029 84            	pop	a
1675  002a 81            	ret
1712                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1712                     ; 395 {
1713                     .text:	section	.text,new
1714  0000               _UART1_SmartCardNACKCmd:
1716  0000 88            	push	a
1717       00000000      OFST:	set	0
1720                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1722  0001 4d            	tnz	a
1723  0002 2704          	jreq	L461
1724  0004 a101          	cp	a,#1
1725  0006 2603          	jrne	L261
1726  0008               L461:
1727  0008 4f            	clr	a
1728  0009 2010          	jra	L661
1729  000b               L261:
1730  000b ae018c        	ldw	x,#396
1731  000e 89            	pushw	x
1732  000f ae0000        	ldw	x,#0
1733  0012 89            	pushw	x
1734  0013 ae0008        	ldw	x,#L371
1735  0016 cd0000        	call	_assert_failed
1737  0019 5b04          	addw	sp,#4
1738  001b               L661:
1739                     ; 398   if (NewState != DISABLE)
1741  001b 0d01          	tnz	(OFST+1,sp)
1742  001d 2706          	jreq	L755
1743                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1745  001f 72185238      	bset	21048,#4
1747  0023 2004          	jra	L165
1748  0025               L755:
1749                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1751  0025 72195238      	bres	21048,#4
1752  0029               L165:
1753                     ; 408 }
1756  0029 84            	pop	a
1757  002a 81            	ret
1815                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1815                     ; 417 {
1816                     .text:	section	.text,new
1817  0000               _UART1_WakeUpConfig:
1819  0000 88            	push	a
1820       00000000      OFST:	set	0
1823                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1825  0001 4d            	tnz	a
1826  0002 2704          	jreq	L471
1827  0004 a108          	cp	a,#8
1828  0006 2603          	jrne	L271
1829  0008               L471:
1830  0008 4f            	clr	a
1831  0009 2010          	jra	L671
1832  000b               L271:
1833  000b ae01a2        	ldw	x,#418
1834  000e 89            	pushw	x
1835  000f ae0000        	ldw	x,#0
1836  0012 89            	pushw	x
1837  0013 ae0008        	ldw	x,#L371
1838  0016 cd0000        	call	_assert_failed
1840  0019 5b04          	addw	sp,#4
1841  001b               L671:
1842                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1844  001b 72175234      	bres	21044,#3
1845                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1847  001f c65234        	ld	a,21044
1848  0022 1a01          	or	a,(OFST+1,sp)
1849  0024 c75234        	ld	21044,a
1850                     ; 422 }
1853  0027 84            	pop	a
1854  0028 81            	ret
1891                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1891                     ; 431 {
1892                     .text:	section	.text,new
1893  0000               _UART1_ReceiverWakeUpCmd:
1895  0000 88            	push	a
1896       00000000      OFST:	set	0
1899                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1901  0001 4d            	tnz	a
1902  0002 2704          	jreq	L402
1903  0004 a101          	cp	a,#1
1904  0006 2603          	jrne	L202
1905  0008               L402:
1906  0008 4f            	clr	a
1907  0009 2010          	jra	L602
1908  000b               L202:
1909  000b ae01b0        	ldw	x,#432
1910  000e 89            	pushw	x
1911  000f ae0000        	ldw	x,#0
1912  0012 89            	pushw	x
1913  0013 ae0008        	ldw	x,#L371
1914  0016 cd0000        	call	_assert_failed
1916  0019 5b04          	addw	sp,#4
1917  001b               L602:
1918                     ; 434   if (NewState != DISABLE)
1920  001b 0d01          	tnz	(OFST+1,sp)
1921  001d 2706          	jreq	L726
1922                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1924  001f 72125235      	bset	21045,#1
1926  0023 2004          	jra	L136
1927  0025               L726:
1928                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1930  0025 72135235      	bres	21045,#1
1931  0029               L136:
1932                     ; 444 }
1935  0029 84            	pop	a
1936  002a 81            	ret
1959                     ; 451 uint8_t UART1_ReceiveData8(void)
1959                     ; 452 {
1960                     .text:	section	.text,new
1961  0000               _UART1_ReceiveData8:
1965                     ; 453   return ((uint8_t)UART1->DR);
1967  0000 c65231        	ld	a,21041
1970  0003 81            	ret
2004                     ; 461 uint16_t UART1_ReceiveData9(void)
2004                     ; 462 {
2005                     .text:	section	.text,new
2006  0000               _UART1_ReceiveData9:
2008  0000 89            	pushw	x
2009       00000002      OFST:	set	2
2012                     ; 463   uint16_t temp = 0;
2014                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2016  0001 c65234        	ld	a,21044
2017  0004 5f            	clrw	x
2018  0005 a480          	and	a,#128
2019  0007 5f            	clrw	x
2020  0008 02            	rlwa	x,a
2021  0009 58            	sllw	x
2022  000a 1f01          	ldw	(OFST-1,sp),x
2023                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2025  000c c65231        	ld	a,21041
2026  000f 5f            	clrw	x
2027  0010 97            	ld	xl,a
2028  0011 01            	rrwa	x,a
2029  0012 1a02          	or	a,(OFST+0,sp)
2030  0014 01            	rrwa	x,a
2031  0015 1a01          	or	a,(OFST-1,sp)
2032  0017 01            	rrwa	x,a
2033  0018 01            	rrwa	x,a
2034  0019 a4ff          	and	a,#255
2035  001b 01            	rrwa	x,a
2036  001c a401          	and	a,#1
2037  001e 01            	rrwa	x,a
2040  001f 5b02          	addw	sp,#2
2041  0021 81            	ret
2075                     ; 474 void UART1_SendData8(uint8_t Data)
2075                     ; 475 {
2076                     .text:	section	.text,new
2077  0000               _UART1_SendData8:
2081                     ; 477   UART1->DR = Data;
2083  0000 c75231        	ld	21041,a
2084                     ; 478 }
2087  0003 81            	ret
2121                     ; 486 void UART1_SendData9(uint16_t Data)
2121                     ; 487 {
2122                     .text:	section	.text,new
2123  0000               _UART1_SendData9:
2125  0000 89            	pushw	x
2126       00000000      OFST:	set	0
2129                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2131  0001 721d5234      	bres	21044,#6
2132                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2134  0005 54            	srlw	x
2135  0006 54            	srlw	x
2136  0007 9f            	ld	a,xl
2137  0008 a440          	and	a,#64
2138  000a ca5234        	or	a,21044
2139  000d c75234        	ld	21044,a
2140                     ; 493   UART1->DR   = (uint8_t)(Data);
2142  0010 7b02          	ld	a,(OFST+2,sp)
2143  0012 c75231        	ld	21041,a
2144                     ; 494 }
2147  0015 85            	popw	x
2148  0016 81            	ret
2171                     ; 501 void UART1_SendBreak(void)
2171                     ; 502 {
2172                     .text:	section	.text,new
2173  0000               _UART1_SendBreak:
2177                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2179  0000 72105235      	bset	21045,#0
2180                     ; 504 }
2183  0004 81            	ret
2218                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2218                     ; 512 {
2219                     .text:	section	.text,new
2220  0000               _UART1_SetAddress:
2222  0000 88            	push	a
2223       00000000      OFST:	set	0
2226                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2228  0001 a110          	cp	a,#16
2229  0003 2403          	jruge	L422
2230  0005 4f            	clr	a
2231  0006 2010          	jra	L622
2232  0008               L422:
2233  0008 ae0202        	ldw	x,#514
2234  000b 89            	pushw	x
2235  000c ae0000        	ldw	x,#0
2236  000f 89            	pushw	x
2237  0010 ae0008        	ldw	x,#L371
2238  0013 cd0000        	call	_assert_failed
2240  0016 5b04          	addw	sp,#4
2241  0018               L622:
2242                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2244  0018 c65237        	ld	a,21047
2245  001b a4f0          	and	a,#240
2246  001d c75237        	ld	21047,a
2247                     ; 519   UART1->CR4 |= UART1_Address;
2249  0020 c65237        	ld	a,21047
2250  0023 1a01          	or	a,(OFST+1,sp)
2251  0025 c75237        	ld	21047,a
2252                     ; 520 }
2255  0028 84            	pop	a
2256  0029 81            	ret
2290                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2290                     ; 529 {
2291                     .text:	section	.text,new
2292  0000               _UART1_SetGuardTime:
2296                     ; 531   UART1->GTR = UART1_GuardTime;
2298  0000 c75239        	ld	21049,a
2299                     ; 532 }
2302  0003 81            	ret
2336                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2336                     ; 557 {
2337                     .text:	section	.text,new
2338  0000               _UART1_SetPrescaler:
2342                     ; 559   UART1->PSCR = UART1_Prescaler;
2344  0000 c7523a        	ld	21050,a
2345                     ; 560 }
2348  0003 81            	ret
2492                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2492                     ; 569 {
2493                     .text:	section	.text,new
2494  0000               _UART1_GetFlagStatus:
2496  0000 89            	pushw	x
2497  0001 88            	push	a
2498       00000001      OFST:	set	1
2501                     ; 570   FlagStatus status = RESET;
2503                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2505  0002 a30080        	cpw	x,#128
2506  0005 272d          	jreq	L042
2507  0007 a30040        	cpw	x,#64
2508  000a 2728          	jreq	L042
2509  000c a30020        	cpw	x,#32
2510  000f 2723          	jreq	L042
2511  0011 a30010        	cpw	x,#16
2512  0014 271e          	jreq	L042
2513  0016 a30008        	cpw	x,#8
2514  0019 2719          	jreq	L042
2515  001b a30004        	cpw	x,#4
2516  001e 2714          	jreq	L042
2517  0020 a30002        	cpw	x,#2
2518  0023 270f          	jreq	L042
2519  0025 a30001        	cpw	x,#1
2520  0028 270a          	jreq	L042
2521  002a a30101        	cpw	x,#257
2522  002d 2705          	jreq	L042
2523  002f a30210        	cpw	x,#528
2524  0032 2603          	jrne	L632
2525  0034               L042:
2526  0034 4f            	clr	a
2527  0035 2010          	jra	L242
2528  0037               L632:
2529  0037 ae023d        	ldw	x,#573
2530  003a 89            	pushw	x
2531  003b ae0000        	ldw	x,#0
2532  003e 89            	pushw	x
2533  003f ae0008        	ldw	x,#L371
2534  0042 cd0000        	call	_assert_failed
2536  0045 5b04          	addw	sp,#4
2537  0047               L242:
2538                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2540  0047 1e02          	ldw	x,(OFST+1,sp)
2541  0049 a30210        	cpw	x,#528
2542  004c 2611          	jrne	L1601
2543                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2545  004e c65237        	ld	a,21047
2546  0051 1503          	bcp	a,(OFST+2,sp)
2547  0053 2706          	jreq	L3601
2548                     ; 582       status = SET;
2550  0055 a601          	ld	a,#1
2551  0057 6b01          	ld	(OFST+0,sp),a
2553  0059 202b          	jra	L7601
2554  005b               L3601:
2555                     ; 587       status = RESET;
2557  005b 0f01          	clr	(OFST+0,sp)
2558  005d 2027          	jra	L7601
2559  005f               L1601:
2560                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2562  005f 1e02          	ldw	x,(OFST+1,sp)
2563  0061 a30101        	cpw	x,#257
2564  0064 2611          	jrne	L1701
2565                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2567  0066 c65235        	ld	a,21045
2568  0069 1503          	bcp	a,(OFST+2,sp)
2569  006b 2706          	jreq	L3701
2570                     ; 595       status = SET;
2572  006d a601          	ld	a,#1
2573  006f 6b01          	ld	(OFST+0,sp),a
2575  0071 2013          	jra	L7601
2576  0073               L3701:
2577                     ; 600       status = RESET;
2579  0073 0f01          	clr	(OFST+0,sp)
2580  0075 200f          	jra	L7601
2581  0077               L1701:
2582                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2584  0077 c65230        	ld	a,21040
2585  007a 1503          	bcp	a,(OFST+2,sp)
2586  007c 2706          	jreq	L1011
2587                     ; 608       status = SET;
2589  007e a601          	ld	a,#1
2590  0080 6b01          	ld	(OFST+0,sp),a
2592  0082 2002          	jra	L7601
2593  0084               L1011:
2594                     ; 613       status = RESET;
2596  0084 0f01          	clr	(OFST+0,sp)
2597  0086               L7601:
2598                     ; 617   return status;
2600  0086 7b01          	ld	a,(OFST+0,sp)
2603  0088 5b03          	addw	sp,#3
2604  008a 81            	ret
2640                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2640                     ; 647 {
2641                     .text:	section	.text,new
2642  0000               _UART1_ClearFlag:
2644  0000 89            	pushw	x
2645       00000000      OFST:	set	0
2648                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2650  0001 a30020        	cpw	x,#32
2651  0004 2705          	jreq	L052
2652  0006 a30210        	cpw	x,#528
2653  0009 2603          	jrne	L642
2654  000b               L052:
2655  000b 4f            	clr	a
2656  000c 2010          	jra	L252
2657  000e               L642:
2658  000e ae0288        	ldw	x,#648
2659  0011 89            	pushw	x
2660  0012 ae0000        	ldw	x,#0
2661  0015 89            	pushw	x
2662  0016 ae0008        	ldw	x,#L371
2663  0019 cd0000        	call	_assert_failed
2665  001c 5b04          	addw	sp,#4
2666  001e               L252:
2667                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2669  001e 1e01          	ldw	x,(OFST+1,sp)
2670  0020 a30020        	cpw	x,#32
2671  0023 2606          	jrne	L3211
2672                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2674  0025 35df5230      	mov	21040,#223
2676  0029 2004          	jra	L5211
2677  002b               L3211:
2678                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2680  002b 72195237      	bres	21047,#4
2681  002f               L5211:
2682                     ; 660 }
2685  002f 85            	popw	x
2686  0030 81            	ret
2769                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2769                     ; 676 {
2770                     .text:	section	.text,new
2771  0000               _UART1_GetITStatus:
2773  0000 89            	pushw	x
2774  0001 89            	pushw	x
2775       00000002      OFST:	set	2
2778                     ; 677   ITStatus pendingbitstatus = RESET;
2780                     ; 678   uint8_t itpos = 0;
2782                     ; 679   uint8_t itmask1 = 0;
2784                     ; 680   uint8_t itmask2 = 0;
2786                     ; 681   uint8_t enablestatus = 0;
2788                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2790  0002 a30277        	cpw	x,#631
2791  0005 271e          	jreq	L062
2792  0007 a30266        	cpw	x,#614
2793  000a 2719          	jreq	L062
2794  000c a30255        	cpw	x,#597
2795  000f 2714          	jreq	L062
2796  0011 a30244        	cpw	x,#580
2797  0014 270f          	jreq	L062
2798  0016 a30235        	cpw	x,#565
2799  0019 270a          	jreq	L062
2800  001b a30346        	cpw	x,#838
2801  001e 2705          	jreq	L062
2802  0020 a30100        	cpw	x,#256
2803  0023 2603          	jrne	L652
2804  0025               L062:
2805  0025 4f            	clr	a
2806  0026 2010          	jra	L262
2807  0028               L652:
2808  0028 ae02ac        	ldw	x,#684
2809  002b 89            	pushw	x
2810  002c ae0000        	ldw	x,#0
2811  002f 89            	pushw	x
2812  0030 ae0008        	ldw	x,#L371
2813  0033 cd0000        	call	_assert_failed
2815  0036 5b04          	addw	sp,#4
2816  0038               L262:
2817                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2819  0038 7b04          	ld	a,(OFST+2,sp)
2820  003a a40f          	and	a,#15
2821  003c 5f            	clrw	x
2822  003d 97            	ld	xl,a
2823  003e a601          	ld	a,#1
2824  0040 5d            	tnzw	x
2825  0041 2704          	jreq	L462
2826  0043               L662:
2827  0043 48            	sll	a
2828  0044 5a            	decw	x
2829  0045 26fc          	jrne	L662
2830  0047               L462:
2831  0047 6b01          	ld	(OFST-1,sp),a
2832                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2834  0049 7b04          	ld	a,(OFST+2,sp)
2835  004b 4e            	swap	a
2836  004c a40f          	and	a,#15
2837  004e 6b02          	ld	(OFST+0,sp),a
2838                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2840  0050 7b02          	ld	a,(OFST+0,sp)
2841  0052 5f            	clrw	x
2842  0053 97            	ld	xl,a
2843  0054 a601          	ld	a,#1
2844  0056 5d            	tnzw	x
2845  0057 2704          	jreq	L072
2846  0059               L272:
2847  0059 48            	sll	a
2848  005a 5a            	decw	x
2849  005b 26fc          	jrne	L272
2850  005d               L072:
2851  005d 6b02          	ld	(OFST+0,sp),a
2852                     ; 695   if (UART1_IT == UART1_IT_PE)
2854  005f 1e03          	ldw	x,(OFST+1,sp)
2855  0061 a30100        	cpw	x,#256
2856  0064 261c          	jrne	L1711
2857                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2859  0066 c65234        	ld	a,21044
2860  0069 1402          	and	a,(OFST+0,sp)
2861  006b 6b02          	ld	(OFST+0,sp),a
2862                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2864  006d c65230        	ld	a,21040
2865  0070 1501          	bcp	a,(OFST-1,sp)
2866  0072 270a          	jreq	L3711
2868  0074 0d02          	tnz	(OFST+0,sp)
2869  0076 2706          	jreq	L3711
2870                     ; 704       pendingbitstatus = SET;
2872  0078 a601          	ld	a,#1
2873  007a 6b02          	ld	(OFST+0,sp),a
2875  007c 2041          	jra	L7711
2876  007e               L3711:
2877                     ; 709       pendingbitstatus = RESET;
2879  007e 0f02          	clr	(OFST+0,sp)
2880  0080 203d          	jra	L7711
2881  0082               L1711:
2882                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2884  0082 1e03          	ldw	x,(OFST+1,sp)
2885  0084 a30346        	cpw	x,#838
2886  0087 261c          	jrne	L1021
2887                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2889  0089 c65237        	ld	a,21047
2890  008c 1402          	and	a,(OFST+0,sp)
2891  008e 6b02          	ld	(OFST+0,sp),a
2892                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2894  0090 c65237        	ld	a,21047
2895  0093 1501          	bcp	a,(OFST-1,sp)
2896  0095 270a          	jreq	L3021
2898  0097 0d02          	tnz	(OFST+0,sp)
2899  0099 2706          	jreq	L3021
2900                     ; 721       pendingbitstatus = SET;
2902  009b a601          	ld	a,#1
2903  009d 6b02          	ld	(OFST+0,sp),a
2905  009f 201e          	jra	L7711
2906  00a1               L3021:
2907                     ; 726       pendingbitstatus = RESET;
2909  00a1 0f02          	clr	(OFST+0,sp)
2910  00a3 201a          	jra	L7711
2911  00a5               L1021:
2912                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2914  00a5 c65235        	ld	a,21045
2915  00a8 1402          	and	a,(OFST+0,sp)
2916  00aa 6b02          	ld	(OFST+0,sp),a
2917                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2919  00ac c65230        	ld	a,21040
2920  00af 1501          	bcp	a,(OFST-1,sp)
2921  00b1 270a          	jreq	L1121
2923  00b3 0d02          	tnz	(OFST+0,sp)
2924  00b5 2706          	jreq	L1121
2925                     ; 737       pendingbitstatus = SET;
2927  00b7 a601          	ld	a,#1
2928  00b9 6b02          	ld	(OFST+0,sp),a
2930  00bb 2002          	jra	L7711
2931  00bd               L1121:
2932                     ; 742       pendingbitstatus = RESET;
2934  00bd 0f02          	clr	(OFST+0,sp)
2935  00bf               L7711:
2936                     ; 747   return  pendingbitstatus;
2938  00bf 7b02          	ld	a,(OFST+0,sp)
2941  00c1 5b04          	addw	sp,#4
2942  00c3 81            	ret
2979                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2979                     ; 776 {
2980                     .text:	section	.text,new
2981  0000               _UART1_ClearITPendingBit:
2983  0000 89            	pushw	x
2984       00000000      OFST:	set	0
2987                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2989  0001 a30255        	cpw	x,#597
2990  0004 2705          	jreq	L003
2991  0006 a30346        	cpw	x,#838
2992  0009 2603          	jrne	L672
2993  000b               L003:
2994  000b 4f            	clr	a
2995  000c 2010          	jra	L203
2996  000e               L672:
2997  000e ae0309        	ldw	x,#777
2998  0011 89            	pushw	x
2999  0012 ae0000        	ldw	x,#0
3000  0015 89            	pushw	x
3001  0016 ae0008        	ldw	x,#L371
3002  0019 cd0000        	call	_assert_failed
3004  001c 5b04          	addw	sp,#4
3005  001e               L203:
3006                     ; 780   if (UART1_IT == UART1_IT_RXNE)
3008  001e 1e01          	ldw	x,(OFST+1,sp)
3009  0020 a30255        	cpw	x,#597
3010  0023 2606          	jrne	L3321
3011                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3013  0025 35df5230      	mov	21040,#223
3015  0029 2004          	jra	L5321
3016  002b               L3321:
3017                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3019  002b 72195237      	bres	21047,#4
3020  002f               L5321:
3021                     ; 789 }
3024  002f 85            	popw	x
3025  0030 81            	ret
3038                     	xdef	_UART1_ClearITPendingBit
3039                     	xdef	_UART1_GetITStatus
3040                     	xdef	_UART1_ClearFlag
3041                     	xdef	_UART1_GetFlagStatus
3042                     	xdef	_UART1_SetPrescaler
3043                     	xdef	_UART1_SetGuardTime
3044                     	xdef	_UART1_SetAddress
3045                     	xdef	_UART1_SendBreak
3046                     	xdef	_UART1_SendData9
3047                     	xdef	_UART1_SendData8
3048                     	xdef	_UART1_ReceiveData9
3049                     	xdef	_UART1_ReceiveData8
3050                     	xdef	_UART1_ReceiverWakeUpCmd
3051                     	xdef	_UART1_WakeUpConfig
3052                     	xdef	_UART1_SmartCardNACKCmd
3053                     	xdef	_UART1_SmartCardCmd
3054                     	xdef	_UART1_LINCmd
3055                     	xdef	_UART1_LINBreakDetectionConfig
3056                     	xdef	_UART1_IrDACmd
3057                     	xdef	_UART1_IrDAConfig
3058                     	xdef	_UART1_HalfDuplexCmd
3059                     	xdef	_UART1_ITConfig
3060                     	xdef	_UART1_Cmd
3061                     	xdef	_UART1_Init
3062                     	xdef	_UART1_DeInit
3063                     	xref	_assert_failed
3064                     	xref	_CLK_GetClockFreq
3065                     	switch	.const
3066  0008               L371:
3067  0008 2e2e5c737476  	dc.b	"..\stvd\cosmic\stm"
3068  001a 38735f737464  	dc.b	"8s_stdperiph_lib\l"
3069  002c 696272617269  	dc.b	"ibraries\stm8s_std"
3070  003e 706572697068  	dc.b	"periph_driver\src\"
3071  0050 73746d38735f  	dc.b	"stm8s_uart1.c",0
3072                     	xref.b	c_lreg
3073                     	xref.b	c_x
3093                     	xref	c_lursh
3094                     	xref	c_lsub
3095                     	xref	c_smul
3096                     	xref	c_ludv
3097                     	xref	c_rtol
3098                     	xref	c_llsh
3099                     	xref	c_lcmp
3100                     	xref	c_ltor
3101                     	end
