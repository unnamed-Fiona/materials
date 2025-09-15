   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 58 void TIM1_DeInit(void)
  44                     ; 59 {
  46                     .text:	section	.text,new
  47  0000               _TIM1_DeInit:
  51                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f5250      	clr	21072
  54                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f5251      	clr	21073
  57                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f5252      	clr	21074
  60                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f5253      	clr	21075
  63                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f5254      	clr	21076
  66                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  68  0014 725f5256      	clr	21078
  69                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0018 725f525c      	clr	21084
  72                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  001c 725f525d      	clr	21085
  75                     ; 70   TIM1->CCMR1 = 0x01;
  77  0020 35015258      	mov	21080,#1
  78                     ; 71   TIM1->CCMR2 = 0x01;
  80  0024 35015259      	mov	21081,#1
  81                     ; 72   TIM1->CCMR3 = 0x01;
  83  0028 3501525a      	mov	21082,#1
  84                     ; 73   TIM1->CCMR4 = 0x01;
  86  002c 3501525b      	mov	21083,#1
  87                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  0030 725f525c      	clr	21084
  90                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0034 725f525d      	clr	21085
  93                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0038 725f5258      	clr	21080
  96                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  003c 725f5259      	clr	21081
  99                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  0040 725f525a      	clr	21082
 102                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0044 725f525b      	clr	21083
 105                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0048 725f525e      	clr	21086
 108                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  004c 725f525f      	clr	21087
 111                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  0050 725f5260      	clr	21088
 114                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0054 725f5261      	clr	21089
 117                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0058 35ff5262      	mov	21090,#255
 120                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  005c 35ff5263      	mov	21091,#255
 123                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  0060 725f5265      	clr	21093
 126                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0064 725f5266      	clr	21094
 129                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0068 725f5267      	clr	21095
 132                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  006c 725f5268      	clr	21096
 135                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  0070 725f5269      	clr	21097
 138                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0074 725f526a      	clr	21098
 141                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0078 725f526b      	clr	21099
 144                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  007c 725f526c      	clr	21100
 147                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  0080 725f526f      	clr	21103
 150                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0084 35015257      	mov	21079,#1
 153                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0088 725f526e      	clr	21102
 156                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  008c 725f526d      	clr	21101
 159                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  0090 725f5264      	clr	21092
 162                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0094 725f5255      	clr	21077
 165                     ; 101 }
 168  0098 81            	ret
 278                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 278                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 278                     ; 113                        uint16_t TIM1_Period,
 278                     ; 114                        uint8_t TIM1_RepetitionCounter)
 278                     ; 115 {
 279                     .text:	section	.text,new
 280  0000               _TIM1_TimeBaseInit:
 282  0000 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288  0001 0d05          	tnz	(OFST+5,sp)
 289  0003 2718          	jreq	L21
 290  0005 7b05          	ld	a,(OFST+5,sp)
 291  0007 a110          	cp	a,#16
 292  0009 2712          	jreq	L21
 293  000b 7b05          	ld	a,(OFST+5,sp)
 294  000d a120          	cp	a,#32
 295  000f 270c          	jreq	L21
 296  0011 7b05          	ld	a,(OFST+5,sp)
 297  0013 a140          	cp	a,#64
 298  0015 2706          	jreq	L21
 299  0017 7b05          	ld	a,(OFST+5,sp)
 300  0019 a160          	cp	a,#96
 301  001b 2603          	jrne	L01
 302  001d               L21:
 303  001d 4f            	clr	a
 304  001e 2010          	jra	L41
 305  0020               L01:
 306  0020 ae0075        	ldw	x,#117
 307  0023 89            	pushw	x
 308  0024 ae0000        	ldw	x,#0
 309  0027 89            	pushw	x
 310  0028 ae0000        	ldw	x,#L101
 311  002b cd0000        	call	_assert_failed
 313  002e 5b04          	addw	sp,#4
 314  0030               L41:
 315                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 317  0030 7b06          	ld	a,(OFST+6,sp)
 318  0032 c75262        	ld	21090,a
 319                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 321  0035 7b07          	ld	a,(OFST+7,sp)
 322  0037 c75263        	ld	21091,a
 323                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 325  003a 7b01          	ld	a,(OFST+1,sp)
 326  003c c75260        	ld	21088,a
 327                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 329  003f 7b02          	ld	a,(OFST+2,sp)
 330  0041 c75261        	ld	21089,a
 331                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 331                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 333  0044 c65250        	ld	a,21072
 334  0047 a48f          	and	a,#143
 335  0049 1a05          	or	a,(OFST+5,sp)
 336  004b c75250        	ld	21072,a
 337                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 339  004e 7b08          	ld	a,(OFST+8,sp)
 340  0050 c75264        	ld	21092,a
 341                     ; 133 }
 344  0053 85            	popw	x
 345  0054 81            	ret
 631                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 631                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 631                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 631                     ; 157                   uint16_t TIM1_Pulse,
 631                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 631                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 631                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 631                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 631                     ; 162 {
 632                     .text:	section	.text,new
 633  0000               _TIM1_OC1Init:
 635  0000 89            	pushw	x
 636  0001 5203          	subw	sp,#3
 637       00000003      OFST:	set	3
 640                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 642  0003 9e            	ld	a,xh
 643  0004 4d            	tnz	a
 644  0005 2719          	jreq	L22
 645  0007 9e            	ld	a,xh
 646  0008 a110          	cp	a,#16
 647  000a 2714          	jreq	L22
 648  000c 9e            	ld	a,xh
 649  000d a120          	cp	a,#32
 650  000f 270f          	jreq	L22
 651  0011 9e            	ld	a,xh
 652  0012 a130          	cp	a,#48
 653  0014 270a          	jreq	L22
 654  0016 9e            	ld	a,xh
 655  0017 a160          	cp	a,#96
 656  0019 2705          	jreq	L22
 657  001b 9e            	ld	a,xh
 658  001c a170          	cp	a,#112
 659  001e 2603          	jrne	L02
 660  0020               L22:
 661  0020 4f            	clr	a
 662  0021 2010          	jra	L42
 663  0023               L02:
 664  0023 ae00a4        	ldw	x,#164
 665  0026 89            	pushw	x
 666  0027 ae0000        	ldw	x,#0
 667  002a 89            	pushw	x
 668  002b ae0000        	ldw	x,#L101
 669  002e cd0000        	call	_assert_failed
 671  0031 5b04          	addw	sp,#4
 672  0033               L42:
 673                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 675  0033 0d05          	tnz	(OFST+2,sp)
 676  0035 2706          	jreq	L03
 677  0037 7b05          	ld	a,(OFST+2,sp)
 678  0039 a111          	cp	a,#17
 679  003b 2603          	jrne	L62
 680  003d               L03:
 681  003d 4f            	clr	a
 682  003e 2010          	jra	L23
 683  0040               L62:
 684  0040 ae00a5        	ldw	x,#165
 685  0043 89            	pushw	x
 686  0044 ae0000        	ldw	x,#0
 687  0047 89            	pushw	x
 688  0048 ae0000        	ldw	x,#L101
 689  004b cd0000        	call	_assert_failed
 691  004e 5b04          	addw	sp,#4
 692  0050               L23:
 693                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 695  0050 0d08          	tnz	(OFST+5,sp)
 696  0052 2706          	jreq	L63
 697  0054 7b08          	ld	a,(OFST+5,sp)
 698  0056 a144          	cp	a,#68
 699  0058 2603          	jrne	L43
 700  005a               L63:
 701  005a 4f            	clr	a
 702  005b 2010          	jra	L04
 703  005d               L43:
 704  005d ae00a6        	ldw	x,#166
 705  0060 89            	pushw	x
 706  0061 ae0000        	ldw	x,#0
 707  0064 89            	pushw	x
 708  0065 ae0000        	ldw	x,#L101
 709  0068 cd0000        	call	_assert_failed
 711  006b 5b04          	addw	sp,#4
 712  006d               L04:
 713                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 715  006d 0d0b          	tnz	(OFST+8,sp)
 716  006f 2706          	jreq	L44
 717  0071 7b0b          	ld	a,(OFST+8,sp)
 718  0073 a122          	cp	a,#34
 719  0075 2603          	jrne	L24
 720  0077               L44:
 721  0077 4f            	clr	a
 722  0078 2010          	jra	L64
 723  007a               L24:
 724  007a ae00a7        	ldw	x,#167
 725  007d 89            	pushw	x
 726  007e ae0000        	ldw	x,#0
 727  0081 89            	pushw	x
 728  0082 ae0000        	ldw	x,#L101
 729  0085 cd0000        	call	_assert_failed
 731  0088 5b04          	addw	sp,#4
 732  008a               L64:
 733                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 735  008a 0d0c          	tnz	(OFST+9,sp)
 736  008c 2706          	jreq	L25
 737  008e 7b0c          	ld	a,(OFST+9,sp)
 738  0090 a188          	cp	a,#136
 739  0092 2603          	jrne	L05
 740  0094               L25:
 741  0094 4f            	clr	a
 742  0095 2010          	jra	L45
 743  0097               L05:
 744  0097 ae00a8        	ldw	x,#168
 745  009a 89            	pushw	x
 746  009b ae0000        	ldw	x,#0
 747  009e 89            	pushw	x
 748  009f ae0000        	ldw	x,#L101
 749  00a2 cd0000        	call	_assert_failed
 751  00a5 5b04          	addw	sp,#4
 752  00a7               L45:
 753                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 755  00a7 7b0d          	ld	a,(OFST+10,sp)
 756  00a9 a155          	cp	a,#85
 757  00ab 2704          	jreq	L06
 758  00ad 0d0d          	tnz	(OFST+10,sp)
 759  00af 2603          	jrne	L65
 760  00b1               L06:
 761  00b1 4f            	clr	a
 762  00b2 2010          	jra	L26
 763  00b4               L65:
 764  00b4 ae00a9        	ldw	x,#169
 765  00b7 89            	pushw	x
 766  00b8 ae0000        	ldw	x,#0
 767  00bb 89            	pushw	x
 768  00bc ae0000        	ldw	x,#L101
 769  00bf cd0000        	call	_assert_failed
 771  00c2 5b04          	addw	sp,#4
 772  00c4               L26:
 773                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 775  00c4 7b0e          	ld	a,(OFST+11,sp)
 776  00c6 a12a          	cp	a,#42
 777  00c8 2704          	jreq	L66
 778  00ca 0d0e          	tnz	(OFST+11,sp)
 779  00cc 2603          	jrne	L46
 780  00ce               L66:
 781  00ce 4f            	clr	a
 782  00cf 2010          	jra	L07
 783  00d1               L46:
 784  00d1 ae00aa        	ldw	x,#170
 785  00d4 89            	pushw	x
 786  00d5 ae0000        	ldw	x,#0
 787  00d8 89            	pushw	x
 788  00d9 ae0000        	ldw	x,#L101
 789  00dc cd0000        	call	_assert_failed
 791  00df 5b04          	addw	sp,#4
 792  00e1               L07:
 793                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 793                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 795  00e1 c6525c        	ld	a,21084
 796  00e4 a4f0          	and	a,#240
 797  00e6 c7525c        	ld	21084,a
 798                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 798                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 798                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 798                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 800  00e9 7b0c          	ld	a,(OFST+9,sp)
 801  00eb a408          	and	a,#8
 802  00ed 6b03          	ld	(OFST+0,sp),a
 803  00ef 7b0b          	ld	a,(OFST+8,sp)
 804  00f1 a402          	and	a,#2
 805  00f3 1a03          	or	a,(OFST+0,sp)
 806  00f5 6b02          	ld	(OFST-1,sp),a
 807  00f7 7b08          	ld	a,(OFST+5,sp)
 808  00f9 a404          	and	a,#4
 809  00fb 6b01          	ld	(OFST-2,sp),a
 810  00fd 7b05          	ld	a,(OFST+2,sp)
 811  00ff a401          	and	a,#1
 812  0101 1a01          	or	a,(OFST-2,sp)
 813  0103 1a02          	or	a,(OFST-1,sp)
 814  0105 ca525c        	or	a,21084
 815  0108 c7525c        	ld	21084,a
 816                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 816                     ; 185                           (uint8_t)TIM1_OCMode);
 818  010b c65258        	ld	a,21080
 819  010e a48f          	and	a,#143
 820  0110 1a04          	or	a,(OFST+1,sp)
 821  0112 c75258        	ld	21080,a
 822                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 824  0115 c6526f        	ld	a,21103
 825  0118 a4fc          	and	a,#252
 826  011a c7526f        	ld	21103,a
 827                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 827                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 829  011d 7b0e          	ld	a,(OFST+11,sp)
 830  011f a402          	and	a,#2
 831  0121 6b03          	ld	(OFST+0,sp),a
 832  0123 7b0d          	ld	a,(OFST+10,sp)
 833  0125 a401          	and	a,#1
 834  0127 1a03          	or	a,(OFST+0,sp)
 835  0129 ca526f        	or	a,21103
 836  012c c7526f        	ld	21103,a
 837                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 839  012f 7b09          	ld	a,(OFST+6,sp)
 840  0131 c75265        	ld	21093,a
 841                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 843  0134 7b0a          	ld	a,(OFST+7,sp)
 844  0136 c75266        	ld	21094,a
 845                     ; 196 }
 848  0139 5b05          	addw	sp,#5
 849  013b 81            	ret
 954                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 954                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 954                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 954                     ; 220                   uint16_t TIM1_Pulse,
 954                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 954                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 954                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 954                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 954                     ; 225 {
 955                     .text:	section	.text,new
 956  0000               _TIM1_OC2Init:
 958  0000 89            	pushw	x
 959  0001 5203          	subw	sp,#3
 960       00000003      OFST:	set	3
 963                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 965  0003 9e            	ld	a,xh
 966  0004 4d            	tnz	a
 967  0005 2719          	jreq	L67
 968  0007 9e            	ld	a,xh
 969  0008 a110          	cp	a,#16
 970  000a 2714          	jreq	L67
 971  000c 9e            	ld	a,xh
 972  000d a120          	cp	a,#32
 973  000f 270f          	jreq	L67
 974  0011 9e            	ld	a,xh
 975  0012 a130          	cp	a,#48
 976  0014 270a          	jreq	L67
 977  0016 9e            	ld	a,xh
 978  0017 a160          	cp	a,#96
 979  0019 2705          	jreq	L67
 980  001b 9e            	ld	a,xh
 981  001c a170          	cp	a,#112
 982  001e 2603          	jrne	L47
 983  0020               L67:
 984  0020 4f            	clr	a
 985  0021 2010          	jra	L001
 986  0023               L47:
 987  0023 ae00e3        	ldw	x,#227
 988  0026 89            	pushw	x
 989  0027 ae0000        	ldw	x,#0
 990  002a 89            	pushw	x
 991  002b ae0000        	ldw	x,#L101
 992  002e cd0000        	call	_assert_failed
 994  0031 5b04          	addw	sp,#4
 995  0033               L001:
 996                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 998  0033 0d05          	tnz	(OFST+2,sp)
 999  0035 2706          	jreq	L401
1000  0037 7b05          	ld	a,(OFST+2,sp)
1001  0039 a111          	cp	a,#17
1002  003b 2603          	jrne	L201
1003  003d               L401:
1004  003d 4f            	clr	a
1005  003e 2010          	jra	L601
1006  0040               L201:
1007  0040 ae00e4        	ldw	x,#228
1008  0043 89            	pushw	x
1009  0044 ae0000        	ldw	x,#0
1010  0047 89            	pushw	x
1011  0048 ae0000        	ldw	x,#L101
1012  004b cd0000        	call	_assert_failed
1014  004e 5b04          	addw	sp,#4
1015  0050               L601:
1016                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1018  0050 0d08          	tnz	(OFST+5,sp)
1019  0052 2706          	jreq	L211
1020  0054 7b08          	ld	a,(OFST+5,sp)
1021  0056 a144          	cp	a,#68
1022  0058 2603          	jrne	L011
1023  005a               L211:
1024  005a 4f            	clr	a
1025  005b 2010          	jra	L411
1026  005d               L011:
1027  005d ae00e5        	ldw	x,#229
1028  0060 89            	pushw	x
1029  0061 ae0000        	ldw	x,#0
1030  0064 89            	pushw	x
1031  0065 ae0000        	ldw	x,#L101
1032  0068 cd0000        	call	_assert_failed
1034  006b 5b04          	addw	sp,#4
1035  006d               L411:
1036                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1038  006d 0d0b          	tnz	(OFST+8,sp)
1039  006f 2706          	jreq	L021
1040  0071 7b0b          	ld	a,(OFST+8,sp)
1041  0073 a122          	cp	a,#34
1042  0075 2603          	jrne	L611
1043  0077               L021:
1044  0077 4f            	clr	a
1045  0078 2010          	jra	L221
1046  007a               L611:
1047  007a ae00e6        	ldw	x,#230
1048  007d 89            	pushw	x
1049  007e ae0000        	ldw	x,#0
1050  0081 89            	pushw	x
1051  0082 ae0000        	ldw	x,#L101
1052  0085 cd0000        	call	_assert_failed
1054  0088 5b04          	addw	sp,#4
1055  008a               L221:
1056                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1058  008a 0d0c          	tnz	(OFST+9,sp)
1059  008c 2706          	jreq	L621
1060  008e 7b0c          	ld	a,(OFST+9,sp)
1061  0090 a188          	cp	a,#136
1062  0092 2603          	jrne	L421
1063  0094               L621:
1064  0094 4f            	clr	a
1065  0095 2010          	jra	L031
1066  0097               L421:
1067  0097 ae00e7        	ldw	x,#231
1068  009a 89            	pushw	x
1069  009b ae0000        	ldw	x,#0
1070  009e 89            	pushw	x
1071  009f ae0000        	ldw	x,#L101
1072  00a2 cd0000        	call	_assert_failed
1074  00a5 5b04          	addw	sp,#4
1075  00a7               L031:
1076                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1078  00a7 7b0d          	ld	a,(OFST+10,sp)
1079  00a9 a155          	cp	a,#85
1080  00ab 2704          	jreq	L431
1081  00ad 0d0d          	tnz	(OFST+10,sp)
1082  00af 2603          	jrne	L231
1083  00b1               L431:
1084  00b1 4f            	clr	a
1085  00b2 2010          	jra	L631
1086  00b4               L231:
1087  00b4 ae00e8        	ldw	x,#232
1088  00b7 89            	pushw	x
1089  00b8 ae0000        	ldw	x,#0
1090  00bb 89            	pushw	x
1091  00bc ae0000        	ldw	x,#L101
1092  00bf cd0000        	call	_assert_failed
1094  00c2 5b04          	addw	sp,#4
1095  00c4               L631:
1096                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1098  00c4 7b0e          	ld	a,(OFST+11,sp)
1099  00c6 a12a          	cp	a,#42
1100  00c8 2704          	jreq	L241
1101  00ca 0d0e          	tnz	(OFST+11,sp)
1102  00cc 2603          	jrne	L041
1103  00ce               L241:
1104  00ce 4f            	clr	a
1105  00cf 2010          	jra	L441
1106  00d1               L041:
1107  00d1 ae00e9        	ldw	x,#233
1108  00d4 89            	pushw	x
1109  00d5 ae0000        	ldw	x,#0
1110  00d8 89            	pushw	x
1111  00d9 ae0000        	ldw	x,#L101
1112  00dc cd0000        	call	_assert_failed
1114  00df 5b04          	addw	sp,#4
1115  00e1               L441:
1116                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1116                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1118  00e1 c6525c        	ld	a,21084
1119  00e4 a40f          	and	a,#15
1120  00e6 c7525c        	ld	21084,a
1121                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1121                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1121                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1121                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1123  00e9 7b0c          	ld	a,(OFST+9,sp)
1124  00eb a480          	and	a,#128
1125  00ed 6b03          	ld	(OFST+0,sp),a
1126  00ef 7b0b          	ld	a,(OFST+8,sp)
1127  00f1 a420          	and	a,#32
1128  00f3 1a03          	or	a,(OFST+0,sp)
1129  00f5 6b02          	ld	(OFST-1,sp),a
1130  00f7 7b08          	ld	a,(OFST+5,sp)
1131  00f9 a440          	and	a,#64
1132  00fb 6b01          	ld	(OFST-2,sp),a
1133  00fd 7b05          	ld	a,(OFST+2,sp)
1134  00ff a410          	and	a,#16
1135  0101 1a01          	or	a,(OFST-2,sp)
1136  0103 1a02          	or	a,(OFST-1,sp)
1137  0105 ca525c        	or	a,21084
1138  0108 c7525c        	ld	21084,a
1139                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1139                     ; 249                           (uint8_t)TIM1_OCMode);
1141  010b c65259        	ld	a,21081
1142  010e a48f          	and	a,#143
1143  0110 1a04          	or	a,(OFST+1,sp)
1144  0112 c75259        	ld	21081,a
1145                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1147  0115 c6526f        	ld	a,21103
1148  0118 a4f3          	and	a,#243
1149  011a c7526f        	ld	21103,a
1150                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1150                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1152  011d 7b0e          	ld	a,(OFST+11,sp)
1153  011f a408          	and	a,#8
1154  0121 6b03          	ld	(OFST+0,sp),a
1155  0123 7b0d          	ld	a,(OFST+10,sp)
1156  0125 a404          	and	a,#4
1157  0127 1a03          	or	a,(OFST+0,sp)
1158  0129 ca526f        	or	a,21103
1159  012c c7526f        	ld	21103,a
1160                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1162  012f 7b09          	ld	a,(OFST+6,sp)
1163  0131 c75267        	ld	21095,a
1164                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1166  0134 7b0a          	ld	a,(OFST+7,sp)
1167  0136 c75268        	ld	21096,a
1168                     ; 260 }
1171  0139 5b05          	addw	sp,#5
1172  013b 81            	ret
1277                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1277                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1277                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1277                     ; 284                   uint16_t TIM1_Pulse,
1277                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1277                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1277                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1277                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1277                     ; 289 {
1278                     .text:	section	.text,new
1279  0000               _TIM1_OC3Init:
1281  0000 89            	pushw	x
1282  0001 5203          	subw	sp,#3
1283       00000003      OFST:	set	3
1286                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1288  0003 9e            	ld	a,xh
1289  0004 4d            	tnz	a
1290  0005 2719          	jreq	L251
1291  0007 9e            	ld	a,xh
1292  0008 a110          	cp	a,#16
1293  000a 2714          	jreq	L251
1294  000c 9e            	ld	a,xh
1295  000d a120          	cp	a,#32
1296  000f 270f          	jreq	L251
1297  0011 9e            	ld	a,xh
1298  0012 a130          	cp	a,#48
1299  0014 270a          	jreq	L251
1300  0016 9e            	ld	a,xh
1301  0017 a160          	cp	a,#96
1302  0019 2705          	jreq	L251
1303  001b 9e            	ld	a,xh
1304  001c a170          	cp	a,#112
1305  001e 2603          	jrne	L051
1306  0020               L251:
1307  0020 4f            	clr	a
1308  0021 2010          	jra	L451
1309  0023               L051:
1310  0023 ae0123        	ldw	x,#291
1311  0026 89            	pushw	x
1312  0027 ae0000        	ldw	x,#0
1313  002a 89            	pushw	x
1314  002b ae0000        	ldw	x,#L101
1315  002e cd0000        	call	_assert_failed
1317  0031 5b04          	addw	sp,#4
1318  0033               L451:
1319                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1321  0033 0d05          	tnz	(OFST+2,sp)
1322  0035 2706          	jreq	L061
1323  0037 7b05          	ld	a,(OFST+2,sp)
1324  0039 a111          	cp	a,#17
1325  003b 2603          	jrne	L651
1326  003d               L061:
1327  003d 4f            	clr	a
1328  003e 2010          	jra	L261
1329  0040               L651:
1330  0040 ae0124        	ldw	x,#292
1331  0043 89            	pushw	x
1332  0044 ae0000        	ldw	x,#0
1333  0047 89            	pushw	x
1334  0048 ae0000        	ldw	x,#L101
1335  004b cd0000        	call	_assert_failed
1337  004e 5b04          	addw	sp,#4
1338  0050               L261:
1339                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1341  0050 0d08          	tnz	(OFST+5,sp)
1342  0052 2706          	jreq	L661
1343  0054 7b08          	ld	a,(OFST+5,sp)
1344  0056 a144          	cp	a,#68
1345  0058 2603          	jrne	L461
1346  005a               L661:
1347  005a 4f            	clr	a
1348  005b 2010          	jra	L071
1349  005d               L461:
1350  005d ae0125        	ldw	x,#293
1351  0060 89            	pushw	x
1352  0061 ae0000        	ldw	x,#0
1353  0064 89            	pushw	x
1354  0065 ae0000        	ldw	x,#L101
1355  0068 cd0000        	call	_assert_failed
1357  006b 5b04          	addw	sp,#4
1358  006d               L071:
1359                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1361  006d 0d0b          	tnz	(OFST+8,sp)
1362  006f 2706          	jreq	L471
1363  0071 7b0b          	ld	a,(OFST+8,sp)
1364  0073 a122          	cp	a,#34
1365  0075 2603          	jrne	L271
1366  0077               L471:
1367  0077 4f            	clr	a
1368  0078 2010          	jra	L671
1369  007a               L271:
1370  007a ae0126        	ldw	x,#294
1371  007d 89            	pushw	x
1372  007e ae0000        	ldw	x,#0
1373  0081 89            	pushw	x
1374  0082 ae0000        	ldw	x,#L101
1375  0085 cd0000        	call	_assert_failed
1377  0088 5b04          	addw	sp,#4
1378  008a               L671:
1379                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1381  008a 0d0c          	tnz	(OFST+9,sp)
1382  008c 2706          	jreq	L202
1383  008e 7b0c          	ld	a,(OFST+9,sp)
1384  0090 a188          	cp	a,#136
1385  0092 2603          	jrne	L002
1386  0094               L202:
1387  0094 4f            	clr	a
1388  0095 2010          	jra	L402
1389  0097               L002:
1390  0097 ae0127        	ldw	x,#295
1391  009a 89            	pushw	x
1392  009b ae0000        	ldw	x,#0
1393  009e 89            	pushw	x
1394  009f ae0000        	ldw	x,#L101
1395  00a2 cd0000        	call	_assert_failed
1397  00a5 5b04          	addw	sp,#4
1398  00a7               L402:
1399                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1401  00a7 7b0d          	ld	a,(OFST+10,sp)
1402  00a9 a155          	cp	a,#85
1403  00ab 2704          	jreq	L012
1404  00ad 0d0d          	tnz	(OFST+10,sp)
1405  00af 2603          	jrne	L602
1406  00b1               L012:
1407  00b1 4f            	clr	a
1408  00b2 2010          	jra	L212
1409  00b4               L602:
1410  00b4 ae0128        	ldw	x,#296
1411  00b7 89            	pushw	x
1412  00b8 ae0000        	ldw	x,#0
1413  00bb 89            	pushw	x
1414  00bc ae0000        	ldw	x,#L101
1415  00bf cd0000        	call	_assert_failed
1417  00c2 5b04          	addw	sp,#4
1418  00c4               L212:
1419                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1421  00c4 7b0e          	ld	a,(OFST+11,sp)
1422  00c6 a12a          	cp	a,#42
1423  00c8 2704          	jreq	L612
1424  00ca 0d0e          	tnz	(OFST+11,sp)
1425  00cc 2603          	jrne	L412
1426  00ce               L612:
1427  00ce 4f            	clr	a
1428  00cf 2010          	jra	L022
1429  00d1               L412:
1430  00d1 ae0129        	ldw	x,#297
1431  00d4 89            	pushw	x
1432  00d5 ae0000        	ldw	x,#0
1433  00d8 89            	pushw	x
1434  00d9 ae0000        	ldw	x,#L101
1435  00dc cd0000        	call	_assert_failed
1437  00df 5b04          	addw	sp,#4
1438  00e1               L022:
1439                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1439                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1441  00e1 c6525d        	ld	a,21085
1442  00e4 a4f0          	and	a,#240
1443  00e6 c7525d        	ld	21085,a
1444                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1444                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1444                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1444                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1446  00e9 7b0c          	ld	a,(OFST+9,sp)
1447  00eb a408          	and	a,#8
1448  00ed 6b03          	ld	(OFST+0,sp),a
1449  00ef 7b0b          	ld	a,(OFST+8,sp)
1450  00f1 a402          	and	a,#2
1451  00f3 1a03          	or	a,(OFST+0,sp)
1452  00f5 6b02          	ld	(OFST-1,sp),a
1453  00f7 7b08          	ld	a,(OFST+5,sp)
1454  00f9 a404          	and	a,#4
1455  00fb 6b01          	ld	(OFST-2,sp),a
1456  00fd 7b05          	ld	a,(OFST+2,sp)
1457  00ff a401          	and	a,#1
1458  0101 1a01          	or	a,(OFST-2,sp)
1459  0103 1a02          	or	a,(OFST-1,sp)
1460  0105 ca525d        	or	a,21085
1461  0108 c7525d        	ld	21085,a
1462                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1462                     ; 312                           (uint8_t)TIM1_OCMode);
1464  010b c6525a        	ld	a,21082
1465  010e a48f          	and	a,#143
1466  0110 1a04          	or	a,(OFST+1,sp)
1467  0112 c7525a        	ld	21082,a
1468                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1470  0115 c6526f        	ld	a,21103
1471  0118 a4cf          	and	a,#207
1472  011a c7526f        	ld	21103,a
1473                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1473                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1475  011d 7b0e          	ld	a,(OFST+11,sp)
1476  011f a420          	and	a,#32
1477  0121 6b03          	ld	(OFST+0,sp),a
1478  0123 7b0d          	ld	a,(OFST+10,sp)
1479  0125 a410          	and	a,#16
1480  0127 1a03          	or	a,(OFST+0,sp)
1481  0129 ca526f        	or	a,21103
1482  012c c7526f        	ld	21103,a
1483                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1485  012f 7b09          	ld	a,(OFST+6,sp)
1486  0131 c75269        	ld	21097,a
1487                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1489  0134 7b0a          	ld	a,(OFST+7,sp)
1490  0136 c7526a        	ld	21098,a
1491                     ; 323 }
1494  0139 5b05          	addw	sp,#5
1495  013b 81            	ret
1570                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1570                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1570                     ; 340                   uint16_t TIM1_Pulse,
1570                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1570                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1570                     ; 343 {
1571                     .text:	section	.text,new
1572  0000               _TIM1_OC4Init:
1574  0000 89            	pushw	x
1575  0001 88            	push	a
1576       00000001      OFST:	set	1
1579                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1581  0002 9e            	ld	a,xh
1582  0003 4d            	tnz	a
1583  0004 2719          	jreq	L622
1584  0006 9e            	ld	a,xh
1585  0007 a110          	cp	a,#16
1586  0009 2714          	jreq	L622
1587  000b 9e            	ld	a,xh
1588  000c a120          	cp	a,#32
1589  000e 270f          	jreq	L622
1590  0010 9e            	ld	a,xh
1591  0011 a130          	cp	a,#48
1592  0013 270a          	jreq	L622
1593  0015 9e            	ld	a,xh
1594  0016 a160          	cp	a,#96
1595  0018 2705          	jreq	L622
1596  001a 9e            	ld	a,xh
1597  001b a170          	cp	a,#112
1598  001d 2603          	jrne	L422
1599  001f               L622:
1600  001f 4f            	clr	a
1601  0020 2010          	jra	L032
1602  0022               L422:
1603  0022 ae0159        	ldw	x,#345
1604  0025 89            	pushw	x
1605  0026 ae0000        	ldw	x,#0
1606  0029 89            	pushw	x
1607  002a ae0000        	ldw	x,#L101
1608  002d cd0000        	call	_assert_failed
1610  0030 5b04          	addw	sp,#4
1611  0032               L032:
1612                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1614  0032 0d03          	tnz	(OFST+2,sp)
1615  0034 2706          	jreq	L432
1616  0036 7b03          	ld	a,(OFST+2,sp)
1617  0038 a111          	cp	a,#17
1618  003a 2603          	jrne	L232
1619  003c               L432:
1620  003c 4f            	clr	a
1621  003d 2010          	jra	L632
1622  003f               L232:
1623  003f ae015a        	ldw	x,#346
1624  0042 89            	pushw	x
1625  0043 ae0000        	ldw	x,#0
1626  0046 89            	pushw	x
1627  0047 ae0000        	ldw	x,#L101
1628  004a cd0000        	call	_assert_failed
1630  004d 5b04          	addw	sp,#4
1631  004f               L632:
1632                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1634  004f 0d08          	tnz	(OFST+7,sp)
1635  0051 2706          	jreq	L242
1636  0053 7b08          	ld	a,(OFST+7,sp)
1637  0055 a122          	cp	a,#34
1638  0057 2603          	jrne	L042
1639  0059               L242:
1640  0059 4f            	clr	a
1641  005a 2010          	jra	L442
1642  005c               L042:
1643  005c ae015b        	ldw	x,#347
1644  005f 89            	pushw	x
1645  0060 ae0000        	ldw	x,#0
1646  0063 89            	pushw	x
1647  0064 ae0000        	ldw	x,#L101
1648  0067 cd0000        	call	_assert_failed
1650  006a 5b04          	addw	sp,#4
1651  006c               L442:
1652                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1654  006c 7b09          	ld	a,(OFST+8,sp)
1655  006e a155          	cp	a,#85
1656  0070 2704          	jreq	L052
1657  0072 0d09          	tnz	(OFST+8,sp)
1658  0074 2603          	jrne	L642
1659  0076               L052:
1660  0076 4f            	clr	a
1661  0077 2010          	jra	L252
1662  0079               L642:
1663  0079 ae015c        	ldw	x,#348
1664  007c 89            	pushw	x
1665  007d ae0000        	ldw	x,#0
1666  0080 89            	pushw	x
1667  0081 ae0000        	ldw	x,#L101
1668  0084 cd0000        	call	_assert_failed
1670  0087 5b04          	addw	sp,#4
1671  0089               L252:
1672                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1674  0089 c6525d        	ld	a,21085
1675  008c a4cf          	and	a,#207
1676  008e c7525d        	ld	21085,a
1677                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1677                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1679  0091 7b08          	ld	a,(OFST+7,sp)
1680  0093 a420          	and	a,#32
1681  0095 6b01          	ld	(OFST+0,sp),a
1682  0097 7b03          	ld	a,(OFST+2,sp)
1683  0099 a410          	and	a,#16
1684  009b 1a01          	or	a,(OFST+0,sp)
1685  009d ca525d        	or	a,21085
1686  00a0 c7525d        	ld	21085,a
1687                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1687                     ; 358                           TIM1_OCMode);
1689  00a3 c6525b        	ld	a,21083
1690  00a6 a48f          	and	a,#143
1691  00a8 1a02          	or	a,(OFST+1,sp)
1692  00aa c7525b        	ld	21083,a
1693                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1695  00ad 0d09          	tnz	(OFST+8,sp)
1696  00af 270a          	jreq	L734
1697                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1699  00b1 c6526f        	ld	a,21103
1700  00b4 aadf          	or	a,#223
1701  00b6 c7526f        	ld	21103,a
1703  00b9 2004          	jra	L144
1704  00bb               L734:
1705                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1707  00bb 721d526f      	bres	21103,#6
1708  00bf               L144:
1709                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1711  00bf 7b06          	ld	a,(OFST+5,sp)
1712  00c1 c7526b        	ld	21099,a
1713                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1715  00c4 7b07          	ld	a,(OFST+6,sp)
1716  00c6 c7526c        	ld	21100,a
1717                     ; 373 }
1720  00c9 5b03          	addw	sp,#3
1721  00cb 81            	ret
1927                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1927                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1927                     ; 390                      uint8_t TIM1_DeadTime,
1927                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1927                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1927                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1927                     ; 394 {
1928                     .text:	section	.text,new
1929  0000               _TIM1_BDTRConfig:
1931  0000 89            	pushw	x
1932  0001 88            	push	a
1933       00000001      OFST:	set	1
1936                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1938  0002 9e            	ld	a,xh
1939  0003 a104          	cp	a,#4
1940  0005 2704          	jreq	L062
1941  0007 9e            	ld	a,xh
1942  0008 4d            	tnz	a
1943  0009 2603          	jrne	L652
1944  000b               L062:
1945  000b 4f            	clr	a
1946  000c 2010          	jra	L262
1947  000e               L652:
1948  000e ae018c        	ldw	x,#396
1949  0011 89            	pushw	x
1950  0012 ae0000        	ldw	x,#0
1951  0015 89            	pushw	x
1952  0016 ae0000        	ldw	x,#L101
1953  0019 cd0000        	call	_assert_failed
1955  001c 5b04          	addw	sp,#4
1956  001e               L262:
1957                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1959  001e 0d03          	tnz	(OFST+2,sp)
1960  0020 2712          	jreq	L662
1961  0022 7b03          	ld	a,(OFST+2,sp)
1962  0024 a101          	cp	a,#1
1963  0026 270c          	jreq	L662
1964  0028 7b03          	ld	a,(OFST+2,sp)
1965  002a a102          	cp	a,#2
1966  002c 2706          	jreq	L662
1967  002e 7b03          	ld	a,(OFST+2,sp)
1968  0030 a103          	cp	a,#3
1969  0032 2603          	jrne	L462
1970  0034               L662:
1971  0034 4f            	clr	a
1972  0035 2010          	jra	L072
1973  0037               L462:
1974  0037 ae018d        	ldw	x,#397
1975  003a 89            	pushw	x
1976  003b ae0000        	ldw	x,#0
1977  003e 89            	pushw	x
1978  003f ae0000        	ldw	x,#L101
1979  0042 cd0000        	call	_assert_failed
1981  0045 5b04          	addw	sp,#4
1982  0047               L072:
1983                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1985  0047 7b07          	ld	a,(OFST+6,sp)
1986  0049 a110          	cp	a,#16
1987  004b 2704          	jreq	L472
1988  004d 0d07          	tnz	(OFST+6,sp)
1989  004f 2603          	jrne	L272
1990  0051               L472:
1991  0051 4f            	clr	a
1992  0052 2010          	jra	L672
1993  0054               L272:
1994  0054 ae018e        	ldw	x,#398
1995  0057 89            	pushw	x
1996  0058 ae0000        	ldw	x,#0
1997  005b 89            	pushw	x
1998  005c ae0000        	ldw	x,#L101
1999  005f cd0000        	call	_assert_failed
2001  0062 5b04          	addw	sp,#4
2002  0064               L672:
2003                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
2005  0064 0d08          	tnz	(OFST+7,sp)
2006  0066 2706          	jreq	L203
2007  0068 7b08          	ld	a,(OFST+7,sp)
2008  006a a120          	cp	a,#32
2009  006c 2603          	jrne	L003
2010  006e               L203:
2011  006e 4f            	clr	a
2012  006f 2010          	jra	L403
2013  0071               L003:
2014  0071 ae018f        	ldw	x,#399
2015  0074 89            	pushw	x
2016  0075 ae0000        	ldw	x,#0
2017  0078 89            	pushw	x
2018  0079 ae0000        	ldw	x,#L101
2019  007c cd0000        	call	_assert_failed
2021  007f 5b04          	addw	sp,#4
2022  0081               L403:
2023                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
2025  0081 7b09          	ld	a,(OFST+8,sp)
2026  0083 a140          	cp	a,#64
2027  0085 2704          	jreq	L013
2028  0087 0d09          	tnz	(OFST+8,sp)
2029  0089 2603          	jrne	L603
2030  008b               L013:
2031  008b 4f            	clr	a
2032  008c 2010          	jra	L213
2033  008e               L603:
2034  008e ae0190        	ldw	x,#400
2035  0091 89            	pushw	x
2036  0092 ae0000        	ldw	x,#0
2037  0095 89            	pushw	x
2038  0096 ae0000        	ldw	x,#L101
2039  0099 cd0000        	call	_assert_failed
2041  009c 5b04          	addw	sp,#4
2042  009e               L213:
2043                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2045  009e 7b06          	ld	a,(OFST+5,sp)
2046  00a0 c7526e        	ld	21102,a
2047                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2047                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2047                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
2049  00a3 7b07          	ld	a,(OFST+6,sp)
2050  00a5 1a08          	or	a,(OFST+7,sp)
2051  00a7 1a09          	or	a,(OFST+8,sp)
2052  00a9 6b01          	ld	(OFST+0,sp),a
2053  00ab 7b02          	ld	a,(OFST+1,sp)
2054  00ad 1a03          	or	a,(OFST+2,sp)
2055  00af 1a01          	or	a,(OFST+0,sp)
2056  00b1 c7526d        	ld	21101,a
2057                     ; 409 }
2060  00b4 5b03          	addw	sp,#3
2061  00b6 81            	ret
2264                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2264                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2264                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2264                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2264                     ; 427                  uint8_t TIM1_ICFilter)
2264                     ; 428 {
2265                     .text:	section	.text,new
2266  0000               _TIM1_ICInit:
2268  0000 89            	pushw	x
2269       00000000      OFST:	set	0
2272                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2274  0001 9e            	ld	a,xh
2275  0002 4d            	tnz	a
2276  0003 270f          	jreq	L023
2277  0005 9e            	ld	a,xh
2278  0006 a101          	cp	a,#1
2279  0008 270a          	jreq	L023
2280  000a 9e            	ld	a,xh
2281  000b a102          	cp	a,#2
2282  000d 2705          	jreq	L023
2283  000f 9e            	ld	a,xh
2284  0010 a103          	cp	a,#3
2285  0012 2603          	jrne	L613
2286  0014               L023:
2287  0014 4f            	clr	a
2288  0015 2010          	jra	L223
2289  0017               L613:
2290  0017 ae01ae        	ldw	x,#430
2291  001a 89            	pushw	x
2292  001b ae0000        	ldw	x,#0
2293  001e 89            	pushw	x
2294  001f ae0000        	ldw	x,#L101
2295  0022 cd0000        	call	_assert_failed
2297  0025 5b04          	addw	sp,#4
2298  0027               L223:
2299                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2301  0027 0d02          	tnz	(OFST+2,sp)
2302  0029 2706          	jreq	L623
2303  002b 7b02          	ld	a,(OFST+2,sp)
2304  002d a101          	cp	a,#1
2305  002f 2603          	jrne	L423
2306  0031               L623:
2307  0031 4f            	clr	a
2308  0032 2010          	jra	L033
2309  0034               L423:
2310  0034 ae01af        	ldw	x,#431
2311  0037 89            	pushw	x
2312  0038 ae0000        	ldw	x,#0
2313  003b 89            	pushw	x
2314  003c ae0000        	ldw	x,#L101
2315  003f cd0000        	call	_assert_failed
2317  0042 5b04          	addw	sp,#4
2318  0044               L033:
2319                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2321  0044 7b05          	ld	a,(OFST+5,sp)
2322  0046 a101          	cp	a,#1
2323  0048 270c          	jreq	L433
2324  004a 7b05          	ld	a,(OFST+5,sp)
2325  004c a102          	cp	a,#2
2326  004e 2706          	jreq	L433
2327  0050 7b05          	ld	a,(OFST+5,sp)
2328  0052 a103          	cp	a,#3
2329  0054 2603          	jrne	L233
2330  0056               L433:
2331  0056 4f            	clr	a
2332  0057 2010          	jra	L633
2333  0059               L233:
2334  0059 ae01b0        	ldw	x,#432
2335  005c 89            	pushw	x
2336  005d ae0000        	ldw	x,#0
2337  0060 89            	pushw	x
2338  0061 ae0000        	ldw	x,#L101
2339  0064 cd0000        	call	_assert_failed
2341  0067 5b04          	addw	sp,#4
2342  0069               L633:
2343                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2345  0069 0d06          	tnz	(OFST+6,sp)
2346  006b 2712          	jreq	L243
2347  006d 7b06          	ld	a,(OFST+6,sp)
2348  006f a104          	cp	a,#4
2349  0071 270c          	jreq	L243
2350  0073 7b06          	ld	a,(OFST+6,sp)
2351  0075 a108          	cp	a,#8
2352  0077 2706          	jreq	L243
2353  0079 7b06          	ld	a,(OFST+6,sp)
2354  007b a10c          	cp	a,#12
2355  007d 2603          	jrne	L043
2356  007f               L243:
2357  007f 4f            	clr	a
2358  0080 2010          	jra	L443
2359  0082               L043:
2360  0082 ae01b1        	ldw	x,#433
2361  0085 89            	pushw	x
2362  0086 ae0000        	ldw	x,#0
2363  0089 89            	pushw	x
2364  008a ae0000        	ldw	x,#L101
2365  008d cd0000        	call	_assert_failed
2367  0090 5b04          	addw	sp,#4
2368  0092               L443:
2369                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2371  0092 7b07          	ld	a,(OFST+7,sp)
2372  0094 a110          	cp	a,#16
2373  0096 2403          	jruge	L643
2374  0098 4f            	clr	a
2375  0099 2010          	jra	L053
2376  009b               L643:
2377  009b ae01b2        	ldw	x,#434
2378  009e 89            	pushw	x
2379  009f ae0000        	ldw	x,#0
2380  00a2 89            	pushw	x
2381  00a3 ae0000        	ldw	x,#L101
2382  00a6 cd0000        	call	_assert_failed
2384  00a9 5b04          	addw	sp,#4
2385  00ab               L053:
2386                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2388  00ab 0d01          	tnz	(OFST+1,sp)
2389  00ad 2614          	jrne	L176
2390                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2390                     ; 440                (uint8_t)TIM1_ICSelection,
2390                     ; 441                (uint8_t)TIM1_ICFilter);
2392  00af 7b07          	ld	a,(OFST+7,sp)
2393  00b1 88            	push	a
2394  00b2 7b06          	ld	a,(OFST+6,sp)
2395  00b4 97            	ld	xl,a
2396  00b5 7b03          	ld	a,(OFST+3,sp)
2397  00b7 95            	ld	xh,a
2398  00b8 cd0000        	call	L3_TI1_Config
2400  00bb 84            	pop	a
2401                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2403  00bc 7b06          	ld	a,(OFST+6,sp)
2404  00be cd0000        	call	_TIM1_SetIC1Prescaler
2407  00c1 2046          	jra	L376
2408  00c3               L176:
2409                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2411  00c3 7b01          	ld	a,(OFST+1,sp)
2412  00c5 a101          	cp	a,#1
2413  00c7 2614          	jrne	L576
2414                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2414                     ; 449                (uint8_t)TIM1_ICSelection,
2414                     ; 450                (uint8_t)TIM1_ICFilter);
2416  00c9 7b07          	ld	a,(OFST+7,sp)
2417  00cb 88            	push	a
2418  00cc 7b06          	ld	a,(OFST+6,sp)
2419  00ce 97            	ld	xl,a
2420  00cf 7b03          	ld	a,(OFST+3,sp)
2421  00d1 95            	ld	xh,a
2422  00d2 cd0000        	call	L5_TI2_Config
2424  00d5 84            	pop	a
2425                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2427  00d6 7b06          	ld	a,(OFST+6,sp)
2428  00d8 cd0000        	call	_TIM1_SetIC2Prescaler
2431  00db 202c          	jra	L376
2432  00dd               L576:
2433                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2435  00dd 7b01          	ld	a,(OFST+1,sp)
2436  00df a102          	cp	a,#2
2437  00e1 2614          	jrne	L107
2438                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2438                     ; 458                (uint8_t)TIM1_ICSelection,
2438                     ; 459                (uint8_t)TIM1_ICFilter);
2440  00e3 7b07          	ld	a,(OFST+7,sp)
2441  00e5 88            	push	a
2442  00e6 7b06          	ld	a,(OFST+6,sp)
2443  00e8 97            	ld	xl,a
2444  00e9 7b03          	ld	a,(OFST+3,sp)
2445  00eb 95            	ld	xh,a
2446  00ec cd0000        	call	L7_TI3_Config
2448  00ef 84            	pop	a
2449                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2451  00f0 7b06          	ld	a,(OFST+6,sp)
2452  00f2 cd0000        	call	_TIM1_SetIC3Prescaler
2455  00f5 2012          	jra	L376
2456  00f7               L107:
2457                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2457                     ; 467                (uint8_t)TIM1_ICSelection,
2457                     ; 468                (uint8_t)TIM1_ICFilter);
2459  00f7 7b07          	ld	a,(OFST+7,sp)
2460  00f9 88            	push	a
2461  00fa 7b06          	ld	a,(OFST+6,sp)
2462  00fc 97            	ld	xl,a
2463  00fd 7b03          	ld	a,(OFST+3,sp)
2464  00ff 95            	ld	xh,a
2465  0100 cd0000        	call	L11_TI4_Config
2467  0103 84            	pop	a
2468                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2470  0104 7b06          	ld	a,(OFST+6,sp)
2471  0106 cd0000        	call	_TIM1_SetIC4Prescaler
2473  0109               L376:
2474                     ; 472 }
2477  0109 85            	popw	x
2478  010a 81            	ret
2575                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2575                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2575                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2575                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2575                     ; 492                      uint8_t TIM1_ICFilter)
2575                     ; 493 {
2576                     .text:	section	.text,new
2577  0000               _TIM1_PWMIConfig:
2579  0000 89            	pushw	x
2580  0001 89            	pushw	x
2581       00000002      OFST:	set	2
2584                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2586                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2588                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2590  0002 9e            	ld	a,xh
2591  0003 4d            	tnz	a
2592  0004 2705          	jreq	L653
2593  0006 9e            	ld	a,xh
2594  0007 a101          	cp	a,#1
2595  0009 2603          	jrne	L453
2596  000b               L653:
2597  000b 4f            	clr	a
2598  000c 2010          	jra	L063
2599  000e               L453:
2600  000e ae01f2        	ldw	x,#498
2601  0011 89            	pushw	x
2602  0012 ae0000        	ldw	x,#0
2603  0015 89            	pushw	x
2604  0016 ae0000        	ldw	x,#L101
2605  0019 cd0000        	call	_assert_failed
2607  001c 5b04          	addw	sp,#4
2608  001e               L063:
2609                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2611  001e 0d04          	tnz	(OFST+2,sp)
2612  0020 2706          	jreq	L463
2613  0022 7b04          	ld	a,(OFST+2,sp)
2614  0024 a101          	cp	a,#1
2615  0026 2603          	jrne	L263
2616  0028               L463:
2617  0028 4f            	clr	a
2618  0029 2010          	jra	L663
2619  002b               L263:
2620  002b ae01f3        	ldw	x,#499
2621  002e 89            	pushw	x
2622  002f ae0000        	ldw	x,#0
2623  0032 89            	pushw	x
2624  0033 ae0000        	ldw	x,#L101
2625  0036 cd0000        	call	_assert_failed
2627  0039 5b04          	addw	sp,#4
2628  003b               L663:
2629                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2631  003b 7b07          	ld	a,(OFST+5,sp)
2632  003d a101          	cp	a,#1
2633  003f 270c          	jreq	L273
2634  0041 7b07          	ld	a,(OFST+5,sp)
2635  0043 a102          	cp	a,#2
2636  0045 2706          	jreq	L273
2637  0047 7b07          	ld	a,(OFST+5,sp)
2638  0049 a103          	cp	a,#3
2639  004b 2603          	jrne	L073
2640  004d               L273:
2641  004d 4f            	clr	a
2642  004e 2010          	jra	L473
2643  0050               L073:
2644  0050 ae01f4        	ldw	x,#500
2645  0053 89            	pushw	x
2646  0054 ae0000        	ldw	x,#0
2647  0057 89            	pushw	x
2648  0058 ae0000        	ldw	x,#L101
2649  005b cd0000        	call	_assert_failed
2651  005e 5b04          	addw	sp,#4
2652  0060               L473:
2653                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2655  0060 0d08          	tnz	(OFST+6,sp)
2656  0062 2712          	jreq	L004
2657  0064 7b08          	ld	a,(OFST+6,sp)
2658  0066 a104          	cp	a,#4
2659  0068 270c          	jreq	L004
2660  006a 7b08          	ld	a,(OFST+6,sp)
2661  006c a108          	cp	a,#8
2662  006e 2706          	jreq	L004
2663  0070 7b08          	ld	a,(OFST+6,sp)
2664  0072 a10c          	cp	a,#12
2665  0074 2603          	jrne	L673
2666  0076               L004:
2667  0076 4f            	clr	a
2668  0077 2010          	jra	L204
2669  0079               L673:
2670  0079 ae01f5        	ldw	x,#501
2671  007c 89            	pushw	x
2672  007d ae0000        	ldw	x,#0
2673  0080 89            	pushw	x
2674  0081 ae0000        	ldw	x,#L101
2675  0084 cd0000        	call	_assert_failed
2677  0087 5b04          	addw	sp,#4
2678  0089               L204:
2679                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2681  0089 7b04          	ld	a,(OFST+2,sp)
2682  008b a101          	cp	a,#1
2683  008d 2706          	jreq	L357
2684                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2686  008f a601          	ld	a,#1
2687  0091 6b01          	ld	(OFST-1,sp),a
2689  0093 2002          	jra	L557
2690  0095               L357:
2691                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2693  0095 0f01          	clr	(OFST-1,sp)
2694  0097               L557:
2695                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2697  0097 7b07          	ld	a,(OFST+5,sp)
2698  0099 a101          	cp	a,#1
2699  009b 2606          	jrne	L757
2700                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2702  009d a602          	ld	a,#2
2703  009f 6b02          	ld	(OFST+0,sp),a
2705  00a1 2004          	jra	L167
2706  00a3               L757:
2707                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2709  00a3 a601          	ld	a,#1
2710  00a5 6b02          	ld	(OFST+0,sp),a
2711  00a7               L167:
2712                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2714  00a7 0d03          	tnz	(OFST+1,sp)
2715  00a9 2626          	jrne	L367
2716                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2716                     ; 527                (uint8_t)TIM1_ICFilter);
2718  00ab 7b09          	ld	a,(OFST+7,sp)
2719  00ad 88            	push	a
2720  00ae 7b08          	ld	a,(OFST+6,sp)
2721  00b0 97            	ld	xl,a
2722  00b1 7b05          	ld	a,(OFST+3,sp)
2723  00b3 95            	ld	xh,a
2724  00b4 cd0000        	call	L3_TI1_Config
2726  00b7 84            	pop	a
2727                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2729  00b8 7b08          	ld	a,(OFST+6,sp)
2730  00ba cd0000        	call	_TIM1_SetIC1Prescaler
2732                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2734  00bd 7b09          	ld	a,(OFST+7,sp)
2735  00bf 88            	push	a
2736  00c0 7b03          	ld	a,(OFST+1,sp)
2737  00c2 97            	ld	xl,a
2738  00c3 7b02          	ld	a,(OFST+0,sp)
2739  00c5 95            	ld	xh,a
2740  00c6 cd0000        	call	L5_TI2_Config
2742  00c9 84            	pop	a
2743                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2745  00ca 7b08          	ld	a,(OFST+6,sp)
2746  00cc cd0000        	call	_TIM1_SetIC2Prescaler
2749  00cf 2024          	jra	L567
2750  00d1               L367:
2751                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2751                     ; 542                (uint8_t)TIM1_ICFilter);
2753  00d1 7b09          	ld	a,(OFST+7,sp)
2754  00d3 88            	push	a
2755  00d4 7b08          	ld	a,(OFST+6,sp)
2756  00d6 97            	ld	xl,a
2757  00d7 7b05          	ld	a,(OFST+3,sp)
2758  00d9 95            	ld	xh,a
2759  00da cd0000        	call	L5_TI2_Config
2761  00dd 84            	pop	a
2762                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2764  00de 7b08          	ld	a,(OFST+6,sp)
2765  00e0 cd0000        	call	_TIM1_SetIC2Prescaler
2767                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2769  00e3 7b09          	ld	a,(OFST+7,sp)
2770  00e5 88            	push	a
2771  00e6 7b03          	ld	a,(OFST+1,sp)
2772  00e8 97            	ld	xl,a
2773  00e9 7b02          	ld	a,(OFST+0,sp)
2774  00eb 95            	ld	xh,a
2775  00ec cd0000        	call	L3_TI1_Config
2777  00ef 84            	pop	a
2778                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2780  00f0 7b08          	ld	a,(OFST+6,sp)
2781  00f2 cd0000        	call	_TIM1_SetIC1Prescaler
2783  00f5               L567:
2784                     ; 553 }
2787  00f5 5b04          	addw	sp,#4
2788  00f7 81            	ret
2844                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2844                     ; 562 {
2845                     .text:	section	.text,new
2846  0000               _TIM1_Cmd:
2848  0000 88            	push	a
2849       00000000      OFST:	set	0
2852                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2854  0001 4d            	tnz	a
2855  0002 2704          	jreq	L014
2856  0004 a101          	cp	a,#1
2857  0006 2603          	jrne	L604
2858  0008               L014:
2859  0008 4f            	clr	a
2860  0009 2010          	jra	L214
2861  000b               L604:
2862  000b ae0234        	ldw	x,#564
2863  000e 89            	pushw	x
2864  000f ae0000        	ldw	x,#0
2865  0012 89            	pushw	x
2866  0013 ae0000        	ldw	x,#L101
2867  0016 cd0000        	call	_assert_failed
2869  0019 5b04          	addw	sp,#4
2870  001b               L214:
2871                     ; 567   if (NewState != DISABLE)
2873  001b 0d01          	tnz	(OFST+1,sp)
2874  001d 2706          	jreq	L5101
2875                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2877  001f 72105250      	bset	21072,#0
2879  0023 2004          	jra	L7101
2880  0025               L5101:
2881                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2883  0025 72115250      	bres	21072,#0
2884  0029               L7101:
2885                     ; 575 }
2888  0029 84            	pop	a
2889  002a 81            	ret
2926                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2926                     ; 584 {
2927                     .text:	section	.text,new
2928  0000               _TIM1_CtrlPWMOutputs:
2930  0000 88            	push	a
2931       00000000      OFST:	set	0
2934                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2936  0001 4d            	tnz	a
2937  0002 2704          	jreq	L024
2938  0004 a101          	cp	a,#1
2939  0006 2603          	jrne	L614
2940  0008               L024:
2941  0008 4f            	clr	a
2942  0009 2010          	jra	L224
2943  000b               L614:
2944  000b ae024a        	ldw	x,#586
2945  000e 89            	pushw	x
2946  000f ae0000        	ldw	x,#0
2947  0012 89            	pushw	x
2948  0013 ae0000        	ldw	x,#L101
2949  0016 cd0000        	call	_assert_failed
2951  0019 5b04          	addw	sp,#4
2952  001b               L224:
2953                     ; 590   if (NewState != DISABLE)
2955  001b 0d01          	tnz	(OFST+1,sp)
2956  001d 2706          	jreq	L7301
2957                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2959  001f 721e526d      	bset	21101,#7
2961  0023 2004          	jra	L1401
2962  0025               L7301:
2963                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2965  0025 721f526d      	bres	21101,#7
2966  0029               L1401:
2967                     ; 598 }
2970  0029 84            	pop	a
2971  002a 81            	ret
3079                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3079                     ; 618 {
3080                     .text:	section	.text,new
3081  0000               _TIM1_ITConfig:
3083  0000 89            	pushw	x
3084       00000000      OFST:	set	0
3087                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
3089  0001 9e            	ld	a,xh
3090  0002 4d            	tnz	a
3091  0003 2703          	jreq	L624
3092  0005 4f            	clr	a
3093  0006 2010          	jra	L034
3094  0008               L624:
3095  0008 ae026c        	ldw	x,#620
3096  000b 89            	pushw	x
3097  000c ae0000        	ldw	x,#0
3098  000f 89            	pushw	x
3099  0010 ae0000        	ldw	x,#L101
3100  0013 cd0000        	call	_assert_failed
3102  0016 5b04          	addw	sp,#4
3103  0018               L034:
3104                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3106  0018 0d02          	tnz	(OFST+2,sp)
3107  001a 2706          	jreq	L434
3108  001c 7b02          	ld	a,(OFST+2,sp)
3109  001e a101          	cp	a,#1
3110  0020 2603          	jrne	L234
3111  0022               L434:
3112  0022 4f            	clr	a
3113  0023 2010          	jra	L634
3114  0025               L234:
3115  0025 ae026d        	ldw	x,#621
3116  0028 89            	pushw	x
3117  0029 ae0000        	ldw	x,#0
3118  002c 89            	pushw	x
3119  002d ae0000        	ldw	x,#L101
3120  0030 cd0000        	call	_assert_failed
3122  0033 5b04          	addw	sp,#4
3123  0035               L634:
3124                     ; 623   if (NewState != DISABLE)
3126  0035 0d02          	tnz	(OFST+2,sp)
3127  0037 270a          	jreq	L1111
3128                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
3130  0039 c65254        	ld	a,21076
3131  003c 1a01          	or	a,(OFST+1,sp)
3132  003e c75254        	ld	21076,a
3134  0041 2009          	jra	L3111
3135  0043               L1111:
3136                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3138  0043 7b01          	ld	a,(OFST+1,sp)
3139  0045 43            	cpl	a
3140  0046 c45254        	and	a,21076
3141  0049 c75254        	ld	21076,a
3142  004c               L3111:
3143                     ; 633 }
3146  004c 85            	popw	x
3147  004d 81            	ret
3171                     ; 640 void TIM1_InternalClockConfig(void)
3171                     ; 641 {
3172                     .text:	section	.text,new
3173  0000               _TIM1_InternalClockConfig:
3177                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3179  0000 c65252        	ld	a,21074
3180  0003 a4f8          	and	a,#248
3181  0005 c75252        	ld	21074,a
3182                     ; 644 }
3185  0008 81            	ret
3303                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3303                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3303                     ; 664                               uint8_t ExtTRGFilter)
3303                     ; 665 {
3304                     .text:	section	.text,new
3305  0000               _TIM1_ETRClockMode1Config:
3307  0000 89            	pushw	x
3308       00000000      OFST:	set	0
3311                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3313  0001 9e            	ld	a,xh
3314  0002 4d            	tnz	a
3315  0003 270f          	jreq	L644
3316  0005 9e            	ld	a,xh
3317  0006 a110          	cp	a,#16
3318  0008 270a          	jreq	L644
3319  000a 9e            	ld	a,xh
3320  000b a120          	cp	a,#32
3321  000d 2705          	jreq	L644
3322  000f 9e            	ld	a,xh
3323  0010 a130          	cp	a,#48
3324  0012 2603          	jrne	L444
3325  0014               L644:
3326  0014 4f            	clr	a
3327  0015 2010          	jra	L054
3328  0017               L444:
3329  0017 ae029b        	ldw	x,#667
3330  001a 89            	pushw	x
3331  001b ae0000        	ldw	x,#0
3332  001e 89            	pushw	x
3333  001f ae0000        	ldw	x,#L101
3334  0022 cd0000        	call	_assert_failed
3336  0025 5b04          	addw	sp,#4
3337  0027               L054:
3338                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3340  0027 7b02          	ld	a,(OFST+2,sp)
3341  0029 a180          	cp	a,#128
3342  002b 2704          	jreq	L454
3343  002d 0d02          	tnz	(OFST+2,sp)
3344  002f 2603          	jrne	L254
3345  0031               L454:
3346  0031 4f            	clr	a
3347  0032 2010          	jra	L654
3348  0034               L254:
3349  0034 ae029c        	ldw	x,#668
3350  0037 89            	pushw	x
3351  0038 ae0000        	ldw	x,#0
3352  003b 89            	pushw	x
3353  003c ae0000        	ldw	x,#L101
3354  003f cd0000        	call	_assert_failed
3356  0042 5b04          	addw	sp,#4
3357  0044               L654:
3358                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3360  0044 7b05          	ld	a,(OFST+5,sp)
3361  0046 88            	push	a
3362  0047 7b03          	ld	a,(OFST+3,sp)
3363  0049 97            	ld	xl,a
3364  004a 7b02          	ld	a,(OFST+2,sp)
3365  004c 95            	ld	xh,a
3366  004d cd0000        	call	_TIM1_ETRConfig
3368  0050 84            	pop	a
3369                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3369                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3371  0051 c65252        	ld	a,21074
3372  0054 a488          	and	a,#136
3373  0056 aa77          	or	a,#119
3374  0058 c75252        	ld	21074,a
3375                     ; 676 }
3378  005b 85            	popw	x
3379  005c 81            	ret
3438                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3438                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3438                     ; 696                               uint8_t ExtTRGFilter)
3438                     ; 697 {
3439                     .text:	section	.text,new
3440  0000               _TIM1_ETRClockMode2Config:
3442  0000 89            	pushw	x
3443       00000000      OFST:	set	0
3446                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3448  0001 9e            	ld	a,xh
3449  0002 4d            	tnz	a
3450  0003 270f          	jreq	L464
3451  0005 9e            	ld	a,xh
3452  0006 a110          	cp	a,#16
3453  0008 270a          	jreq	L464
3454  000a 9e            	ld	a,xh
3455  000b a120          	cp	a,#32
3456  000d 2705          	jreq	L464
3457  000f 9e            	ld	a,xh
3458  0010 a130          	cp	a,#48
3459  0012 2603          	jrne	L264
3460  0014               L464:
3461  0014 4f            	clr	a
3462  0015 2010          	jra	L664
3463  0017               L264:
3464  0017 ae02bb        	ldw	x,#699
3465  001a 89            	pushw	x
3466  001b ae0000        	ldw	x,#0
3467  001e 89            	pushw	x
3468  001f ae0000        	ldw	x,#L101
3469  0022 cd0000        	call	_assert_failed
3471  0025 5b04          	addw	sp,#4
3472  0027               L664:
3473                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3475  0027 7b02          	ld	a,(OFST+2,sp)
3476  0029 a180          	cp	a,#128
3477  002b 2704          	jreq	L274
3478  002d 0d02          	tnz	(OFST+2,sp)
3479  002f 2603          	jrne	L074
3480  0031               L274:
3481  0031 4f            	clr	a
3482  0032 2010          	jra	L474
3483  0034               L074:
3484  0034 ae02bc        	ldw	x,#700
3485  0037 89            	pushw	x
3486  0038 ae0000        	ldw	x,#0
3487  003b 89            	pushw	x
3488  003c ae0000        	ldw	x,#L101
3489  003f cd0000        	call	_assert_failed
3491  0042 5b04          	addw	sp,#4
3492  0044               L474:
3493                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3495  0044 7b05          	ld	a,(OFST+5,sp)
3496  0046 88            	push	a
3497  0047 7b03          	ld	a,(OFST+3,sp)
3498  0049 97            	ld	xl,a
3499  004a 7b02          	ld	a,(OFST+2,sp)
3500  004c 95            	ld	xh,a
3501  004d cd0000        	call	_TIM1_ETRConfig
3503  0050 84            	pop	a
3504                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3506  0051 721c5253      	bset	21075,#6
3507                     ; 707 }
3510  0055 85            	popw	x
3511  0056 81            	ret
3568                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3568                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3568                     ; 727                     uint8_t ExtTRGFilter)
3568                     ; 728 {
3569                     .text:	section	.text,new
3570  0000               _TIM1_ETRConfig:
3572  0000 89            	pushw	x
3573       00000000      OFST:	set	0
3576                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3578  0001 7b05          	ld	a,(OFST+5,sp)
3579  0003 a110          	cp	a,#16
3580  0005 2403          	jruge	L005
3581  0007 4f            	clr	a
3582  0008 2010          	jra	L205
3583  000a               L005:
3584  000a ae02da        	ldw	x,#730
3585  000d 89            	pushw	x
3586  000e ae0000        	ldw	x,#0
3587  0011 89            	pushw	x
3588  0012 ae0000        	ldw	x,#L101
3589  0015 cd0000        	call	_assert_failed
3591  0018 5b04          	addw	sp,#4
3592  001a               L205:
3593                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3593                     ; 733                          (uint8_t)ExtTRGFilter );
3595  001a 7b01          	ld	a,(OFST+1,sp)
3596  001c 1a02          	or	a,(OFST+2,sp)
3597  001e 1a05          	or	a,(OFST+5,sp)
3598  0020 ca5253        	or	a,21075
3599  0023 c75253        	ld	21075,a
3600                     ; 734 }
3603  0026 85            	popw	x
3604  0027 81            	ret
3694                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3694                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3694                     ; 753                                  uint8_t ICFilter)
3694                     ; 754 {
3695                     .text:	section	.text,new
3696  0000               _TIM1_TIxExternalClockConfig:
3698  0000 89            	pushw	x
3699       00000000      OFST:	set	0
3702                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3704  0001 9e            	ld	a,xh
3705  0002 a140          	cp	a,#64
3706  0004 270a          	jreq	L015
3707  0006 9e            	ld	a,xh
3708  0007 a160          	cp	a,#96
3709  0009 2705          	jreq	L015
3710  000b 9e            	ld	a,xh
3711  000c a150          	cp	a,#80
3712  000e 2603          	jrne	L605
3713  0010               L015:
3714  0010 4f            	clr	a
3715  0011 2010          	jra	L215
3716  0013               L605:
3717  0013 ae02f4        	ldw	x,#756
3718  0016 89            	pushw	x
3719  0017 ae0000        	ldw	x,#0
3720  001a 89            	pushw	x
3721  001b ae0000        	ldw	x,#L101
3722  001e cd0000        	call	_assert_failed
3724  0021 5b04          	addw	sp,#4
3725  0023               L215:
3726                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3728  0023 0d02          	tnz	(OFST+2,sp)
3729  0025 2706          	jreq	L615
3730  0027 7b02          	ld	a,(OFST+2,sp)
3731  0029 a101          	cp	a,#1
3732  002b 2603          	jrne	L415
3733  002d               L615:
3734  002d 4f            	clr	a
3735  002e 2010          	jra	L025
3736  0030               L415:
3737  0030 ae02f5        	ldw	x,#757
3738  0033 89            	pushw	x
3739  0034 ae0000        	ldw	x,#0
3740  0037 89            	pushw	x
3741  0038 ae0000        	ldw	x,#L101
3742  003b cd0000        	call	_assert_failed
3744  003e 5b04          	addw	sp,#4
3745  0040               L025:
3746                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3748  0040 7b05          	ld	a,(OFST+5,sp)
3749  0042 a110          	cp	a,#16
3750  0044 2403          	jruge	L225
3751  0046 4f            	clr	a
3752  0047 2010          	jra	L425
3753  0049               L225:
3754  0049 ae02f6        	ldw	x,#758
3755  004c 89            	pushw	x
3756  004d ae0000        	ldw	x,#0
3757  0050 89            	pushw	x
3758  0051 ae0000        	ldw	x,#L101
3759  0054 cd0000        	call	_assert_failed
3761  0057 5b04          	addw	sp,#4
3762  0059               L425:
3763                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3765  0059 7b01          	ld	a,(OFST+1,sp)
3766  005b a160          	cp	a,#96
3767  005d 260f          	jrne	L3131
3768                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3770  005f 7b05          	ld	a,(OFST+5,sp)
3771  0061 88            	push	a
3772  0062 ae0001        	ldw	x,#1
3773  0065 7b03          	ld	a,(OFST+3,sp)
3774  0067 95            	ld	xh,a
3775  0068 cd0000        	call	L5_TI2_Config
3777  006b 84            	pop	a
3779  006c 200d          	jra	L5131
3780  006e               L3131:
3781                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3783  006e 7b05          	ld	a,(OFST+5,sp)
3784  0070 88            	push	a
3785  0071 ae0001        	ldw	x,#1
3786  0074 7b03          	ld	a,(OFST+3,sp)
3787  0076 95            	ld	xh,a
3788  0077 cd0000        	call	L3_TI1_Config
3790  007a 84            	pop	a
3791  007b               L5131:
3792                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3794  007b 7b01          	ld	a,(OFST+1,sp)
3795  007d cd0000        	call	_TIM1_SelectInputTrigger
3797                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3799  0080 c65252        	ld	a,21074
3800  0083 aa07          	or	a,#7
3801  0085 c75252        	ld	21074,a
3802                     ; 775 }
3805  0088 85            	popw	x
3806  0089 81            	ret
3892                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3892                     ; 788 {
3893                     .text:	section	.text,new
3894  0000               _TIM1_SelectInputTrigger:
3896  0000 88            	push	a
3897       00000000      OFST:	set	0
3900                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3902  0001 a140          	cp	a,#64
3903  0003 2713          	jreq	L235
3904  0005 a150          	cp	a,#80
3905  0007 270f          	jreq	L235
3906  0009 a160          	cp	a,#96
3907  000b 270b          	jreq	L235
3908  000d a170          	cp	a,#112
3909  000f 2707          	jreq	L235
3910  0011 a130          	cp	a,#48
3911  0013 2703          	jreq	L235
3912  0015 4d            	tnz	a
3913  0016 2603          	jrne	L035
3914  0018               L235:
3915  0018 4f            	clr	a
3916  0019 2010          	jra	L435
3917  001b               L035:
3918  001b ae0316        	ldw	x,#790
3919  001e 89            	pushw	x
3920  001f ae0000        	ldw	x,#0
3921  0022 89            	pushw	x
3922  0023 ae0000        	ldw	x,#L101
3923  0026 cd0000        	call	_assert_failed
3925  0029 5b04          	addw	sp,#4
3926  002b               L435:
3927                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3929  002b c65252        	ld	a,21074
3930  002e a48f          	and	a,#143
3931  0030 1a01          	or	a,(OFST+1,sp)
3932  0032 c75252        	ld	21074,a
3933                     ; 794 }
3936  0035 84            	pop	a
3937  0036 81            	ret
3974                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3974                     ; 804 {
3975                     .text:	section	.text,new
3976  0000               _TIM1_UpdateDisableConfig:
3978  0000 88            	push	a
3979       00000000      OFST:	set	0
3982                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3984  0001 4d            	tnz	a
3985  0002 2704          	jreq	L245
3986  0004 a101          	cp	a,#1
3987  0006 2603          	jrne	L045
3988  0008               L245:
3989  0008 4f            	clr	a
3990  0009 2010          	jra	L445
3991  000b               L045:
3992  000b ae0326        	ldw	x,#806
3993  000e 89            	pushw	x
3994  000f ae0000        	ldw	x,#0
3995  0012 89            	pushw	x
3996  0013 ae0000        	ldw	x,#L101
3997  0016 cd0000        	call	_assert_failed
3999  0019 5b04          	addw	sp,#4
4000  001b               L445:
4001                     ; 809   if (NewState != DISABLE)
4003  001b 0d01          	tnz	(OFST+1,sp)
4004  001d 2706          	jreq	L3731
4005                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
4007  001f 72125250      	bset	21072,#1
4009  0023 2004          	jra	L5731
4010  0025               L3731:
4011                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
4013  0025 72135250      	bres	21072,#1
4014  0029               L5731:
4015                     ; 817 }
4018  0029 84            	pop	a
4019  002a 81            	ret
4078                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4078                     ; 828 {
4079                     .text:	section	.text,new
4080  0000               _TIM1_UpdateRequestConfig:
4082  0000 88            	push	a
4083       00000000      OFST:	set	0
4086                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4088  0001 4d            	tnz	a
4089  0002 2704          	jreq	L255
4090  0004 a101          	cp	a,#1
4091  0006 2603          	jrne	L055
4092  0008               L255:
4093  0008 4f            	clr	a
4094  0009 2010          	jra	L455
4095  000b               L055:
4096  000b ae033e        	ldw	x,#830
4097  000e 89            	pushw	x
4098  000f ae0000        	ldw	x,#0
4099  0012 89            	pushw	x
4100  0013 ae0000        	ldw	x,#L101
4101  0016 cd0000        	call	_assert_failed
4103  0019 5b04          	addw	sp,#4
4104  001b               L455:
4105                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4107  001b 0d01          	tnz	(OFST+1,sp)
4108  001d 2706          	jreq	L5241
4109                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
4111  001f 72145250      	bset	21072,#2
4113  0023 2004          	jra	L7241
4114  0025               L5241:
4115                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4117  0025 72155250      	bres	21072,#2
4118  0029               L7241:
4119                     ; 841 }
4122  0029 84            	pop	a
4123  002a 81            	ret
4160                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
4160                     ; 850 {
4161                     .text:	section	.text,new
4162  0000               _TIM1_SelectHallSensor:
4164  0000 88            	push	a
4165       00000000      OFST:	set	0
4168                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4170  0001 4d            	tnz	a
4171  0002 2704          	jreq	L265
4172  0004 a101          	cp	a,#1
4173  0006 2603          	jrne	L065
4174  0008               L265:
4175  0008 4f            	clr	a
4176  0009 2010          	jra	L465
4177  000b               L065:
4178  000b ae0354        	ldw	x,#852
4179  000e 89            	pushw	x
4180  000f ae0000        	ldw	x,#0
4181  0012 89            	pushw	x
4182  0013 ae0000        	ldw	x,#L101
4183  0016 cd0000        	call	_assert_failed
4185  0019 5b04          	addw	sp,#4
4186  001b               L465:
4187                     ; 855   if (NewState != DISABLE)
4189  001b 0d01          	tnz	(OFST+1,sp)
4190  001d 2706          	jreq	L7441
4191                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
4193  001f 721e5251      	bset	21073,#7
4195  0023 2004          	jra	L1541
4196  0025               L7441:
4197                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4199  0025 721f5251      	bres	21073,#7
4200  0029               L1541:
4201                     ; 863 }
4204  0029 84            	pop	a
4205  002a 81            	ret
4263                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4263                     ; 874 {
4264                     .text:	section	.text,new
4265  0000               _TIM1_SelectOnePulseMode:
4267  0000 88            	push	a
4268       00000000      OFST:	set	0
4271                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4273  0001 a101          	cp	a,#1
4274  0003 2703          	jreq	L275
4275  0005 4d            	tnz	a
4276  0006 2603          	jrne	L075
4277  0008               L275:
4278  0008 4f            	clr	a
4279  0009 2010          	jra	L475
4280  000b               L075:
4281  000b ae036c        	ldw	x,#876
4282  000e 89            	pushw	x
4283  000f ae0000        	ldw	x,#0
4284  0012 89            	pushw	x
4285  0013 ae0000        	ldw	x,#L101
4286  0016 cd0000        	call	_assert_failed
4288  0019 5b04          	addw	sp,#4
4289  001b               L475:
4290                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4292  001b 0d01          	tnz	(OFST+1,sp)
4293  001d 2706          	jreq	L1051
4294                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4296  001f 72165250      	bset	21072,#3
4298  0023 2004          	jra	L3051
4299  0025               L1051:
4300                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4302  0025 72175250      	bres	21072,#3
4303  0029               L3051:
4304                     ; 888 }
4307  0029 84            	pop	a
4308  002a 81            	ret
4407                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4407                     ; 904 {
4408                     .text:	section	.text,new
4409  0000               _TIM1_SelectOutputTrigger:
4411  0000 88            	push	a
4412       00000000      OFST:	set	0
4415                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4417  0001 4d            	tnz	a
4418  0002 2718          	jreq	L206
4419  0004 a110          	cp	a,#16
4420  0006 2714          	jreq	L206
4421  0008 a120          	cp	a,#32
4422  000a 2710          	jreq	L206
4423  000c a130          	cp	a,#48
4424  000e 270c          	jreq	L206
4425  0010 a140          	cp	a,#64
4426  0012 2708          	jreq	L206
4427  0014 a150          	cp	a,#80
4428  0016 2704          	jreq	L206
4429  0018 a160          	cp	a,#96
4430  001a 2603          	jrne	L006
4431  001c               L206:
4432  001c 4f            	clr	a
4433  001d 2010          	jra	L406
4434  001f               L006:
4435  001f ae038a        	ldw	x,#906
4436  0022 89            	pushw	x
4437  0023 ae0000        	ldw	x,#0
4438  0026 89            	pushw	x
4439  0027 ae0000        	ldw	x,#L101
4440  002a cd0000        	call	_assert_failed
4442  002d 5b04          	addw	sp,#4
4443  002f               L406:
4444                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4444                     ; 910                         (uint8_t) TIM1_TRGOSource);
4446  002f c65251        	ld	a,21073
4447  0032 a48f          	and	a,#143
4448  0034 1a01          	or	a,(OFST+1,sp)
4449  0036 c75251        	ld	21073,a
4450                     ; 911 }
4453  0039 84            	pop	a
4454  003a 81            	ret
4529                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4529                     ; 924 {
4530                     .text:	section	.text,new
4531  0000               _TIM1_SelectSlaveMode:
4533  0000 88            	push	a
4534       00000000      OFST:	set	0
4537                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4539  0001 a104          	cp	a,#4
4540  0003 270c          	jreq	L216
4541  0005 a105          	cp	a,#5
4542  0007 2708          	jreq	L216
4543  0009 a106          	cp	a,#6
4544  000b 2704          	jreq	L216
4545  000d a107          	cp	a,#7
4546  000f 2603          	jrne	L016
4547  0011               L216:
4548  0011 4f            	clr	a
4549  0012 2010          	jra	L416
4550  0014               L016:
4551  0014 ae039e        	ldw	x,#926
4552  0017 89            	pushw	x
4553  0018 ae0000        	ldw	x,#0
4554  001b 89            	pushw	x
4555  001c ae0000        	ldw	x,#L101
4556  001f cd0000        	call	_assert_failed
4558  0022 5b04          	addw	sp,#4
4559  0024               L416:
4560                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4560                     ; 930                          (uint8_t)TIM1_SlaveMode);
4562  0024 c65252        	ld	a,21074
4563  0027 a4f8          	and	a,#248
4564  0029 1a01          	or	a,(OFST+1,sp)
4565  002b c75252        	ld	21074,a
4566                     ; 931 }
4569  002e 84            	pop	a
4570  002f 81            	ret
4607                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4607                     ; 940 {
4608                     .text:	section	.text,new
4609  0000               _TIM1_SelectMasterSlaveMode:
4611  0000 88            	push	a
4612       00000000      OFST:	set	0
4615                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4617  0001 4d            	tnz	a
4618  0002 2704          	jreq	L226
4619  0004 a101          	cp	a,#1
4620  0006 2603          	jrne	L026
4621  0008               L226:
4622  0008 4f            	clr	a
4623  0009 2010          	jra	L426
4624  000b               L026:
4625  000b ae03ae        	ldw	x,#942
4626  000e 89            	pushw	x
4627  000f ae0000        	ldw	x,#0
4628  0012 89            	pushw	x
4629  0013 ae0000        	ldw	x,#L101
4630  0016 cd0000        	call	_assert_failed
4632  0019 5b04          	addw	sp,#4
4633  001b               L426:
4634                     ; 945   if (NewState != DISABLE)
4636  001b 0d01          	tnz	(OFST+1,sp)
4637  001d 2706          	jreq	L5161
4638                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4640  001f 721e5252      	bset	21074,#7
4642  0023 2004          	jra	L7161
4643  0025               L5161:
4644                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4646  0025 721f5252      	bres	21074,#7
4647  0029               L7161:
4648                     ; 953 }
4651  0029 84            	pop	a
4652  002a 81            	ret
4739                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4739                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4739                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4739                     ; 978 {
4740                     .text:	section	.text,new
4741  0000               _TIM1_EncoderInterfaceConfig:
4743  0000 89            	pushw	x
4744       00000000      OFST:	set	0
4747                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4749  0001 9e            	ld	a,xh
4750  0002 a101          	cp	a,#1
4751  0004 270a          	jreq	L236
4752  0006 9e            	ld	a,xh
4753  0007 a102          	cp	a,#2
4754  0009 2705          	jreq	L236
4755  000b 9e            	ld	a,xh
4756  000c a103          	cp	a,#3
4757  000e 2603          	jrne	L036
4758  0010               L236:
4759  0010 4f            	clr	a
4760  0011 2010          	jra	L436
4761  0013               L036:
4762  0013 ae03d4        	ldw	x,#980
4763  0016 89            	pushw	x
4764  0017 ae0000        	ldw	x,#0
4765  001a 89            	pushw	x
4766  001b ae0000        	ldw	x,#L101
4767  001e cd0000        	call	_assert_failed
4769  0021 5b04          	addw	sp,#4
4770  0023               L436:
4771                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4773  0023 0d02          	tnz	(OFST+2,sp)
4774  0025 2706          	jreq	L046
4775  0027 7b02          	ld	a,(OFST+2,sp)
4776  0029 a101          	cp	a,#1
4777  002b 2603          	jrne	L636
4778  002d               L046:
4779  002d 4f            	clr	a
4780  002e 2010          	jra	L246
4781  0030               L636:
4782  0030 ae03d5        	ldw	x,#981
4783  0033 89            	pushw	x
4784  0034 ae0000        	ldw	x,#0
4785  0037 89            	pushw	x
4786  0038 ae0000        	ldw	x,#L101
4787  003b cd0000        	call	_assert_failed
4789  003e 5b04          	addw	sp,#4
4790  0040               L246:
4791                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4793  0040 0d05          	tnz	(OFST+5,sp)
4794  0042 2706          	jreq	L646
4795  0044 7b05          	ld	a,(OFST+5,sp)
4796  0046 a101          	cp	a,#1
4797  0048 2603          	jrne	L446
4798  004a               L646:
4799  004a 4f            	clr	a
4800  004b 2010          	jra	L056
4801  004d               L446:
4802  004d ae03d6        	ldw	x,#982
4803  0050 89            	pushw	x
4804  0051 ae0000        	ldw	x,#0
4805  0054 89            	pushw	x
4806  0055 ae0000        	ldw	x,#L101
4807  0058 cd0000        	call	_assert_failed
4809  005b 5b04          	addw	sp,#4
4810  005d               L056:
4811                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4813  005d 0d02          	tnz	(OFST+2,sp)
4814  005f 2706          	jreq	L1661
4815                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4817  0061 7212525c      	bset	21084,#1
4819  0065 2004          	jra	L3661
4820  0067               L1661:
4821                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4823  0067 7213525c      	bres	21084,#1
4824  006b               L3661:
4825                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4827  006b 0d05          	tnz	(OFST+5,sp)
4828  006d 2706          	jreq	L5661
4829                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4831  006f 721a525c      	bset	21084,#5
4833  0073 2004          	jra	L7661
4834  0075               L5661:
4835                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4837  0075 721b525c      	bres	21084,#5
4838  0079               L7661:
4839                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4839                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4841  0079 c65252        	ld	a,21074
4842  007c a4f0          	and	a,#240
4843  007e 1a01          	or	a,(OFST+1,sp)
4844  0080 c75252        	ld	21074,a
4845                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4845                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4847  0083 c65258        	ld	a,21080
4848  0086 a4fc          	and	a,#252
4849  0088 aa01          	or	a,#1
4850  008a c75258        	ld	21080,a
4851                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4851                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4853  008d c65259        	ld	a,21081
4854  0090 a4fc          	and	a,#252
4855  0092 aa01          	or	a,#1
4856  0094 c75259        	ld	21081,a
4857                     ; 1011 }
4860  0097 85            	popw	x
4861  0098 81            	ret
4929                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4929                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4929                     ; 1025 {
4930                     .text:	section	.text,new
4931  0000               _TIM1_PrescalerConfig:
4933  0000 89            	pushw	x
4934       00000000      OFST:	set	0
4937                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4939  0001 0d05          	tnz	(OFST+5,sp)
4940  0003 2706          	jreq	L656
4941  0005 7b05          	ld	a,(OFST+5,sp)
4942  0007 a101          	cp	a,#1
4943  0009 2603          	jrne	L456
4944  000b               L656:
4945  000b 4f            	clr	a
4946  000c 2010          	jra	L066
4947  000e               L456:
4948  000e ae0403        	ldw	x,#1027
4949  0011 89            	pushw	x
4950  0012 ae0000        	ldw	x,#0
4951  0015 89            	pushw	x
4952  0016 ae0000        	ldw	x,#L101
4953  0019 cd0000        	call	_assert_failed
4955  001c 5b04          	addw	sp,#4
4956  001e               L066:
4957                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4959  001e 7b01          	ld	a,(OFST+1,sp)
4960  0020 c75260        	ld	21088,a
4961                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4963  0023 7b02          	ld	a,(OFST+2,sp)
4964  0025 c75261        	ld	21089,a
4965                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4967  0028 7b05          	ld	a,(OFST+5,sp)
4968  002a c75257        	ld	21079,a
4969                     ; 1035 }
4972  002d 85            	popw	x
4973  002e 81            	ret
5010                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
5010                     ; 1049 {
5011                     .text:	section	.text,new
5012  0000               _TIM1_CounterModeConfig:
5014  0000 88            	push	a
5015       00000000      OFST:	set	0
5018                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
5020  0001 4d            	tnz	a
5021  0002 2710          	jreq	L666
5022  0004 a110          	cp	a,#16
5023  0006 270c          	jreq	L666
5024  0008 a120          	cp	a,#32
5025  000a 2708          	jreq	L666
5026  000c a140          	cp	a,#64
5027  000e 2704          	jreq	L666
5028  0010 a160          	cp	a,#96
5029  0012 2603          	jrne	L466
5030  0014               L666:
5031  0014 4f            	clr	a
5032  0015 2010          	jra	L076
5033  0017               L466:
5034  0017 ae041b        	ldw	x,#1051
5035  001a 89            	pushw	x
5036  001b ae0000        	ldw	x,#0
5037  001e 89            	pushw	x
5038  001f ae0000        	ldw	x,#L101
5039  0022 cd0000        	call	_assert_failed
5041  0025 5b04          	addw	sp,#4
5042  0027               L076:
5043                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5043                     ; 1056                         | (uint8_t)TIM1_CounterMode);
5045  0027 c65250        	ld	a,21072
5046  002a a48f          	and	a,#143
5047  002c 1a01          	or	a,(OFST+1,sp)
5048  002e c75250        	ld	21072,a
5049                     ; 1057 }
5052  0031 84            	pop	a
5053  0032 81            	ret
5112                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5112                     ; 1068 {
5113                     .text:	section	.text,new
5114  0000               _TIM1_ForcedOC1Config:
5116  0000 88            	push	a
5117       00000000      OFST:	set	0
5120                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5122  0001 a150          	cp	a,#80
5123  0003 2704          	jreq	L676
5124  0005 a140          	cp	a,#64
5125  0007 2603          	jrne	L476
5126  0009               L676:
5127  0009 4f            	clr	a
5128  000a 2010          	jra	L007
5129  000c               L476:
5130  000c ae042e        	ldw	x,#1070
5131  000f 89            	pushw	x
5132  0010 ae0000        	ldw	x,#0
5133  0013 89            	pushw	x
5134  0014 ae0000        	ldw	x,#L101
5135  0017 cd0000        	call	_assert_failed
5137  001a 5b04          	addw	sp,#4
5138  001c               L007:
5139                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5139                     ; 1074                            (uint8_t)TIM1_ForcedAction);
5141  001c c65258        	ld	a,21080
5142  001f a48f          	and	a,#143
5143  0021 1a01          	or	a,(OFST+1,sp)
5144  0023 c75258        	ld	21080,a
5145                     ; 1075 }
5148  0026 84            	pop	a
5149  0027 81            	ret
5186                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5186                     ; 1086 {
5187                     .text:	section	.text,new
5188  0000               _TIM1_ForcedOC2Config:
5190  0000 88            	push	a
5191       00000000      OFST:	set	0
5194                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5196  0001 a150          	cp	a,#80
5197  0003 2704          	jreq	L607
5198  0005 a140          	cp	a,#64
5199  0007 2603          	jrne	L407
5200  0009               L607:
5201  0009 4f            	clr	a
5202  000a 2010          	jra	L017
5203  000c               L407:
5204  000c ae0440        	ldw	x,#1088
5205  000f 89            	pushw	x
5206  0010 ae0000        	ldw	x,#0
5207  0013 89            	pushw	x
5208  0014 ae0000        	ldw	x,#L101
5209  0017 cd0000        	call	_assert_failed
5211  001a 5b04          	addw	sp,#4
5212  001c               L017:
5213                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5213                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
5215  001c c65259        	ld	a,21081
5216  001f a48f          	and	a,#143
5217  0021 1a01          	or	a,(OFST+1,sp)
5218  0023 c75259        	ld	21081,a
5219                     ; 1093 }
5222  0026 84            	pop	a
5223  0027 81            	ret
5260                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5260                     ; 1105 {
5261                     .text:	section	.text,new
5262  0000               _TIM1_ForcedOC3Config:
5264  0000 88            	push	a
5265       00000000      OFST:	set	0
5268                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5270  0001 a150          	cp	a,#80
5271  0003 2704          	jreq	L617
5272  0005 a140          	cp	a,#64
5273  0007 2603          	jrne	L417
5274  0009               L617:
5275  0009 4f            	clr	a
5276  000a 2010          	jra	L027
5277  000c               L417:
5278  000c ae0453        	ldw	x,#1107
5279  000f 89            	pushw	x
5280  0010 ae0000        	ldw	x,#0
5281  0013 89            	pushw	x
5282  0014 ae0000        	ldw	x,#L101
5283  0017 cd0000        	call	_assert_failed
5285  001a 5b04          	addw	sp,#4
5286  001c               L027:
5287                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5287                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
5289  001c c6525a        	ld	a,21082
5290  001f a48f          	and	a,#143
5291  0021 1a01          	or	a,(OFST+1,sp)
5292  0023 c7525a        	ld	21082,a
5293                     ; 1112 }
5296  0026 84            	pop	a
5297  0027 81            	ret
5334                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5334                     ; 1124 {
5335                     .text:	section	.text,new
5336  0000               _TIM1_ForcedOC4Config:
5338  0000 88            	push	a
5339       00000000      OFST:	set	0
5342                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5344  0001 a150          	cp	a,#80
5345  0003 2704          	jreq	L627
5346  0005 a140          	cp	a,#64
5347  0007 2603          	jrne	L427
5348  0009               L627:
5349  0009 4f            	clr	a
5350  000a 2010          	jra	L037
5351  000c               L427:
5352  000c ae0466        	ldw	x,#1126
5353  000f 89            	pushw	x
5354  0010 ae0000        	ldw	x,#0
5355  0013 89            	pushw	x
5356  0014 ae0000        	ldw	x,#L101
5357  0017 cd0000        	call	_assert_failed
5359  001a 5b04          	addw	sp,#4
5360  001c               L037:
5361                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5361                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5363  001c c6525b        	ld	a,21083
5364  001f a48f          	and	a,#143
5365  0021 1a01          	or	a,(OFST+1,sp)
5366  0023 c7525b        	ld	21083,a
5367                     ; 1131 }
5370  0026 84            	pop	a
5371  0027 81            	ret
5408                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5408                     ; 1140 {
5409                     .text:	section	.text,new
5410  0000               _TIM1_ARRPreloadConfig:
5412  0000 88            	push	a
5413       00000000      OFST:	set	0
5416                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5418  0001 4d            	tnz	a
5419  0002 2704          	jreq	L637
5420  0004 a101          	cp	a,#1
5421  0006 2603          	jrne	L437
5422  0008               L637:
5423  0008 4f            	clr	a
5424  0009 2010          	jra	L047
5425  000b               L437:
5426  000b ae0476        	ldw	x,#1142
5427  000e 89            	pushw	x
5428  000f ae0000        	ldw	x,#0
5429  0012 89            	pushw	x
5430  0013 ae0000        	ldw	x,#L101
5431  0016 cd0000        	call	_assert_failed
5433  0019 5b04          	addw	sp,#4
5434  001b               L047:
5435                     ; 1145   if (NewState != DISABLE)
5437  001b 0d01          	tnz	(OFST+1,sp)
5438  001d 2706          	jreq	L7502
5439                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5441  001f 721e5250      	bset	21072,#7
5443  0023 2004          	jra	L1602
5444  0025               L7502:
5445                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5447  0025 721f5250      	bres	21072,#7
5448  0029               L1602:
5449                     ; 1153 }
5452  0029 84            	pop	a
5453  002a 81            	ret
5489                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5489                     ; 1162 {
5490                     .text:	section	.text,new
5491  0000               _TIM1_SelectCOM:
5493  0000 88            	push	a
5494       00000000      OFST:	set	0
5497                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5499  0001 4d            	tnz	a
5500  0002 2704          	jreq	L647
5501  0004 a101          	cp	a,#1
5502  0006 2603          	jrne	L447
5503  0008               L647:
5504  0008 4f            	clr	a
5505  0009 2010          	jra	L057
5506  000b               L447:
5507  000b ae048c        	ldw	x,#1164
5508  000e 89            	pushw	x
5509  000f ae0000        	ldw	x,#0
5510  0012 89            	pushw	x
5511  0013 ae0000        	ldw	x,#L101
5512  0016 cd0000        	call	_assert_failed
5514  0019 5b04          	addw	sp,#4
5515  001b               L057:
5516                     ; 1167   if (NewState != DISABLE)
5518  001b 0d01          	tnz	(OFST+1,sp)
5519  001d 2706          	jreq	L1012
5520                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5522  001f 72145251      	bset	21073,#2
5524  0023 2004          	jra	L3012
5525  0025               L1012:
5526                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5528  0025 72155251      	bres	21073,#2
5529  0029               L3012:
5530                     ; 1175 }
5533  0029 84            	pop	a
5534  002a 81            	ret
5571                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5571                     ; 1184 {
5572                     .text:	section	.text,new
5573  0000               _TIM1_CCPreloadControl:
5575  0000 88            	push	a
5576       00000000      OFST:	set	0
5579                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5581  0001 4d            	tnz	a
5582  0002 2704          	jreq	L657
5583  0004 a101          	cp	a,#1
5584  0006 2603          	jrne	L457
5585  0008               L657:
5586  0008 4f            	clr	a
5587  0009 2010          	jra	L067
5588  000b               L457:
5589  000b ae04a2        	ldw	x,#1186
5590  000e 89            	pushw	x
5591  000f ae0000        	ldw	x,#0
5592  0012 89            	pushw	x
5593  0013 ae0000        	ldw	x,#L101
5594  0016 cd0000        	call	_assert_failed
5596  0019 5b04          	addw	sp,#4
5597  001b               L067:
5598                     ; 1189   if (NewState != DISABLE)
5600  001b 0d01          	tnz	(OFST+1,sp)
5601  001d 2706          	jreq	L3212
5602                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5604  001f 72105251      	bset	21073,#0
5606  0023 2004          	jra	L5212
5607  0025               L3212:
5608                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5610  0025 72115251      	bres	21073,#0
5611  0029               L5212:
5612                     ; 1197 }
5615  0029 84            	pop	a
5616  002a 81            	ret
5653                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5653                     ; 1206 {
5654                     .text:	section	.text,new
5655  0000               _TIM1_OC1PreloadConfig:
5657  0000 88            	push	a
5658       00000000      OFST:	set	0
5661                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5663  0001 4d            	tnz	a
5664  0002 2704          	jreq	L667
5665  0004 a101          	cp	a,#1
5666  0006 2603          	jrne	L467
5667  0008               L667:
5668  0008 4f            	clr	a
5669  0009 2010          	jra	L077
5670  000b               L467:
5671  000b ae04b8        	ldw	x,#1208
5672  000e 89            	pushw	x
5673  000f ae0000        	ldw	x,#0
5674  0012 89            	pushw	x
5675  0013 ae0000        	ldw	x,#L101
5676  0016 cd0000        	call	_assert_failed
5678  0019 5b04          	addw	sp,#4
5679  001b               L077:
5680                     ; 1211   if (NewState != DISABLE)
5682  001b 0d01          	tnz	(OFST+1,sp)
5683  001d 2706          	jreq	L5412
5684                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5686  001f 72165258      	bset	21080,#3
5688  0023 2004          	jra	L7412
5689  0025               L5412:
5690                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5692  0025 72175258      	bres	21080,#3
5693  0029               L7412:
5694                     ; 1219 }
5697  0029 84            	pop	a
5698  002a 81            	ret
5735                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5735                     ; 1228 {
5736                     .text:	section	.text,new
5737  0000               _TIM1_OC2PreloadConfig:
5739  0000 88            	push	a
5740       00000000      OFST:	set	0
5743                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5745  0001 4d            	tnz	a
5746  0002 2704          	jreq	L677
5747  0004 a101          	cp	a,#1
5748  0006 2603          	jrne	L477
5749  0008               L677:
5750  0008 4f            	clr	a
5751  0009 2010          	jra	L0001
5752  000b               L477:
5753  000b ae04ce        	ldw	x,#1230
5754  000e 89            	pushw	x
5755  000f ae0000        	ldw	x,#0
5756  0012 89            	pushw	x
5757  0013 ae0000        	ldw	x,#L101
5758  0016 cd0000        	call	_assert_failed
5760  0019 5b04          	addw	sp,#4
5761  001b               L0001:
5762                     ; 1233   if (NewState != DISABLE)
5764  001b 0d01          	tnz	(OFST+1,sp)
5765  001d 2706          	jreq	L7612
5766                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5768  001f 72165259      	bset	21081,#3
5770  0023 2004          	jra	L1712
5771  0025               L7612:
5772                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5774  0025 72175259      	bres	21081,#3
5775  0029               L1712:
5776                     ; 1241 }
5779  0029 84            	pop	a
5780  002a 81            	ret
5817                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5817                     ; 1250 {
5818                     .text:	section	.text,new
5819  0000               _TIM1_OC3PreloadConfig:
5821  0000 88            	push	a
5822       00000000      OFST:	set	0
5825                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5827  0001 4d            	tnz	a
5828  0002 2704          	jreq	L6001
5829  0004 a101          	cp	a,#1
5830  0006 2603          	jrne	L4001
5831  0008               L6001:
5832  0008 4f            	clr	a
5833  0009 2010          	jra	L0101
5834  000b               L4001:
5835  000b ae04e4        	ldw	x,#1252
5836  000e 89            	pushw	x
5837  000f ae0000        	ldw	x,#0
5838  0012 89            	pushw	x
5839  0013 ae0000        	ldw	x,#L101
5840  0016 cd0000        	call	_assert_failed
5842  0019 5b04          	addw	sp,#4
5843  001b               L0101:
5844                     ; 1255   if (NewState != DISABLE)
5846  001b 0d01          	tnz	(OFST+1,sp)
5847  001d 2706          	jreq	L1122
5848                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5850  001f 7216525a      	bset	21082,#3
5852  0023 2004          	jra	L3122
5853  0025               L1122:
5854                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5856  0025 7217525a      	bres	21082,#3
5857  0029               L3122:
5858                     ; 1263 }
5861  0029 84            	pop	a
5862  002a 81            	ret
5899                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5899                     ; 1272 {
5900                     .text:	section	.text,new
5901  0000               _TIM1_OC4PreloadConfig:
5903  0000 88            	push	a
5904       00000000      OFST:	set	0
5907                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5909  0001 4d            	tnz	a
5910  0002 2704          	jreq	L6101
5911  0004 a101          	cp	a,#1
5912  0006 2603          	jrne	L4101
5913  0008               L6101:
5914  0008 4f            	clr	a
5915  0009 2010          	jra	L0201
5916  000b               L4101:
5917  000b ae04fa        	ldw	x,#1274
5918  000e 89            	pushw	x
5919  000f ae0000        	ldw	x,#0
5920  0012 89            	pushw	x
5921  0013 ae0000        	ldw	x,#L101
5922  0016 cd0000        	call	_assert_failed
5924  0019 5b04          	addw	sp,#4
5925  001b               L0201:
5926                     ; 1277   if (NewState != DISABLE)
5928  001b 0d01          	tnz	(OFST+1,sp)
5929  001d 2706          	jreq	L3322
5930                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5932  001f 7216525b      	bset	21083,#3
5934  0023 2004          	jra	L5322
5935  0025               L3322:
5936                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5938  0025 7217525b      	bres	21083,#3
5939  0029               L5322:
5940                     ; 1285 }
5943  0029 84            	pop	a
5944  002a 81            	ret
5980                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5980                     ; 1294 {
5981                     .text:	section	.text,new
5982  0000               _TIM1_OC1FastConfig:
5984  0000 88            	push	a
5985       00000000      OFST:	set	0
5988                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5990  0001 4d            	tnz	a
5991  0002 2704          	jreq	L6201
5992  0004 a101          	cp	a,#1
5993  0006 2603          	jrne	L4201
5994  0008               L6201:
5995  0008 4f            	clr	a
5996  0009 2010          	jra	L0301
5997  000b               L4201:
5998  000b ae0510        	ldw	x,#1296
5999  000e 89            	pushw	x
6000  000f ae0000        	ldw	x,#0
6001  0012 89            	pushw	x
6002  0013 ae0000        	ldw	x,#L101
6003  0016 cd0000        	call	_assert_failed
6005  0019 5b04          	addw	sp,#4
6006  001b               L0301:
6007                     ; 1299   if (NewState != DISABLE)
6009  001b 0d01          	tnz	(OFST+1,sp)
6010  001d 2706          	jreq	L5522
6011                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
6013  001f 72145258      	bset	21080,#2
6015  0023 2004          	jra	L7522
6016  0025               L5522:
6017                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6019  0025 72155258      	bres	21080,#2
6020  0029               L7522:
6021                     ; 1307 }
6024  0029 84            	pop	a
6025  002a 81            	ret
6061                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
6061                     ; 1316 {
6062                     .text:	section	.text,new
6063  0000               _TIM1_OC2FastConfig:
6065  0000 88            	push	a
6066       00000000      OFST:	set	0
6069                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6071  0001 4d            	tnz	a
6072  0002 2704          	jreq	L6301
6073  0004 a101          	cp	a,#1
6074  0006 2603          	jrne	L4301
6075  0008               L6301:
6076  0008 4f            	clr	a
6077  0009 2010          	jra	L0401
6078  000b               L4301:
6079  000b ae0526        	ldw	x,#1318
6080  000e 89            	pushw	x
6081  000f ae0000        	ldw	x,#0
6082  0012 89            	pushw	x
6083  0013 ae0000        	ldw	x,#L101
6084  0016 cd0000        	call	_assert_failed
6086  0019 5b04          	addw	sp,#4
6087  001b               L0401:
6088                     ; 1321   if (NewState != DISABLE)
6090  001b 0d01          	tnz	(OFST+1,sp)
6091  001d 2706          	jreq	L7722
6092                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6094  001f 72145259      	bset	21081,#2
6096  0023 2004          	jra	L1032
6097  0025               L7722:
6098                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6100  0025 72155259      	bres	21081,#2
6101  0029               L1032:
6102                     ; 1329 }
6105  0029 84            	pop	a
6106  002a 81            	ret
6142                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
6142                     ; 1338 {
6143                     .text:	section	.text,new
6144  0000               _TIM1_OC3FastConfig:
6146  0000 88            	push	a
6147       00000000      OFST:	set	0
6150                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6152  0001 4d            	tnz	a
6153  0002 2704          	jreq	L6401
6154  0004 a101          	cp	a,#1
6155  0006 2603          	jrne	L4401
6156  0008               L6401:
6157  0008 4f            	clr	a
6158  0009 2010          	jra	L0501
6159  000b               L4401:
6160  000b ae053c        	ldw	x,#1340
6161  000e 89            	pushw	x
6162  000f ae0000        	ldw	x,#0
6163  0012 89            	pushw	x
6164  0013 ae0000        	ldw	x,#L101
6165  0016 cd0000        	call	_assert_failed
6167  0019 5b04          	addw	sp,#4
6168  001b               L0501:
6169                     ; 1343   if (NewState != DISABLE)
6171  001b 0d01          	tnz	(OFST+1,sp)
6172  001d 2706          	jreq	L1232
6173                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6175  001f 7214525a      	bset	21082,#2
6177  0023 2004          	jra	L3232
6178  0025               L1232:
6179                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6181  0025 7215525a      	bres	21082,#2
6182  0029               L3232:
6183                     ; 1351 }
6186  0029 84            	pop	a
6187  002a 81            	ret
6223                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
6223                     ; 1360 {
6224                     .text:	section	.text,new
6225  0000               _TIM1_OC4FastConfig:
6227  0000 88            	push	a
6228       00000000      OFST:	set	0
6231                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6233  0001 4d            	tnz	a
6234  0002 2704          	jreq	L6501
6235  0004 a101          	cp	a,#1
6236  0006 2603          	jrne	L4501
6237  0008               L6501:
6238  0008 4f            	clr	a
6239  0009 2010          	jra	L0601
6240  000b               L4501:
6241  000b ae0552        	ldw	x,#1362
6242  000e 89            	pushw	x
6243  000f ae0000        	ldw	x,#0
6244  0012 89            	pushw	x
6245  0013 ae0000        	ldw	x,#L101
6246  0016 cd0000        	call	_assert_failed
6248  0019 5b04          	addw	sp,#4
6249  001b               L0601:
6250                     ; 1365   if (NewState != DISABLE)
6252  001b 0d01          	tnz	(OFST+1,sp)
6253  001d 2706          	jreq	L3432
6254                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6256  001f 7214525b      	bset	21083,#2
6258  0023 2004          	jra	L5432
6259  0025               L3432:
6260                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6262  0025 7215525b      	bres	21083,#2
6263  0029               L5432:
6264                     ; 1373 }
6267  0029 84            	pop	a
6268  002a 81            	ret
6374                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6374                     ; 1390 {
6375                     .text:	section	.text,new
6376  0000               _TIM1_GenerateEvent:
6378  0000 88            	push	a
6379       00000000      OFST:	set	0
6382                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6384  0001 4d            	tnz	a
6385  0002 2703          	jreq	L4601
6386  0004 4f            	clr	a
6387  0005 2010          	jra	L6601
6388  0007               L4601:
6389  0007 ae0570        	ldw	x,#1392
6390  000a 89            	pushw	x
6391  000b ae0000        	ldw	x,#0
6392  000e 89            	pushw	x
6393  000f ae0000        	ldw	x,#L101
6394  0012 cd0000        	call	_assert_failed
6396  0015 5b04          	addw	sp,#4
6397  0017               L6601:
6398                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6400  0017 7b01          	ld	a,(OFST+1,sp)
6401  0019 c75257        	ld	21079,a
6402                     ; 1396 }
6405  001c 84            	pop	a
6406  001d 81            	ret
6443                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6443                     ; 1407 {
6444                     .text:	section	.text,new
6445  0000               _TIM1_OC1PolarityConfig:
6447  0000 88            	push	a
6448       00000000      OFST:	set	0
6451                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6453  0001 4d            	tnz	a
6454  0002 2704          	jreq	L4701
6455  0004 a122          	cp	a,#34
6456  0006 2603          	jrne	L2701
6457  0008               L4701:
6458  0008 4f            	clr	a
6459  0009 2010          	jra	L6701
6460  000b               L2701:
6461  000b ae0581        	ldw	x,#1409
6462  000e 89            	pushw	x
6463  000f ae0000        	ldw	x,#0
6464  0012 89            	pushw	x
6465  0013 ae0000        	ldw	x,#L101
6466  0016 cd0000        	call	_assert_failed
6468  0019 5b04          	addw	sp,#4
6469  001b               L6701:
6470                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6472  001b 0d01          	tnz	(OFST+1,sp)
6473  001d 2706          	jreq	L7242
6474                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6476  001f 7212525c      	bset	21084,#1
6478  0023 2004          	jra	L1342
6479  0025               L7242:
6480                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6482  0025 7213525c      	bres	21084,#1
6483  0029               L1342:
6484                     ; 1420 }
6487  0029 84            	pop	a
6488  002a 81            	ret
6525                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6525                     ; 1431 {
6526                     .text:	section	.text,new
6527  0000               _TIM1_OC1NPolarityConfig:
6529  0000 88            	push	a
6530       00000000      OFST:	set	0
6533                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6535  0001 4d            	tnz	a
6536  0002 2704          	jreq	L4011
6537  0004 a188          	cp	a,#136
6538  0006 2603          	jrne	L2011
6539  0008               L4011:
6540  0008 4f            	clr	a
6541  0009 2010          	jra	L6011
6542  000b               L2011:
6543  000b ae0599        	ldw	x,#1433
6544  000e 89            	pushw	x
6545  000f ae0000        	ldw	x,#0
6546  0012 89            	pushw	x
6547  0013 ae0000        	ldw	x,#L101
6548  0016 cd0000        	call	_assert_failed
6550  0019 5b04          	addw	sp,#4
6551  001b               L6011:
6552                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6554  001b 0d01          	tnz	(OFST+1,sp)
6555  001d 2706          	jreq	L1542
6556                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6558  001f 7216525c      	bset	21084,#3
6560  0023 2004          	jra	L3542
6561  0025               L1542:
6562                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6564  0025 7217525c      	bres	21084,#3
6565  0029               L3542:
6566                     ; 1444 }
6569  0029 84            	pop	a
6570  002a 81            	ret
6607                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6607                     ; 1455 {
6608                     .text:	section	.text,new
6609  0000               _TIM1_OC2PolarityConfig:
6611  0000 88            	push	a
6612       00000000      OFST:	set	0
6615                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6617  0001 4d            	tnz	a
6618  0002 2704          	jreq	L4111
6619  0004 a122          	cp	a,#34
6620  0006 2603          	jrne	L2111
6621  0008               L4111:
6622  0008 4f            	clr	a
6623  0009 2010          	jra	L6111
6624  000b               L2111:
6625  000b ae05b1        	ldw	x,#1457
6626  000e 89            	pushw	x
6627  000f ae0000        	ldw	x,#0
6628  0012 89            	pushw	x
6629  0013 ae0000        	ldw	x,#L101
6630  0016 cd0000        	call	_assert_failed
6632  0019 5b04          	addw	sp,#4
6633  001b               L6111:
6634                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6636  001b 0d01          	tnz	(OFST+1,sp)
6637  001d 2706          	jreq	L3742
6638                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6640  001f 721a525c      	bset	21084,#5
6642  0023 2004          	jra	L5742
6643  0025               L3742:
6644                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6646  0025 721b525c      	bres	21084,#5
6647  0029               L5742:
6648                     ; 1468 }
6651  0029 84            	pop	a
6652  002a 81            	ret
6689                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6689                     ; 1479 {
6690                     .text:	section	.text,new
6691  0000               _TIM1_OC2NPolarityConfig:
6693  0000 88            	push	a
6694       00000000      OFST:	set	0
6697                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6699  0001 4d            	tnz	a
6700  0002 2704          	jreq	L4211
6701  0004 a188          	cp	a,#136
6702  0006 2603          	jrne	L2211
6703  0008               L4211:
6704  0008 4f            	clr	a
6705  0009 2010          	jra	L6211
6706  000b               L2211:
6707  000b ae05c9        	ldw	x,#1481
6708  000e 89            	pushw	x
6709  000f ae0000        	ldw	x,#0
6710  0012 89            	pushw	x
6711  0013 ae0000        	ldw	x,#L101
6712  0016 cd0000        	call	_assert_failed
6714  0019 5b04          	addw	sp,#4
6715  001b               L6211:
6716                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6718  001b 0d01          	tnz	(OFST+1,sp)
6719  001d 2706          	jreq	L5152
6720                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6722  001f 721e525c      	bset	21084,#7
6724  0023 2004          	jra	L7152
6725  0025               L5152:
6726                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6728  0025 721f525c      	bres	21084,#7
6729  0029               L7152:
6730                     ; 1492 }
6733  0029 84            	pop	a
6734  002a 81            	ret
6771                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6771                     ; 1503 {
6772                     .text:	section	.text,new
6773  0000               _TIM1_OC3PolarityConfig:
6775  0000 88            	push	a
6776       00000000      OFST:	set	0
6779                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6781  0001 4d            	tnz	a
6782  0002 2704          	jreq	L4311
6783  0004 a122          	cp	a,#34
6784  0006 2603          	jrne	L2311
6785  0008               L4311:
6786  0008 4f            	clr	a
6787  0009 2010          	jra	L6311
6788  000b               L2311:
6789  000b ae05e1        	ldw	x,#1505
6790  000e 89            	pushw	x
6791  000f ae0000        	ldw	x,#0
6792  0012 89            	pushw	x
6793  0013 ae0000        	ldw	x,#L101
6794  0016 cd0000        	call	_assert_failed
6796  0019 5b04          	addw	sp,#4
6797  001b               L6311:
6798                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6800  001b 0d01          	tnz	(OFST+1,sp)
6801  001d 2706          	jreq	L7352
6802                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6804  001f 7212525d      	bset	21085,#1
6806  0023 2004          	jra	L1452
6807  0025               L7352:
6808                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6810  0025 7213525d      	bres	21085,#1
6811  0029               L1452:
6812                     ; 1516 }
6815  0029 84            	pop	a
6816  002a 81            	ret
6853                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6853                     ; 1528 {
6854                     .text:	section	.text,new
6855  0000               _TIM1_OC3NPolarityConfig:
6857  0000 88            	push	a
6858       00000000      OFST:	set	0
6861                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6863  0001 4d            	tnz	a
6864  0002 2704          	jreq	L4411
6865  0004 a188          	cp	a,#136
6866  0006 2603          	jrne	L2411
6867  0008               L4411:
6868  0008 4f            	clr	a
6869  0009 2010          	jra	L6411
6870  000b               L2411:
6871  000b ae05fa        	ldw	x,#1530
6872  000e 89            	pushw	x
6873  000f ae0000        	ldw	x,#0
6874  0012 89            	pushw	x
6875  0013 ae0000        	ldw	x,#L101
6876  0016 cd0000        	call	_assert_failed
6878  0019 5b04          	addw	sp,#4
6879  001b               L6411:
6880                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6882  001b 0d01          	tnz	(OFST+1,sp)
6883  001d 2706          	jreq	L1652
6884                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6886  001f 7216525d      	bset	21085,#3
6888  0023 2004          	jra	L3652
6889  0025               L1652:
6890                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6892  0025 7217525d      	bres	21085,#3
6893  0029               L3652:
6894                     ; 1541 }
6897  0029 84            	pop	a
6898  002a 81            	ret
6935                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6935                     ; 1552 {
6936                     .text:	section	.text,new
6937  0000               _TIM1_OC4PolarityConfig:
6939  0000 88            	push	a
6940       00000000      OFST:	set	0
6943                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6945  0001 4d            	tnz	a
6946  0002 2704          	jreq	L4511
6947  0004 a122          	cp	a,#34
6948  0006 2603          	jrne	L2511
6949  0008               L4511:
6950  0008 4f            	clr	a
6951  0009 2010          	jra	L6511
6952  000b               L2511:
6953  000b ae0612        	ldw	x,#1554
6954  000e 89            	pushw	x
6955  000f ae0000        	ldw	x,#0
6956  0012 89            	pushw	x
6957  0013 ae0000        	ldw	x,#L101
6958  0016 cd0000        	call	_assert_failed
6960  0019 5b04          	addw	sp,#4
6961  001b               L6511:
6962                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6964  001b 0d01          	tnz	(OFST+1,sp)
6965  001d 2706          	jreq	L3062
6966                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6968  001f 721a525d      	bset	21085,#5
6970  0023 2004          	jra	L5062
6971  0025               L3062:
6972                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6974  0025 721b525d      	bres	21085,#5
6975  0029               L5062:
6976                     ; 1565 }
6979  0029 84            	pop	a
6980  002a 81            	ret
7026                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7026                     ; 1580 {
7027                     .text:	section	.text,new
7028  0000               _TIM1_CCxCmd:
7030  0000 89            	pushw	x
7031       00000000      OFST:	set	0
7034                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7036  0001 9e            	ld	a,xh
7037  0002 4d            	tnz	a
7038  0003 270f          	jreq	L4611
7039  0005 9e            	ld	a,xh
7040  0006 a101          	cp	a,#1
7041  0008 270a          	jreq	L4611
7042  000a 9e            	ld	a,xh
7043  000b a102          	cp	a,#2
7044  000d 2705          	jreq	L4611
7045  000f 9e            	ld	a,xh
7046  0010 a103          	cp	a,#3
7047  0012 2603          	jrne	L2611
7048  0014               L4611:
7049  0014 4f            	clr	a
7050  0015 2010          	jra	L6611
7051  0017               L2611:
7052  0017 ae062e        	ldw	x,#1582
7053  001a 89            	pushw	x
7054  001b ae0000        	ldw	x,#0
7055  001e 89            	pushw	x
7056  001f ae0000        	ldw	x,#L101
7057  0022 cd0000        	call	_assert_failed
7059  0025 5b04          	addw	sp,#4
7060  0027               L6611:
7061                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7063  0027 0d02          	tnz	(OFST+2,sp)
7064  0029 2706          	jreq	L2711
7065  002b 7b02          	ld	a,(OFST+2,sp)
7066  002d a101          	cp	a,#1
7067  002f 2603          	jrne	L0711
7068  0031               L2711:
7069  0031 4f            	clr	a
7070  0032 2010          	jra	L4711
7071  0034               L0711:
7072  0034 ae062f        	ldw	x,#1583
7073  0037 89            	pushw	x
7074  0038 ae0000        	ldw	x,#0
7075  003b 89            	pushw	x
7076  003c ae0000        	ldw	x,#L101
7077  003f cd0000        	call	_assert_failed
7079  0042 5b04          	addw	sp,#4
7080  0044               L4711:
7081                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
7083  0044 0d01          	tnz	(OFST+1,sp)
7084  0046 2610          	jrne	L1362
7085                     ; 1588     if (NewState != DISABLE)
7087  0048 0d02          	tnz	(OFST+2,sp)
7088  004a 2706          	jreq	L3362
7089                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
7091  004c 7210525c      	bset	21084,#0
7093  0050 2040          	jra	L7362
7094  0052               L3362:
7095                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7097  0052 7211525c      	bres	21084,#0
7098  0056 203a          	jra	L7362
7099  0058               L1362:
7100                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
7102  0058 7b01          	ld	a,(OFST+1,sp)
7103  005a a101          	cp	a,#1
7104  005c 2610          	jrne	L1462
7105                     ; 1601     if (NewState != DISABLE)
7107  005e 0d02          	tnz	(OFST+2,sp)
7108  0060 2706          	jreq	L3462
7109                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
7111  0062 7218525c      	bset	21084,#4
7113  0066 202a          	jra	L7362
7114  0068               L3462:
7115                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7117  0068 7219525c      	bres	21084,#4
7118  006c 2024          	jra	L7362
7119  006e               L1462:
7120                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
7122  006e 7b01          	ld	a,(OFST+1,sp)
7123  0070 a102          	cp	a,#2
7124  0072 2610          	jrne	L1562
7125                     ; 1613     if (NewState != DISABLE)
7127  0074 0d02          	tnz	(OFST+2,sp)
7128  0076 2706          	jreq	L3562
7129                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
7131  0078 7210525d      	bset	21085,#0
7133  007c 2014          	jra	L7362
7134  007e               L3562:
7135                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7137  007e 7211525d      	bres	21085,#0
7138  0082 200e          	jra	L7362
7139  0084               L1562:
7140                     ; 1625     if (NewState != DISABLE)
7142  0084 0d02          	tnz	(OFST+2,sp)
7143  0086 2706          	jreq	L1662
7144                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
7146  0088 7218525d      	bset	21085,#4
7148  008c 2004          	jra	L7362
7149  008e               L1662:
7150                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7152  008e 7219525d      	bres	21085,#4
7153  0092               L7362:
7154                     ; 1634 }
7157  0092 85            	popw	x
7158  0093 81            	ret
7204                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7204                     ; 1648 {
7205                     .text:	section	.text,new
7206  0000               _TIM1_CCxNCmd:
7208  0000 89            	pushw	x
7209       00000000      OFST:	set	0
7212                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7214  0001 9e            	ld	a,xh
7215  0002 4d            	tnz	a
7216  0003 270a          	jreq	L2021
7217  0005 9e            	ld	a,xh
7218  0006 a101          	cp	a,#1
7219  0008 2705          	jreq	L2021
7220  000a 9e            	ld	a,xh
7221  000b a102          	cp	a,#2
7222  000d 2603          	jrne	L0021
7223  000f               L2021:
7224  000f 4f            	clr	a
7225  0010 2010          	jra	L4021
7226  0012               L0021:
7227  0012 ae0672        	ldw	x,#1650
7228  0015 89            	pushw	x
7229  0016 ae0000        	ldw	x,#0
7230  0019 89            	pushw	x
7231  001a ae0000        	ldw	x,#L101
7232  001d cd0000        	call	_assert_failed
7234  0020 5b04          	addw	sp,#4
7235  0022               L4021:
7236                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7238  0022 0d02          	tnz	(OFST+2,sp)
7239  0024 2706          	jreq	L0121
7240  0026 7b02          	ld	a,(OFST+2,sp)
7241  0028 a101          	cp	a,#1
7242  002a 2603          	jrne	L6021
7243  002c               L0121:
7244  002c 4f            	clr	a
7245  002d 2010          	jra	L2121
7246  002f               L6021:
7247  002f ae0673        	ldw	x,#1651
7248  0032 89            	pushw	x
7249  0033 ae0000        	ldw	x,#0
7250  0036 89            	pushw	x
7251  0037 ae0000        	ldw	x,#L101
7252  003a cd0000        	call	_assert_failed
7254  003d 5b04          	addw	sp,#4
7255  003f               L2121:
7256                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
7258  003f 0d01          	tnz	(OFST+1,sp)
7259  0041 2610          	jrne	L7072
7260                     ; 1656     if (NewState != DISABLE)
7262  0043 0d02          	tnz	(OFST+2,sp)
7263  0045 2706          	jreq	L1172
7264                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7266  0047 7214525c      	bset	21084,#2
7268  004b 202a          	jra	L5172
7269  004d               L1172:
7270                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7272  004d 7215525c      	bres	21084,#2
7273  0051 2024          	jra	L5172
7274  0053               L7072:
7275                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
7277  0053 7b01          	ld	a,(OFST+1,sp)
7278  0055 a101          	cp	a,#1
7279  0057 2610          	jrne	L7172
7280                     ; 1668     if (NewState != DISABLE)
7282  0059 0d02          	tnz	(OFST+2,sp)
7283  005b 2706          	jreq	L1272
7284                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7286  005d 721c525c      	bset	21084,#6
7288  0061 2014          	jra	L5172
7289  0063               L1272:
7290                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7292  0063 721d525c      	bres	21084,#6
7293  0067 200e          	jra	L5172
7294  0069               L7172:
7295                     ; 1680     if (NewState != DISABLE)
7297  0069 0d02          	tnz	(OFST+2,sp)
7298  006b 2706          	jreq	L7272
7299                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7301  006d 7214525d      	bset	21085,#2
7303  0071 2004          	jra	L5172
7304  0073               L7272:
7305                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7307  0073 7215525d      	bres	21085,#2
7308  0077               L5172:
7309                     ; 1689 }
7312  0077 85            	popw	x
7313  0078 81            	ret
7359                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7359                     ; 1713 {
7360                     .text:	section	.text,new
7361  0000               _TIM1_SelectOCxM:
7363  0000 89            	pushw	x
7364       00000000      OFST:	set	0
7367                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7369  0001 9e            	ld	a,xh
7370  0002 4d            	tnz	a
7371  0003 270f          	jreq	L0221
7372  0005 9e            	ld	a,xh
7373  0006 a101          	cp	a,#1
7374  0008 270a          	jreq	L0221
7375  000a 9e            	ld	a,xh
7376  000b a102          	cp	a,#2
7377  000d 2705          	jreq	L0221
7378  000f 9e            	ld	a,xh
7379  0010 a103          	cp	a,#3
7380  0012 2603          	jrne	L6121
7381  0014               L0221:
7382  0014 4f            	clr	a
7383  0015 2010          	jra	L2221
7384  0017               L6121:
7385  0017 ae06b3        	ldw	x,#1715
7386  001a 89            	pushw	x
7387  001b ae0000        	ldw	x,#0
7388  001e 89            	pushw	x
7389  001f ae0000        	ldw	x,#L101
7390  0022 cd0000        	call	_assert_failed
7392  0025 5b04          	addw	sp,#4
7393  0027               L2221:
7394                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7396  0027 0d02          	tnz	(OFST+2,sp)
7397  0029 272a          	jreq	L6221
7398  002b 7b02          	ld	a,(OFST+2,sp)
7399  002d a110          	cp	a,#16
7400  002f 2724          	jreq	L6221
7401  0031 7b02          	ld	a,(OFST+2,sp)
7402  0033 a120          	cp	a,#32
7403  0035 271e          	jreq	L6221
7404  0037 7b02          	ld	a,(OFST+2,sp)
7405  0039 a130          	cp	a,#48
7406  003b 2718          	jreq	L6221
7407  003d 7b02          	ld	a,(OFST+2,sp)
7408  003f a160          	cp	a,#96
7409  0041 2712          	jreq	L6221
7410  0043 7b02          	ld	a,(OFST+2,sp)
7411  0045 a170          	cp	a,#112
7412  0047 270c          	jreq	L6221
7413  0049 7b02          	ld	a,(OFST+2,sp)
7414  004b a150          	cp	a,#80
7415  004d 2706          	jreq	L6221
7416  004f 7b02          	ld	a,(OFST+2,sp)
7417  0051 a140          	cp	a,#64
7418  0053 2603          	jrne	L4221
7419  0055               L6221:
7420  0055 4f            	clr	a
7421  0056 2010          	jra	L0321
7422  0058               L4221:
7423  0058 ae06b4        	ldw	x,#1716
7424  005b 89            	pushw	x
7425  005c ae0000        	ldw	x,#0
7426  005f 89            	pushw	x
7427  0060 ae0000        	ldw	x,#L101
7428  0063 cd0000        	call	_assert_failed
7430  0066 5b04          	addw	sp,#4
7431  0068               L0321:
7432                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
7434  0068 0d01          	tnz	(OFST+1,sp)
7435  006a 2610          	jrne	L5572
7436                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7438  006c 7211525c      	bres	21084,#0
7439                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7439                     ; 1725                             | (uint8_t)TIM1_OCMode);
7441  0070 c65258        	ld	a,21080
7442  0073 a48f          	and	a,#143
7443  0075 1a02          	or	a,(OFST+2,sp)
7444  0077 c75258        	ld	21080,a
7446  007a 203a          	jra	L7572
7447  007c               L5572:
7448                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7450  007c 7b01          	ld	a,(OFST+1,sp)
7451  007e a101          	cp	a,#1
7452  0080 2610          	jrne	L1672
7453                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7455  0082 7219525c      	bres	21084,#4
7456                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7456                     ; 1734                             | (uint8_t)TIM1_OCMode);
7458  0086 c65259        	ld	a,21081
7459  0089 a48f          	and	a,#143
7460  008b 1a02          	or	a,(OFST+2,sp)
7461  008d c75259        	ld	21081,a
7463  0090 2024          	jra	L7572
7464  0092               L1672:
7465                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7467  0092 7b01          	ld	a,(OFST+1,sp)
7468  0094 a102          	cp	a,#2
7469  0096 2610          	jrne	L5672
7470                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7472  0098 7211525d      	bres	21085,#0
7473                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7473                     ; 1743                             | (uint8_t)TIM1_OCMode);
7475  009c c6525a        	ld	a,21082
7476  009f a48f          	and	a,#143
7477  00a1 1a02          	or	a,(OFST+2,sp)
7478  00a3 c7525a        	ld	21082,a
7480  00a6 200e          	jra	L7572
7481  00a8               L5672:
7482                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7484  00a8 7219525d      	bres	21085,#4
7485                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7485                     ; 1752                             | (uint8_t)TIM1_OCMode);
7487  00ac c6525b        	ld	a,21083
7488  00af a48f          	and	a,#143
7489  00b1 1a02          	or	a,(OFST+2,sp)
7490  00b3 c7525b        	ld	21083,a
7491  00b6               L7572:
7492                     ; 1754 }
7495  00b6 85            	popw	x
7496  00b7 81            	ret
7530                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7530                     ; 1763 {
7531                     .text:	section	.text,new
7532  0000               _TIM1_SetCounter:
7536                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7538  0000 9e            	ld	a,xh
7539  0001 c7525e        	ld	21086,a
7540                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7542  0004 9f            	ld	a,xl
7543  0005 c7525f        	ld	21087,a
7544                     ; 1767 }
7547  0008 81            	ret
7581                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7581                     ; 1776 {
7582                     .text:	section	.text,new
7583  0000               _TIM1_SetAutoreload:
7587                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7589  0000 9e            	ld	a,xh
7590  0001 c75262        	ld	21090,a
7591                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7593  0004 9f            	ld	a,xl
7594  0005 c75263        	ld	21091,a
7595                     ; 1780  }
7598  0008 81            	ret
7632                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7632                     ; 1789 {
7633                     .text:	section	.text,new
7634  0000               _TIM1_SetCompare1:
7638                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7640  0000 9e            	ld	a,xh
7641  0001 c75265        	ld	21093,a
7642                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7644  0004 9f            	ld	a,xl
7645  0005 c75266        	ld	21094,a
7646                     ; 1793 }
7649  0008 81            	ret
7683                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7683                     ; 1802 {
7684                     .text:	section	.text,new
7685  0000               _TIM1_SetCompare2:
7689                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7691  0000 9e            	ld	a,xh
7692  0001 c75267        	ld	21095,a
7693                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7695  0004 9f            	ld	a,xl
7696  0005 c75268        	ld	21096,a
7697                     ; 1806 }
7700  0008 81            	ret
7734                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7734                     ; 1815 {
7735                     .text:	section	.text,new
7736  0000               _TIM1_SetCompare3:
7740                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7742  0000 9e            	ld	a,xh
7743  0001 c75269        	ld	21097,a
7744                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7746  0004 9f            	ld	a,xl
7747  0005 c7526a        	ld	21098,a
7748                     ; 1819 }
7751  0008 81            	ret
7785                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7785                     ; 1828 {
7786                     .text:	section	.text,new
7787  0000               _TIM1_SetCompare4:
7791                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7793  0000 9e            	ld	a,xh
7794  0001 c7526b        	ld	21099,a
7795                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7797  0004 9f            	ld	a,xl
7798  0005 c7526c        	ld	21100,a
7799                     ; 1832 }
7802  0008 81            	ret
7839                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7839                     ; 1845 {
7840                     .text:	section	.text,new
7841  0000               _TIM1_SetIC1Prescaler:
7843  0000 88            	push	a
7844       00000000      OFST:	set	0
7847                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7849  0001 4d            	tnz	a
7850  0002 270c          	jreq	L2521
7851  0004 a104          	cp	a,#4
7852  0006 2708          	jreq	L2521
7853  0008 a108          	cp	a,#8
7854  000a 2704          	jreq	L2521
7855  000c a10c          	cp	a,#12
7856  000e 2603          	jrne	L0521
7857  0010               L2521:
7858  0010 4f            	clr	a
7859  0011 2010          	jra	L4521
7860  0013               L0521:
7861  0013 ae0737        	ldw	x,#1847
7862  0016 89            	pushw	x
7863  0017 ae0000        	ldw	x,#0
7864  001a 89            	pushw	x
7865  001b ae0000        	ldw	x,#L101
7866  001e cd0000        	call	_assert_failed
7868  0021 5b04          	addw	sp,#4
7869  0023               L4521:
7870                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7870                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7872  0023 c65258        	ld	a,21080
7873  0026 a4f3          	and	a,#243
7874  0028 1a01          	or	a,(OFST+1,sp)
7875  002a c75258        	ld	21080,a
7876                     ; 1852 }
7879  002d 84            	pop	a
7880  002e 81            	ret
7917                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7917                     ; 1865 {
7918                     .text:	section	.text,new
7919  0000               _TIM1_SetIC2Prescaler:
7921  0000 88            	push	a
7922       00000000      OFST:	set	0
7925                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7927  0001 4d            	tnz	a
7928  0002 270c          	jreq	L2621
7929  0004 a104          	cp	a,#4
7930  0006 2708          	jreq	L2621
7931  0008 a108          	cp	a,#8
7932  000a 2704          	jreq	L2621
7933  000c a10c          	cp	a,#12
7934  000e 2603          	jrne	L0621
7935  0010               L2621:
7936  0010 4f            	clr	a
7937  0011 2010          	jra	L4621
7938  0013               L0621:
7939  0013 ae074c        	ldw	x,#1868
7940  0016 89            	pushw	x
7941  0017 ae0000        	ldw	x,#0
7942  001a 89            	pushw	x
7943  001b ae0000        	ldw	x,#L101
7944  001e cd0000        	call	_assert_failed
7946  0021 5b04          	addw	sp,#4
7947  0023               L4621:
7948                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7948                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7950  0023 c65259        	ld	a,21081
7951  0026 a4f3          	and	a,#243
7952  0028 1a01          	or	a,(OFST+1,sp)
7953  002a c75259        	ld	21081,a
7954                     ; 1873 }
7957  002d 84            	pop	a
7958  002e 81            	ret
7995                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7995                     ; 1886 {
7996                     .text:	section	.text,new
7997  0000               _TIM1_SetIC3Prescaler:
7999  0000 88            	push	a
8000       00000000      OFST:	set	0
8003                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
8005  0001 4d            	tnz	a
8006  0002 270c          	jreq	L2721
8007  0004 a104          	cp	a,#4
8008  0006 2708          	jreq	L2721
8009  0008 a108          	cp	a,#8
8010  000a 2704          	jreq	L2721
8011  000c a10c          	cp	a,#12
8012  000e 2603          	jrne	L0721
8013  0010               L2721:
8014  0010 4f            	clr	a
8015  0011 2010          	jra	L4721
8016  0013               L0721:
8017  0013 ae0761        	ldw	x,#1889
8018  0016 89            	pushw	x
8019  0017 ae0000        	ldw	x,#0
8020  001a 89            	pushw	x
8021  001b ae0000        	ldw	x,#L101
8022  001e cd0000        	call	_assert_failed
8024  0021 5b04          	addw	sp,#4
8025  0023               L4721:
8026                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
8026                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
8028  0023 c6525a        	ld	a,21082
8029  0026 a4f3          	and	a,#243
8030  0028 1a01          	or	a,(OFST+1,sp)
8031  002a c7525a        	ld	21082,a
8032                     ; 1894 }
8035  002d 84            	pop	a
8036  002e 81            	ret
8073                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8073                     ; 1907 {
8074                     .text:	section	.text,new
8075  0000               _TIM1_SetIC4Prescaler:
8077  0000 88            	push	a
8078       00000000      OFST:	set	0
8081                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8083  0001 4d            	tnz	a
8084  0002 270c          	jreq	L2031
8085  0004 a104          	cp	a,#4
8086  0006 2708          	jreq	L2031
8087  0008 a108          	cp	a,#8
8088  000a 2704          	jreq	L2031
8089  000c a10c          	cp	a,#12
8090  000e 2603          	jrne	L0031
8091  0010               L2031:
8092  0010 4f            	clr	a
8093  0011 2010          	jra	L4031
8094  0013               L0031:
8095  0013 ae0776        	ldw	x,#1910
8096  0016 89            	pushw	x
8097  0017 ae0000        	ldw	x,#0
8098  001a 89            	pushw	x
8099  001b ae0000        	ldw	x,#L101
8100  001e cd0000        	call	_assert_failed
8102  0021 5b04          	addw	sp,#4
8103  0023               L4031:
8104                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8104                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
8106  0023 c6525b        	ld	a,21083
8107  0026 a4f3          	and	a,#243
8108  0028 1a01          	or	a,(OFST+1,sp)
8109  002a c7525b        	ld	21083,a
8110                     ; 1915 }
8113  002d 84            	pop	a
8114  002e 81            	ret
8166                     ; 1922 uint16_t TIM1_GetCapture1(void)
8166                     ; 1923 {
8167                     .text:	section	.text,new
8168  0000               _TIM1_GetCapture1:
8170  0000 5204          	subw	sp,#4
8171       00000004      OFST:	set	4
8174                     ; 1926   uint16_t tmpccr1 = 0;
8176                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
8180                     ; 1929   tmpccr1h = TIM1->CCR1H;
8182  0002 c65265        	ld	a,21093
8183  0005 6b02          	ld	(OFST-2,sp),a
8184                     ; 1930   tmpccr1l = TIM1->CCR1L;
8186  0007 c65266        	ld	a,21094
8187  000a 6b01          	ld	(OFST-3,sp),a
8188                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
8190  000c 7b01          	ld	a,(OFST-3,sp)
8191  000e 5f            	clrw	x
8192  000f 97            	ld	xl,a
8193  0010 1f03          	ldw	(OFST-1,sp),x
8194                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8196  0012 7b02          	ld	a,(OFST-2,sp)
8197  0014 5f            	clrw	x
8198  0015 97            	ld	xl,a
8199  0016 4f            	clr	a
8200  0017 02            	rlwa	x,a
8201  0018 01            	rrwa	x,a
8202  0019 1a04          	or	a,(OFST+0,sp)
8203  001b 01            	rrwa	x,a
8204  001c 1a03          	or	a,(OFST-1,sp)
8205  001e 01            	rrwa	x,a
8206  001f 1f03          	ldw	(OFST-1,sp),x
8207                     ; 1935   return (uint16_t)tmpccr1;
8209  0021 1e03          	ldw	x,(OFST-1,sp)
8212  0023 5b04          	addw	sp,#4
8213  0025 81            	ret
8265                     ; 1943 uint16_t TIM1_GetCapture2(void)
8265                     ; 1944 {
8266                     .text:	section	.text,new
8267  0000               _TIM1_GetCapture2:
8269  0000 5204          	subw	sp,#4
8270       00000004      OFST:	set	4
8273                     ; 1947   uint16_t tmpccr2 = 0;
8275                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
8279                     ; 1950   tmpccr2h = TIM1->CCR2H;
8281  0002 c65267        	ld	a,21095
8282  0005 6b02          	ld	(OFST-2,sp),a
8283                     ; 1951   tmpccr2l = TIM1->CCR2L;
8285  0007 c65268        	ld	a,21096
8286  000a 6b01          	ld	(OFST-3,sp),a
8287                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
8289  000c 7b01          	ld	a,(OFST-3,sp)
8290  000e 5f            	clrw	x
8291  000f 97            	ld	xl,a
8292  0010 1f03          	ldw	(OFST-1,sp),x
8293                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8295  0012 7b02          	ld	a,(OFST-2,sp)
8296  0014 5f            	clrw	x
8297  0015 97            	ld	xl,a
8298  0016 4f            	clr	a
8299  0017 02            	rlwa	x,a
8300  0018 01            	rrwa	x,a
8301  0019 1a04          	or	a,(OFST+0,sp)
8302  001b 01            	rrwa	x,a
8303  001c 1a03          	or	a,(OFST-1,sp)
8304  001e 01            	rrwa	x,a
8305  001f 1f03          	ldw	(OFST-1,sp),x
8306                     ; 1956   return (uint16_t)tmpccr2;
8308  0021 1e03          	ldw	x,(OFST-1,sp)
8311  0023 5b04          	addw	sp,#4
8312  0025 81            	ret
8364                     ; 1964 uint16_t TIM1_GetCapture3(void)
8364                     ; 1965 {
8365                     .text:	section	.text,new
8366  0000               _TIM1_GetCapture3:
8368  0000 5204          	subw	sp,#4
8369       00000004      OFST:	set	4
8372                     ; 1967   uint16_t tmpccr3 = 0;
8374                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
8378                     ; 1970   tmpccr3h = TIM1->CCR3H;
8380  0002 c65269        	ld	a,21097
8381  0005 6b02          	ld	(OFST-2,sp),a
8382                     ; 1971   tmpccr3l = TIM1->CCR3L;
8384  0007 c6526a        	ld	a,21098
8385  000a 6b01          	ld	(OFST-3,sp),a
8386                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
8388  000c 7b01          	ld	a,(OFST-3,sp)
8389  000e 5f            	clrw	x
8390  000f 97            	ld	xl,a
8391  0010 1f03          	ldw	(OFST-1,sp),x
8392                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8394  0012 7b02          	ld	a,(OFST-2,sp)
8395  0014 5f            	clrw	x
8396  0015 97            	ld	xl,a
8397  0016 4f            	clr	a
8398  0017 02            	rlwa	x,a
8399  0018 01            	rrwa	x,a
8400  0019 1a04          	or	a,(OFST+0,sp)
8401  001b 01            	rrwa	x,a
8402  001c 1a03          	or	a,(OFST-1,sp)
8403  001e 01            	rrwa	x,a
8404  001f 1f03          	ldw	(OFST-1,sp),x
8405                     ; 1976   return (uint16_t)tmpccr3;
8407  0021 1e03          	ldw	x,(OFST-1,sp)
8410  0023 5b04          	addw	sp,#4
8411  0025 81            	ret
8463                     ; 1984 uint16_t TIM1_GetCapture4(void)
8463                     ; 1985 {
8464                     .text:	section	.text,new
8465  0000               _TIM1_GetCapture4:
8467  0000 5204          	subw	sp,#4
8468       00000004      OFST:	set	4
8471                     ; 1987   uint16_t tmpccr4 = 0;
8473                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
8477                     ; 1990   tmpccr4h = TIM1->CCR4H;
8479  0002 c6526b        	ld	a,21099
8480  0005 6b02          	ld	(OFST-2,sp),a
8481                     ; 1991   tmpccr4l = TIM1->CCR4L;
8483  0007 c6526c        	ld	a,21100
8484  000a 6b01          	ld	(OFST-3,sp),a
8485                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
8487  000c 7b01          	ld	a,(OFST-3,sp)
8488  000e 5f            	clrw	x
8489  000f 97            	ld	xl,a
8490  0010 1f03          	ldw	(OFST-1,sp),x
8491                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8493  0012 7b02          	ld	a,(OFST-2,sp)
8494  0014 5f            	clrw	x
8495  0015 97            	ld	xl,a
8496  0016 4f            	clr	a
8497  0017 02            	rlwa	x,a
8498  0018 01            	rrwa	x,a
8499  0019 1a04          	or	a,(OFST+0,sp)
8500  001b 01            	rrwa	x,a
8501  001c 1a03          	or	a,(OFST-1,sp)
8502  001e 01            	rrwa	x,a
8503  001f 1f03          	ldw	(OFST-1,sp),x
8504                     ; 1996   return (uint16_t)tmpccr4;
8506  0021 1e03          	ldw	x,(OFST-1,sp)
8509  0023 5b04          	addw	sp,#4
8510  0025 81            	ret
8544                     ; 2004 uint16_t TIM1_GetCounter(void)
8544                     ; 2005 {
8545                     .text:	section	.text,new
8546  0000               _TIM1_GetCounter:
8548  0000 89            	pushw	x
8549       00000002      OFST:	set	2
8552                     ; 2006   uint16_t tmpcntr = 0;
8554                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8556  0001 c6525e        	ld	a,21086
8557  0004 5f            	clrw	x
8558  0005 97            	ld	xl,a
8559  0006 4f            	clr	a
8560  0007 02            	rlwa	x,a
8561  0008 1f01          	ldw	(OFST-1,sp),x
8562                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8564  000a c6525f        	ld	a,21087
8565  000d 5f            	clrw	x
8566  000e 97            	ld	xl,a
8567  000f 01            	rrwa	x,a
8568  0010 1a02          	or	a,(OFST+0,sp)
8569  0012 01            	rrwa	x,a
8570  0013 1a01          	or	a,(OFST-1,sp)
8571  0015 01            	rrwa	x,a
8574  0016 5b02          	addw	sp,#2
8575  0018 81            	ret
8609                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8609                     ; 2020 {
8610                     .text:	section	.text,new
8611  0000               _TIM1_GetPrescaler:
8613  0000 89            	pushw	x
8614       00000002      OFST:	set	2
8617                     ; 2021   uint16_t temp = 0;
8619                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8621  0001 c65260        	ld	a,21088
8622  0004 5f            	clrw	x
8623  0005 97            	ld	xl,a
8624  0006 4f            	clr	a
8625  0007 02            	rlwa	x,a
8626  0008 1f01          	ldw	(OFST-1,sp),x
8627                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8629  000a c65261        	ld	a,21089
8630  000d 5f            	clrw	x
8631  000e 97            	ld	xl,a
8632  000f 01            	rrwa	x,a
8633  0010 1a02          	or	a,(OFST+0,sp)
8634  0012 01            	rrwa	x,a
8635  0013 1a01          	or	a,(OFST-1,sp)
8636  0015 01            	rrwa	x,a
8639  0016 5b02          	addw	sp,#2
8640  0018 81            	ret
8815                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8815                     ; 2048 {
8816                     .text:	section	.text,new
8817  0000               _TIM1_GetFlagStatus:
8819  0000 89            	pushw	x
8820  0001 89            	pushw	x
8821       00000002      OFST:	set	2
8824                     ; 2049   FlagStatus bitstatus = RESET;
8826                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8830                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8832  0002 a30001        	cpw	x,#1
8833  0005 2737          	jreq	L6231
8834  0007 a30002        	cpw	x,#2
8835  000a 2732          	jreq	L6231
8836  000c a30004        	cpw	x,#4
8837  000f 272d          	jreq	L6231
8838  0011 a30008        	cpw	x,#8
8839  0014 2728          	jreq	L6231
8840  0016 a30010        	cpw	x,#16
8841  0019 2723          	jreq	L6231
8842  001b a30020        	cpw	x,#32
8843  001e 271e          	jreq	L6231
8844  0020 a30040        	cpw	x,#64
8845  0023 2719          	jreq	L6231
8846  0025 a30080        	cpw	x,#128
8847  0028 2714          	jreq	L6231
8848  002a a30200        	cpw	x,#512
8849  002d 270f          	jreq	L6231
8850  002f a30400        	cpw	x,#1024
8851  0032 270a          	jreq	L6231
8852  0034 a30800        	cpw	x,#2048
8853  0037 2705          	jreq	L6231
8854  0039 a31000        	cpw	x,#4096
8855  003c 2603          	jrne	L4231
8856  003e               L6231:
8857  003e 4f            	clr	a
8858  003f 2010          	jra	L0331
8859  0041               L4231:
8860  0041 ae0805        	ldw	x,#2053
8861  0044 89            	pushw	x
8862  0045 ae0000        	ldw	x,#0
8863  0048 89            	pushw	x
8864  0049 ae0000        	ldw	x,#L101
8865  004c cd0000        	call	_assert_failed
8867  004f 5b04          	addw	sp,#4
8868  0051               L0331:
8869                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8871  0051 c65255        	ld	a,21077
8872  0054 1404          	and	a,(OFST+2,sp)
8873  0056 6b01          	ld	(OFST-1,sp),a
8874                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8876  0058 7b03          	ld	a,(OFST+1,sp)
8877  005a 6b02          	ld	(OFST+0,sp),a
8878                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8880  005c c65256        	ld	a,21078
8881  005f 1402          	and	a,(OFST+0,sp)
8882  0061 1a01          	or	a,(OFST-1,sp)
8883  0063 2706          	jreq	L7643
8884                     ; 2060     bitstatus = SET;
8886  0065 a601          	ld	a,#1
8887  0067 6b02          	ld	(OFST+0,sp),a
8889  0069 2002          	jra	L1743
8890  006b               L7643:
8891                     ; 2064     bitstatus = RESET;
8893  006b 0f02          	clr	(OFST+0,sp)
8894  006d               L1743:
8895                     ; 2066   return (FlagStatus)(bitstatus);
8897  006d 7b02          	ld	a,(OFST+0,sp)
8900  006f 5b04          	addw	sp,#4
8901  0071 81            	ret
8937                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8937                     ; 2088 {
8938                     .text:	section	.text,new
8939  0000               _TIM1_ClearFlag:
8941  0000 89            	pushw	x
8942       00000000      OFST:	set	0
8945                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8947  0001 01            	rrwa	x,a
8948  0002 9f            	ld	a,xl
8949  0003 a4e1          	and	a,#225
8950  0005 97            	ld	xl,a
8951  0006 4f            	clr	a
8952  0007 02            	rlwa	x,a
8953  0008 5d            	tnzw	x
8954  0009 2607          	jrne	L4331
8955  000b 1e01          	ldw	x,(OFST+1,sp)
8956  000d 2703          	jreq	L4331
8957  000f 4f            	clr	a
8958  0010 2010          	jra	L6331
8959  0012               L4331:
8960  0012 ae082a        	ldw	x,#2090
8961  0015 89            	pushw	x
8962  0016 ae0000        	ldw	x,#0
8963  0019 89            	pushw	x
8964  001a ae0000        	ldw	x,#L101
8965  001d cd0000        	call	_assert_failed
8967  0020 5b04          	addw	sp,#4
8968  0022               L6331:
8969                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8971  0022 7b02          	ld	a,(OFST+2,sp)
8972  0024 43            	cpl	a
8973  0025 c75255        	ld	21077,a
8974                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8974                     ; 2095                         (uint8_t)0x1E);
8976  0028 7b01          	ld	a,(OFST+1,sp)
8977  002a 43            	cpl	a
8978  002b a41e          	and	a,#30
8979  002d c75256        	ld	21078,a
8980                     ; 2096 }
8983  0030 85            	popw	x
8984  0031 81            	ret
9049                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
9049                     ; 2113 {
9050                     .text:	section	.text,new
9051  0000               _TIM1_GetITStatus:
9053  0000 88            	push	a
9054  0001 89            	pushw	x
9055       00000002      OFST:	set	2
9058                     ; 2114   ITStatus bitstatus = RESET;
9060                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
9064                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
9066  0002 a101          	cp	a,#1
9067  0004 271c          	jreq	L4431
9068  0006 a102          	cp	a,#2
9069  0008 2718          	jreq	L4431
9070  000a a104          	cp	a,#4
9071  000c 2714          	jreq	L4431
9072  000e a108          	cp	a,#8
9073  0010 2710          	jreq	L4431
9074  0012 a110          	cp	a,#16
9075  0014 270c          	jreq	L4431
9076  0016 a120          	cp	a,#32
9077  0018 2708          	jreq	L4431
9078  001a a140          	cp	a,#64
9079  001c 2704          	jreq	L4431
9080  001e a180          	cp	a,#128
9081  0020 2603          	jrne	L2431
9082  0022               L4431:
9083  0022 4f            	clr	a
9084  0023 2010          	jra	L6431
9085  0025               L2431:
9086  0025 ae0846        	ldw	x,#2118
9087  0028 89            	pushw	x
9088  0029 ae0000        	ldw	x,#0
9089  002c 89            	pushw	x
9090  002d ae0000        	ldw	x,#L101
9091  0030 cd0000        	call	_assert_failed
9093  0033 5b04          	addw	sp,#4
9094  0035               L6431:
9095                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9097  0035 c65255        	ld	a,21077
9098  0038 1403          	and	a,(OFST+1,sp)
9099  003a 6b01          	ld	(OFST-1,sp),a
9100                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9102  003c c65254        	ld	a,21076
9103  003f 1403          	and	a,(OFST+1,sp)
9104  0041 6b02          	ld	(OFST+0,sp),a
9105                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9107  0043 0d01          	tnz	(OFST-1,sp)
9108  0045 270a          	jreq	L3453
9110  0047 0d02          	tnz	(OFST+0,sp)
9111  0049 2706          	jreq	L3453
9112                     ; 2126     bitstatus = SET;
9114  004b a601          	ld	a,#1
9115  004d 6b02          	ld	(OFST+0,sp),a
9117  004f 2002          	jra	L5453
9118  0051               L3453:
9119                     ; 2130     bitstatus = RESET;
9121  0051 0f02          	clr	(OFST+0,sp)
9122  0053               L5453:
9123                     ; 2132   return (ITStatus)(bitstatus);
9125  0053 7b02          	ld	a,(OFST+0,sp)
9128  0055 5b03          	addw	sp,#3
9129  0057 81            	ret
9166                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9166                     ; 2150 {
9167                     .text:	section	.text,new
9168  0000               _TIM1_ClearITPendingBit:
9170  0000 88            	push	a
9171       00000000      OFST:	set	0
9174                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
9176  0001 4d            	tnz	a
9177  0002 2703          	jreq	L2531
9178  0004 4f            	clr	a
9179  0005 2010          	jra	L4531
9180  0007               L2531:
9181  0007 ae0868        	ldw	x,#2152
9182  000a 89            	pushw	x
9183  000b ae0000        	ldw	x,#0
9184  000e 89            	pushw	x
9185  000f ae0000        	ldw	x,#L101
9186  0012 cd0000        	call	_assert_failed
9188  0015 5b04          	addw	sp,#4
9189  0017               L4531:
9190                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9192  0017 7b01          	ld	a,(OFST+1,sp)
9193  0019 43            	cpl	a
9194  001a c75255        	ld	21077,a
9195                     ; 2156 }
9198  001d 84            	pop	a
9199  001e 81            	ret
9251                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
9251                     ; 2175                        uint8_t TIM1_ICSelection,
9251                     ; 2176                        uint8_t TIM1_ICFilter)
9251                     ; 2177 {
9252                     .text:	section	.text,new
9253  0000               L3_TI1_Config:
9255  0000 89            	pushw	x
9256  0001 88            	push	a
9257       00000001      OFST:	set	1
9260                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9262  0002 7211525c      	bres	21084,#0
9263                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9263                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9265  0006 7b06          	ld	a,(OFST+5,sp)
9266  0008 97            	ld	xl,a
9267  0009 a610          	ld	a,#16
9268  000b 42            	mul	x,a
9269  000c 9f            	ld	a,xl
9270  000d 1a03          	or	a,(OFST+2,sp)
9271  000f 6b01          	ld	(OFST+0,sp),a
9272  0011 c65258        	ld	a,21080
9273  0014 a40c          	and	a,#12
9274  0016 1a01          	or	a,(OFST+0,sp)
9275  0018 c75258        	ld	21080,a
9276                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9278  001b 0d02          	tnz	(OFST+1,sp)
9279  001d 2706          	jreq	L3163
9280                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
9282  001f 7212525c      	bset	21084,#1
9284  0023 2004          	jra	L5163
9285  0025               L3163:
9286                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9288  0025 7213525c      	bres	21084,#1
9289  0029               L5163:
9290                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9292  0029 7210525c      	bset	21084,#0
9293                     ; 2197 }
9296  002d 5b03          	addw	sp,#3
9297  002f 81            	ret
9349                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
9349                     ; 2216                        uint8_t TIM1_ICSelection,
9349                     ; 2217                        uint8_t TIM1_ICFilter)
9349                     ; 2218 {
9350                     .text:	section	.text,new
9351  0000               L5_TI2_Config:
9353  0000 89            	pushw	x
9354  0001 88            	push	a
9355       00000001      OFST:	set	1
9358                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9360  0002 7219525c      	bres	21084,#4
9361                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9361                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9363  0006 7b06          	ld	a,(OFST+5,sp)
9364  0008 97            	ld	xl,a
9365  0009 a610          	ld	a,#16
9366  000b 42            	mul	x,a
9367  000c 9f            	ld	a,xl
9368  000d 1a03          	or	a,(OFST+2,sp)
9369  000f 6b01          	ld	(OFST+0,sp),a
9370  0011 c65259        	ld	a,21081
9371  0014 a40c          	and	a,#12
9372  0016 1a01          	or	a,(OFST+0,sp)
9373  0018 c75259        	ld	21081,a
9374                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9376  001b 0d02          	tnz	(OFST+1,sp)
9377  001d 2706          	jreq	L5463
9378                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
9380  001f 721a525c      	bset	21084,#5
9382  0023 2004          	jra	L7463
9383  0025               L5463:
9384                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9386  0025 721b525c      	bres	21084,#5
9387  0029               L7463:
9388                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9390  0029 7218525c      	bset	21084,#4
9391                     ; 2236 }
9394  002d 5b03          	addw	sp,#3
9395  002f 81            	ret
9447                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
9447                     ; 2255                        uint8_t TIM1_ICSelection,
9447                     ; 2256                        uint8_t TIM1_ICFilter)
9447                     ; 2257 {
9448                     .text:	section	.text,new
9449  0000               L7_TI3_Config:
9451  0000 89            	pushw	x
9452  0001 88            	push	a
9453       00000001      OFST:	set	1
9456                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9458  0002 7211525d      	bres	21085,#0
9459                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9459                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9461  0006 7b06          	ld	a,(OFST+5,sp)
9462  0008 97            	ld	xl,a
9463  0009 a610          	ld	a,#16
9464  000b 42            	mul	x,a
9465  000c 9f            	ld	a,xl
9466  000d 1a03          	or	a,(OFST+2,sp)
9467  000f 6b01          	ld	(OFST+0,sp),a
9468  0011 c6525a        	ld	a,21082
9469  0014 a40c          	and	a,#12
9470  0016 1a01          	or	a,(OFST+0,sp)
9471  0018 c7525a        	ld	21082,a
9472                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9474  001b 0d02          	tnz	(OFST+1,sp)
9475  001d 2706          	jreq	L7763
9476                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
9478  001f 7212525d      	bset	21085,#1
9480  0023 2004          	jra	L1073
9481  0025               L7763:
9482                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9484  0025 7213525d      	bres	21085,#1
9485  0029               L1073:
9486                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9488  0029 7210525d      	bset	21085,#0
9489                     ; 2276 }
9492  002d 5b03          	addw	sp,#3
9493  002f 81            	ret
9545                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
9545                     ; 2295                        uint8_t TIM1_ICSelection,
9545                     ; 2296                        uint8_t TIM1_ICFilter)
9545                     ; 2297 {
9546                     .text:	section	.text,new
9547  0000               L11_TI4_Config:
9549  0000 89            	pushw	x
9550  0001 88            	push	a
9551       00000001      OFST:	set	1
9554                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9556  0002 7219525d      	bres	21085,#4
9557                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9557                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9559  0006 7b06          	ld	a,(OFST+5,sp)
9560  0008 97            	ld	xl,a
9561  0009 a610          	ld	a,#16
9562  000b 42            	mul	x,a
9563  000c 9f            	ld	a,xl
9564  000d 1a03          	or	a,(OFST+2,sp)
9565  000f 6b01          	ld	(OFST+0,sp),a
9566  0011 c6525b        	ld	a,21083
9567  0014 a40c          	and	a,#12
9568  0016 1a01          	or	a,(OFST+0,sp)
9569  0018 c7525b        	ld	21083,a
9570                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9572  001b 0d02          	tnz	(OFST+1,sp)
9573  001d 2706          	jreq	L1373
9574                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9576  001f 721a525d      	bset	21085,#5
9578  0023 2004          	jra	L3373
9579  0025               L1373:
9580                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9582  0025 721b525d      	bres	21085,#5
9583  0029               L3373:
9584                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9586  0029 7218525d      	bset	21085,#4
9587                     ; 2317 }
9590  002d 5b03          	addw	sp,#3
9591  002f 81            	ret
9604                     	xdef	_TIM1_ClearITPendingBit
9605                     	xdef	_TIM1_GetITStatus
9606                     	xdef	_TIM1_ClearFlag
9607                     	xdef	_TIM1_GetFlagStatus
9608                     	xdef	_TIM1_GetPrescaler
9609                     	xdef	_TIM1_GetCounter
9610                     	xdef	_TIM1_GetCapture4
9611                     	xdef	_TIM1_GetCapture3
9612                     	xdef	_TIM1_GetCapture2
9613                     	xdef	_TIM1_GetCapture1
9614                     	xdef	_TIM1_SetIC4Prescaler
9615                     	xdef	_TIM1_SetIC3Prescaler
9616                     	xdef	_TIM1_SetIC2Prescaler
9617                     	xdef	_TIM1_SetIC1Prescaler
9618                     	xdef	_TIM1_SetCompare4
9619                     	xdef	_TIM1_SetCompare3
9620                     	xdef	_TIM1_SetCompare2
9621                     	xdef	_TIM1_SetCompare1
9622                     	xdef	_TIM1_SetAutoreload
9623                     	xdef	_TIM1_SetCounter
9624                     	xdef	_TIM1_SelectOCxM
9625                     	xdef	_TIM1_CCxNCmd
9626                     	xdef	_TIM1_CCxCmd
9627                     	xdef	_TIM1_OC4PolarityConfig
9628                     	xdef	_TIM1_OC3NPolarityConfig
9629                     	xdef	_TIM1_OC3PolarityConfig
9630                     	xdef	_TIM1_OC2NPolarityConfig
9631                     	xdef	_TIM1_OC2PolarityConfig
9632                     	xdef	_TIM1_OC1NPolarityConfig
9633                     	xdef	_TIM1_OC1PolarityConfig
9634                     	xdef	_TIM1_GenerateEvent
9635                     	xdef	_TIM1_OC4FastConfig
9636                     	xdef	_TIM1_OC3FastConfig
9637                     	xdef	_TIM1_OC2FastConfig
9638                     	xdef	_TIM1_OC1FastConfig
9639                     	xdef	_TIM1_OC4PreloadConfig
9640                     	xdef	_TIM1_OC3PreloadConfig
9641                     	xdef	_TIM1_OC2PreloadConfig
9642                     	xdef	_TIM1_OC1PreloadConfig
9643                     	xdef	_TIM1_CCPreloadControl
9644                     	xdef	_TIM1_SelectCOM
9645                     	xdef	_TIM1_ARRPreloadConfig
9646                     	xdef	_TIM1_ForcedOC4Config
9647                     	xdef	_TIM1_ForcedOC3Config
9648                     	xdef	_TIM1_ForcedOC2Config
9649                     	xdef	_TIM1_ForcedOC1Config
9650                     	xdef	_TIM1_CounterModeConfig
9651                     	xdef	_TIM1_PrescalerConfig
9652                     	xdef	_TIM1_EncoderInterfaceConfig
9653                     	xdef	_TIM1_SelectMasterSlaveMode
9654                     	xdef	_TIM1_SelectSlaveMode
9655                     	xdef	_TIM1_SelectOutputTrigger
9656                     	xdef	_TIM1_SelectOnePulseMode
9657                     	xdef	_TIM1_SelectHallSensor
9658                     	xdef	_TIM1_UpdateRequestConfig
9659                     	xdef	_TIM1_UpdateDisableConfig
9660                     	xdef	_TIM1_SelectInputTrigger
9661                     	xdef	_TIM1_TIxExternalClockConfig
9662                     	xdef	_TIM1_ETRConfig
9663                     	xdef	_TIM1_ETRClockMode2Config
9664                     	xdef	_TIM1_ETRClockMode1Config
9665                     	xdef	_TIM1_InternalClockConfig
9666                     	xdef	_TIM1_ITConfig
9667                     	xdef	_TIM1_CtrlPWMOutputs
9668                     	xdef	_TIM1_Cmd
9669                     	xdef	_TIM1_PWMIConfig
9670                     	xdef	_TIM1_ICInit
9671                     	xdef	_TIM1_BDTRConfig
9672                     	xdef	_TIM1_OC4Init
9673                     	xdef	_TIM1_OC3Init
9674                     	xdef	_TIM1_OC2Init
9675                     	xdef	_TIM1_OC1Init
9676                     	xdef	_TIM1_TimeBaseInit
9677                     	xdef	_TIM1_DeInit
9678                     	xref	_assert_failed
9679                     .const:	section	.text
9680  0000               L101:
9681  0000 2e2e5c737476  	dc.b	"..\stvd\cosmic\stm"
9682  0012 38735f737464  	dc.b	"8s_stdperiph_lib\l"
9683  0024 696272617269  	dc.b	"ibraries\stm8s_std"
9684  0036 706572697068  	dc.b	"periph_driver\src\"
9685  0048 73746d38735f  	dc.b	"stm8s_tim1.c",0
9705                     	end
