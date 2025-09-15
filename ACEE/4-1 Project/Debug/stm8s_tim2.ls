   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 52 void TIM2_DeInit(void)
  44                     ; 53 {
  46                     .text:	section	.text,new
  47  0000               _TIM2_DeInit:
  51                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  53  0000 725f5300      	clr	21248
  54                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  56  0004 725f5303      	clr	21251
  57                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  59  0008 725f5305      	clr	21253
  60                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  62  000c 725f530a      	clr	21258
  63                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  65  0010 725f530b      	clr	21259
  66                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  68  0014 725f530a      	clr	21258
  69                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  71  0018 725f530b      	clr	21259
  72                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  74  001c 725f5307      	clr	21255
  75                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  77  0020 725f5308      	clr	21256
  78                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  80  0024 725f5309      	clr	21257
  81                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  83  0028 725f530c      	clr	21260
  84                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  86  002c 725f530d      	clr	21261
  87                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  89  0030 725f530e      	clr	21262
  90                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  92  0034 35ff530f      	mov	21263,#255
  93                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  95  0038 35ff5310      	mov	21264,#255
  96                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  98  003c 725f5311      	clr	21265
  99                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 101  0040 725f5312      	clr	21266
 102                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 104  0044 725f5313      	clr	21267
 105                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 107  0048 725f5314      	clr	21268
 108                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 110  004c 725f5315      	clr	21269
 111                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 113  0050 725f5316      	clr	21270
 114                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 116  0054 725f5304      	clr	21252
 117                     ; 81 }
 120  0058 81            	ret
 288                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 288                     ; 90                         uint16_t TIM2_Period)
 288                     ; 91 {
 289                     .text:	section	.text,new
 290  0000               _TIM2_TimeBaseInit:
 292  0000 88            	push	a
 293       00000000      OFST:	set	0
 296                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 298  0001 c7530e        	ld	21262,a
 299                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 301  0004 7b04          	ld	a,(OFST+4,sp)
 302  0006 c7530f        	ld	21263,a
 303                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 305  0009 7b05          	ld	a,(OFST+5,sp)
 306  000b c75310        	ld	21264,a
 307                     ; 97 }
 310  000e 84            	pop	a
 311  000f 81            	ret
 469                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 469                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 469                     ; 110                   uint16_t TIM2_Pulse,
 469                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 469                     ; 112 {
 470                     .text:	section	.text,new
 471  0000               _TIM2_OC1Init:
 473  0000 89            	pushw	x
 474  0001 88            	push	a
 475       00000001      OFST:	set	1
 478                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 480  0002 9e            	ld	a,xh
 481  0003 4d            	tnz	a
 482  0004 2719          	jreq	L41
 483  0006 9e            	ld	a,xh
 484  0007 a110          	cp	a,#16
 485  0009 2714          	jreq	L41
 486  000b 9e            	ld	a,xh
 487  000c a120          	cp	a,#32
 488  000e 270f          	jreq	L41
 489  0010 9e            	ld	a,xh
 490  0011 a130          	cp	a,#48
 491  0013 270a          	jreq	L41
 492  0015 9e            	ld	a,xh
 493  0016 a160          	cp	a,#96
 494  0018 2705          	jreq	L41
 495  001a 9e            	ld	a,xh
 496  001b a170          	cp	a,#112
 497  001d 2603          	jrne	L21
 498  001f               L41:
 499  001f 4f            	clr	a
 500  0020 2010          	jra	L61
 501  0022               L21:
 502  0022 ae0072        	ldw	x,#114
 503  0025 89            	pushw	x
 504  0026 ae0000        	ldw	x,#0
 505  0029 89            	pushw	x
 506  002a ae0000        	ldw	x,#L702
 507  002d cd0000        	call	_assert_failed
 509  0030 5b04          	addw	sp,#4
 510  0032               L61:
 511                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 513  0032 0d03          	tnz	(OFST+2,sp)
 514  0034 2706          	jreq	L22
 515  0036 7b03          	ld	a,(OFST+2,sp)
 516  0038 a111          	cp	a,#17
 517  003a 2603          	jrne	L02
 518  003c               L22:
 519  003c 4f            	clr	a
 520  003d 2010          	jra	L42
 521  003f               L02:
 522  003f ae0073        	ldw	x,#115
 523  0042 89            	pushw	x
 524  0043 ae0000        	ldw	x,#0
 525  0046 89            	pushw	x
 526  0047 ae0000        	ldw	x,#L702
 527  004a cd0000        	call	_assert_failed
 529  004d 5b04          	addw	sp,#4
 530  004f               L42:
 531                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 533  004f 0d08          	tnz	(OFST+7,sp)
 534  0051 2706          	jreq	L03
 535  0053 7b08          	ld	a,(OFST+7,sp)
 536  0055 a122          	cp	a,#34
 537  0057 2603          	jrne	L62
 538  0059               L03:
 539  0059 4f            	clr	a
 540  005a 2010          	jra	L23
 541  005c               L62:
 542  005c ae0074        	ldw	x,#116
 543  005f 89            	pushw	x
 544  0060 ae0000        	ldw	x,#0
 545  0063 89            	pushw	x
 546  0064 ae0000        	ldw	x,#L702
 547  0067 cd0000        	call	_assert_failed
 549  006a 5b04          	addw	sp,#4
 550  006c               L23:
 551                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 553  006c c6530a        	ld	a,21258
 554  006f a4fc          	and	a,#252
 555  0071 c7530a        	ld	21258,a
 556                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 556                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 558  0074 7b08          	ld	a,(OFST+7,sp)
 559  0076 a402          	and	a,#2
 560  0078 6b01          	ld	(OFST+0,sp),a
 561  007a 7b03          	ld	a,(OFST+2,sp)
 562  007c a401          	and	a,#1
 563  007e 1a01          	or	a,(OFST+0,sp)
 564  0080 ca530a        	or	a,21258
 565  0083 c7530a        	ld	21258,a
 566                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 566                     ; 126                           (uint8_t)TIM2_OCMode);
 568  0086 c65307        	ld	a,21255
 569  0089 a48f          	and	a,#143
 570  008b 1a02          	or	a,(OFST+1,sp)
 571  008d c75307        	ld	21255,a
 572                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 574  0090 7b06          	ld	a,(OFST+5,sp)
 575  0092 c75311        	ld	21265,a
 576                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 578  0095 7b07          	ld	a,(OFST+6,sp)
 579  0097 c75312        	ld	21266,a
 580                     ; 131 }
 583  009a 5b03          	addw	sp,#3
 584  009c 81            	ret
 649                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 649                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 649                     ; 144                   uint16_t TIM2_Pulse,
 649                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 649                     ; 146 {
 650                     .text:	section	.text,new
 651  0000               _TIM2_OC2Init:
 653  0000 89            	pushw	x
 654  0001 88            	push	a
 655       00000001      OFST:	set	1
 658                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 660  0002 9e            	ld	a,xh
 661  0003 4d            	tnz	a
 662  0004 2719          	jreq	L04
 663  0006 9e            	ld	a,xh
 664  0007 a110          	cp	a,#16
 665  0009 2714          	jreq	L04
 666  000b 9e            	ld	a,xh
 667  000c a120          	cp	a,#32
 668  000e 270f          	jreq	L04
 669  0010 9e            	ld	a,xh
 670  0011 a130          	cp	a,#48
 671  0013 270a          	jreq	L04
 672  0015 9e            	ld	a,xh
 673  0016 a160          	cp	a,#96
 674  0018 2705          	jreq	L04
 675  001a 9e            	ld	a,xh
 676  001b a170          	cp	a,#112
 677  001d 2603          	jrne	L63
 678  001f               L04:
 679  001f 4f            	clr	a
 680  0020 2010          	jra	L24
 681  0022               L63:
 682  0022 ae0094        	ldw	x,#148
 683  0025 89            	pushw	x
 684  0026 ae0000        	ldw	x,#0
 685  0029 89            	pushw	x
 686  002a ae0000        	ldw	x,#L702
 687  002d cd0000        	call	_assert_failed
 689  0030 5b04          	addw	sp,#4
 690  0032               L24:
 691                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 693  0032 0d03          	tnz	(OFST+2,sp)
 694  0034 2706          	jreq	L64
 695  0036 7b03          	ld	a,(OFST+2,sp)
 696  0038 a111          	cp	a,#17
 697  003a 2603          	jrne	L44
 698  003c               L64:
 699  003c 4f            	clr	a
 700  003d 2010          	jra	L05
 701  003f               L44:
 702  003f ae0095        	ldw	x,#149
 703  0042 89            	pushw	x
 704  0043 ae0000        	ldw	x,#0
 705  0046 89            	pushw	x
 706  0047 ae0000        	ldw	x,#L702
 707  004a cd0000        	call	_assert_failed
 709  004d 5b04          	addw	sp,#4
 710  004f               L05:
 711                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 713  004f 0d08          	tnz	(OFST+7,sp)
 714  0051 2706          	jreq	L45
 715  0053 7b08          	ld	a,(OFST+7,sp)
 716  0055 a122          	cp	a,#34
 717  0057 2603          	jrne	L25
 718  0059               L45:
 719  0059 4f            	clr	a
 720  005a 2010          	jra	L65
 721  005c               L25:
 722  005c ae0096        	ldw	x,#150
 723  005f 89            	pushw	x
 724  0060 ae0000        	ldw	x,#0
 725  0063 89            	pushw	x
 726  0064 ae0000        	ldw	x,#L702
 727  0067 cd0000        	call	_assert_failed
 729  006a 5b04          	addw	sp,#4
 730  006c               L65:
 731                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 733  006c c6530a        	ld	a,21258
 734  006f a4cf          	and	a,#207
 735  0071 c7530a        	ld	21258,a
 736                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 736                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 738  0074 7b08          	ld	a,(OFST+7,sp)
 739  0076 a420          	and	a,#32
 740  0078 6b01          	ld	(OFST+0,sp),a
 741  007a 7b03          	ld	a,(OFST+2,sp)
 742  007c a410          	and	a,#16
 743  007e 1a01          	or	a,(OFST+0,sp)
 744  0080 ca530a        	or	a,21258
 745  0083 c7530a        	ld	21258,a
 746                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 746                     ; 162                           (uint8_t)TIM2_OCMode);
 748  0086 c65308        	ld	a,21256
 749  0089 a48f          	and	a,#143
 750  008b 1a02          	or	a,(OFST+1,sp)
 751  008d c75308        	ld	21256,a
 752                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 754  0090 7b06          	ld	a,(OFST+5,sp)
 755  0092 c75313        	ld	21267,a
 756                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 758  0095 7b07          	ld	a,(OFST+6,sp)
 759  0097 c75314        	ld	21268,a
 760                     ; 168 }
 763  009a 5b03          	addw	sp,#3
 764  009c 81            	ret
 829                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 829                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 829                     ; 181                   uint16_t TIM2_Pulse,
 829                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 829                     ; 183 {
 830                     .text:	section	.text,new
 831  0000               _TIM2_OC3Init:
 833  0000 89            	pushw	x
 834  0001 88            	push	a
 835       00000001      OFST:	set	1
 838                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 840  0002 9e            	ld	a,xh
 841  0003 4d            	tnz	a
 842  0004 2719          	jreq	L46
 843  0006 9e            	ld	a,xh
 844  0007 a110          	cp	a,#16
 845  0009 2714          	jreq	L46
 846  000b 9e            	ld	a,xh
 847  000c a120          	cp	a,#32
 848  000e 270f          	jreq	L46
 849  0010 9e            	ld	a,xh
 850  0011 a130          	cp	a,#48
 851  0013 270a          	jreq	L46
 852  0015 9e            	ld	a,xh
 853  0016 a160          	cp	a,#96
 854  0018 2705          	jreq	L46
 855  001a 9e            	ld	a,xh
 856  001b a170          	cp	a,#112
 857  001d 2603          	jrne	L26
 858  001f               L46:
 859  001f 4f            	clr	a
 860  0020 2010          	jra	L66
 861  0022               L26:
 862  0022 ae00b9        	ldw	x,#185
 863  0025 89            	pushw	x
 864  0026 ae0000        	ldw	x,#0
 865  0029 89            	pushw	x
 866  002a ae0000        	ldw	x,#L702
 867  002d cd0000        	call	_assert_failed
 869  0030 5b04          	addw	sp,#4
 870  0032               L66:
 871                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 873  0032 0d03          	tnz	(OFST+2,sp)
 874  0034 2706          	jreq	L27
 875  0036 7b03          	ld	a,(OFST+2,sp)
 876  0038 a111          	cp	a,#17
 877  003a 2603          	jrne	L07
 878  003c               L27:
 879  003c 4f            	clr	a
 880  003d 2010          	jra	L47
 881  003f               L07:
 882  003f ae00ba        	ldw	x,#186
 883  0042 89            	pushw	x
 884  0043 ae0000        	ldw	x,#0
 885  0046 89            	pushw	x
 886  0047 ae0000        	ldw	x,#L702
 887  004a cd0000        	call	_assert_failed
 889  004d 5b04          	addw	sp,#4
 890  004f               L47:
 891                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 893  004f 0d08          	tnz	(OFST+7,sp)
 894  0051 2706          	jreq	L001
 895  0053 7b08          	ld	a,(OFST+7,sp)
 896  0055 a122          	cp	a,#34
 897  0057 2603          	jrne	L67
 898  0059               L001:
 899  0059 4f            	clr	a
 900  005a 2010          	jra	L201
 901  005c               L67:
 902  005c ae00bb        	ldw	x,#187
 903  005f 89            	pushw	x
 904  0060 ae0000        	ldw	x,#0
 905  0063 89            	pushw	x
 906  0064 ae0000        	ldw	x,#L702
 907  0067 cd0000        	call	_assert_failed
 909  006a 5b04          	addw	sp,#4
 910  006c               L201:
 911                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 913  006c c6530b        	ld	a,21259
 914  006f a4fc          	and	a,#252
 915  0071 c7530b        	ld	21259,a
 916                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 916                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 918  0074 7b08          	ld	a,(OFST+7,sp)
 919  0076 a402          	and	a,#2
 920  0078 6b01          	ld	(OFST+0,sp),a
 921  007a 7b03          	ld	a,(OFST+2,sp)
 922  007c a401          	and	a,#1
 923  007e 1a01          	or	a,(OFST+0,sp)
 924  0080 ca530b        	or	a,21259
 925  0083 c7530b        	ld	21259,a
 926                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 926                     ; 196                           (uint8_t)TIM2_OCMode);
 928  0086 c65309        	ld	a,21257
 929  0089 a48f          	and	a,#143
 930  008b 1a02          	or	a,(OFST+1,sp)
 931  008d c75309        	ld	21257,a
 932                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 934  0090 7b06          	ld	a,(OFST+5,sp)
 935  0092 c75315        	ld	21269,a
 936                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 938  0095 7b07          	ld	a,(OFST+6,sp)
 939  0097 c75316        	ld	21270,a
 940                     ; 201 }
 943  009a 5b03          	addw	sp,#3
 944  009c 81            	ret
1138                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1138                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1138                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1138                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1138                     ; 216                  uint8_t TIM2_ICFilter)
1138                     ; 217 {
1139                     .text:	section	.text,new
1140  0000               _TIM2_ICInit:
1142  0000 89            	pushw	x
1143       00000000      OFST:	set	0
1146                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1148  0001 9e            	ld	a,xh
1149  0002 4d            	tnz	a
1150  0003 270a          	jreq	L011
1151  0005 9e            	ld	a,xh
1152  0006 a101          	cp	a,#1
1153  0008 2705          	jreq	L011
1154  000a 9e            	ld	a,xh
1155  000b a102          	cp	a,#2
1156  000d 2603          	jrne	L601
1157  000f               L011:
1158  000f 4f            	clr	a
1159  0010 2010          	jra	L211
1160  0012               L601:
1161  0012 ae00db        	ldw	x,#219
1162  0015 89            	pushw	x
1163  0016 ae0000        	ldw	x,#0
1164  0019 89            	pushw	x
1165  001a ae0000        	ldw	x,#L702
1166  001d cd0000        	call	_assert_failed
1168  0020 5b04          	addw	sp,#4
1169  0022               L211:
1170                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1172  0022 0d02          	tnz	(OFST+2,sp)
1173  0024 2706          	jreq	L611
1174  0026 7b02          	ld	a,(OFST+2,sp)
1175  0028 a144          	cp	a,#68
1176  002a 2603          	jrne	L411
1177  002c               L611:
1178  002c 4f            	clr	a
1179  002d 2010          	jra	L021
1180  002f               L411:
1181  002f ae00dc        	ldw	x,#220
1182  0032 89            	pushw	x
1183  0033 ae0000        	ldw	x,#0
1184  0036 89            	pushw	x
1185  0037 ae0000        	ldw	x,#L702
1186  003a cd0000        	call	_assert_failed
1188  003d 5b04          	addw	sp,#4
1189  003f               L021:
1190                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1192  003f 7b05          	ld	a,(OFST+5,sp)
1193  0041 a101          	cp	a,#1
1194  0043 270c          	jreq	L421
1195  0045 7b05          	ld	a,(OFST+5,sp)
1196  0047 a102          	cp	a,#2
1197  0049 2706          	jreq	L421
1198  004b 7b05          	ld	a,(OFST+5,sp)
1199  004d a103          	cp	a,#3
1200  004f 2603          	jrne	L221
1201  0051               L421:
1202  0051 4f            	clr	a
1203  0052 2010          	jra	L621
1204  0054               L221:
1205  0054 ae00dd        	ldw	x,#221
1206  0057 89            	pushw	x
1207  0058 ae0000        	ldw	x,#0
1208  005b 89            	pushw	x
1209  005c ae0000        	ldw	x,#L702
1210  005f cd0000        	call	_assert_failed
1212  0062 5b04          	addw	sp,#4
1213  0064               L621:
1214                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1216  0064 0d06          	tnz	(OFST+6,sp)
1217  0066 2712          	jreq	L231
1218  0068 7b06          	ld	a,(OFST+6,sp)
1219  006a a104          	cp	a,#4
1220  006c 270c          	jreq	L231
1221  006e 7b06          	ld	a,(OFST+6,sp)
1222  0070 a108          	cp	a,#8
1223  0072 2706          	jreq	L231
1224  0074 7b06          	ld	a,(OFST+6,sp)
1225  0076 a10c          	cp	a,#12
1226  0078 2603          	jrne	L031
1227  007a               L231:
1228  007a 4f            	clr	a
1229  007b 2010          	jra	L431
1230  007d               L031:
1231  007d ae00de        	ldw	x,#222
1232  0080 89            	pushw	x
1233  0081 ae0000        	ldw	x,#0
1234  0084 89            	pushw	x
1235  0085 ae0000        	ldw	x,#L702
1236  0088 cd0000        	call	_assert_failed
1238  008b 5b04          	addw	sp,#4
1239  008d               L431:
1240                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1242  008d 7b07          	ld	a,(OFST+7,sp)
1243  008f a110          	cp	a,#16
1244  0091 2403          	jruge	L631
1245  0093 4f            	clr	a
1246  0094 2010          	jra	L041
1247  0096               L631:
1248  0096 ae00df        	ldw	x,#223
1249  0099 89            	pushw	x
1250  009a ae0000        	ldw	x,#0
1251  009d 89            	pushw	x
1252  009e ae0000        	ldw	x,#L702
1253  00a1 cd0000        	call	_assert_failed
1255  00a4 5b04          	addw	sp,#4
1256  00a6               L041:
1257                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1259  00a6 0d01          	tnz	(OFST+1,sp)
1260  00a8 2614          	jrne	L304
1261                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1261                     ; 229                (uint8_t)TIM2_ICSelection,
1261                     ; 230                (uint8_t)TIM2_ICFilter);
1263  00aa 7b07          	ld	a,(OFST+7,sp)
1264  00ac 88            	push	a
1265  00ad 7b06          	ld	a,(OFST+6,sp)
1266  00af 97            	ld	xl,a
1267  00b0 7b03          	ld	a,(OFST+3,sp)
1268  00b2 95            	ld	xh,a
1269  00b3 cd0000        	call	L3_TI1_Config
1271  00b6 84            	pop	a
1272                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1274  00b7 7b06          	ld	a,(OFST+6,sp)
1275  00b9 cd0000        	call	_TIM2_SetIC1Prescaler
1278  00bc 202c          	jra	L504
1279  00be               L304:
1280                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1282  00be 7b01          	ld	a,(OFST+1,sp)
1283  00c0 a101          	cp	a,#1
1284  00c2 2614          	jrne	L704
1285                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1285                     ; 239                (uint8_t)TIM2_ICSelection,
1285                     ; 240                (uint8_t)TIM2_ICFilter);
1287  00c4 7b07          	ld	a,(OFST+7,sp)
1288  00c6 88            	push	a
1289  00c7 7b06          	ld	a,(OFST+6,sp)
1290  00c9 97            	ld	xl,a
1291  00ca 7b03          	ld	a,(OFST+3,sp)
1292  00cc 95            	ld	xh,a
1293  00cd cd0000        	call	L5_TI2_Config
1295  00d0 84            	pop	a
1296                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1298  00d1 7b06          	ld	a,(OFST+6,sp)
1299  00d3 cd0000        	call	_TIM2_SetIC2Prescaler
1302  00d6 2012          	jra	L504
1303  00d8               L704:
1304                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1304                     ; 249                (uint8_t)TIM2_ICSelection,
1304                     ; 250                (uint8_t)TIM2_ICFilter);
1306  00d8 7b07          	ld	a,(OFST+7,sp)
1307  00da 88            	push	a
1308  00db 7b06          	ld	a,(OFST+6,sp)
1309  00dd 97            	ld	xl,a
1310  00de 7b03          	ld	a,(OFST+3,sp)
1311  00e0 95            	ld	xh,a
1312  00e1 cd0000        	call	L7_TI3_Config
1314  00e4 84            	pop	a
1315                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1317  00e5 7b06          	ld	a,(OFST+6,sp)
1318  00e7 cd0000        	call	_TIM2_SetIC3Prescaler
1320  00ea               L504:
1321                     ; 255 }
1324  00ea 85            	popw	x
1325  00eb 81            	ret
1422                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1422                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1422                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1422                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1422                     ; 270                      uint8_t TIM2_ICFilter)
1422                     ; 271 {
1423                     .text:	section	.text,new
1424  0000               _TIM2_PWMIConfig:
1426  0000 89            	pushw	x
1427  0001 89            	pushw	x
1428       00000002      OFST:	set	2
1431                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1433                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1435                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1437  0002 9e            	ld	a,xh
1438  0003 4d            	tnz	a
1439  0004 2705          	jreq	L641
1440  0006 9e            	ld	a,xh
1441  0007 a101          	cp	a,#1
1442  0009 2603          	jrne	L441
1443  000b               L641:
1444  000b 4f            	clr	a
1445  000c 2010          	jra	L051
1446  000e               L441:
1447  000e ae0114        	ldw	x,#276
1448  0011 89            	pushw	x
1449  0012 ae0000        	ldw	x,#0
1450  0015 89            	pushw	x
1451  0016 ae0000        	ldw	x,#L702
1452  0019 cd0000        	call	_assert_failed
1454  001c 5b04          	addw	sp,#4
1455  001e               L051:
1456                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1458  001e 0d04          	tnz	(OFST+2,sp)
1459  0020 2706          	jreq	L451
1460  0022 7b04          	ld	a,(OFST+2,sp)
1461  0024 a144          	cp	a,#68
1462  0026 2603          	jrne	L251
1463  0028               L451:
1464  0028 4f            	clr	a
1465  0029 2010          	jra	L651
1466  002b               L251:
1467  002b ae0115        	ldw	x,#277
1468  002e 89            	pushw	x
1469  002f ae0000        	ldw	x,#0
1470  0032 89            	pushw	x
1471  0033 ae0000        	ldw	x,#L702
1472  0036 cd0000        	call	_assert_failed
1474  0039 5b04          	addw	sp,#4
1475  003b               L651:
1476                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1478  003b 7b07          	ld	a,(OFST+5,sp)
1479  003d a101          	cp	a,#1
1480  003f 270c          	jreq	L261
1481  0041 7b07          	ld	a,(OFST+5,sp)
1482  0043 a102          	cp	a,#2
1483  0045 2706          	jreq	L261
1484  0047 7b07          	ld	a,(OFST+5,sp)
1485  0049 a103          	cp	a,#3
1486  004b 2603          	jrne	L061
1487  004d               L261:
1488  004d 4f            	clr	a
1489  004e 2010          	jra	L461
1490  0050               L061:
1491  0050 ae0116        	ldw	x,#278
1492  0053 89            	pushw	x
1493  0054 ae0000        	ldw	x,#0
1494  0057 89            	pushw	x
1495  0058 ae0000        	ldw	x,#L702
1496  005b cd0000        	call	_assert_failed
1498  005e 5b04          	addw	sp,#4
1499  0060               L461:
1500                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1502  0060 0d08          	tnz	(OFST+6,sp)
1503  0062 2712          	jreq	L071
1504  0064 7b08          	ld	a,(OFST+6,sp)
1505  0066 a104          	cp	a,#4
1506  0068 270c          	jreq	L071
1507  006a 7b08          	ld	a,(OFST+6,sp)
1508  006c a108          	cp	a,#8
1509  006e 2706          	jreq	L071
1510  0070 7b08          	ld	a,(OFST+6,sp)
1511  0072 a10c          	cp	a,#12
1512  0074 2603          	jrne	L661
1513  0076               L071:
1514  0076 4f            	clr	a
1515  0077 2010          	jra	L271
1516  0079               L661:
1517  0079 ae0117        	ldw	x,#279
1518  007c 89            	pushw	x
1519  007d ae0000        	ldw	x,#0
1520  0080 89            	pushw	x
1521  0081 ae0000        	ldw	x,#L702
1522  0084 cd0000        	call	_assert_failed
1524  0087 5b04          	addw	sp,#4
1525  0089               L271:
1526                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1528  0089 7b04          	ld	a,(OFST+2,sp)
1529  008b a144          	cp	a,#68
1530  008d 2706          	jreq	L164
1531                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1533  008f a644          	ld	a,#68
1534  0091 6b01          	ld	(OFST-1,sp),a
1536  0093 2002          	jra	L364
1537  0095               L164:
1538                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1540  0095 0f01          	clr	(OFST-1,sp)
1541  0097               L364:
1542                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1544  0097 7b07          	ld	a,(OFST+5,sp)
1545  0099 a101          	cp	a,#1
1546  009b 2606          	jrne	L564
1547                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1549  009d a602          	ld	a,#2
1550  009f 6b02          	ld	(OFST+0,sp),a
1552  00a1 2004          	jra	L764
1553  00a3               L564:
1554                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1556  00a3 a601          	ld	a,#1
1557  00a5 6b02          	ld	(OFST+0,sp),a
1558  00a7               L764:
1559                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1561  00a7 0d03          	tnz	(OFST+1,sp)
1562  00a9 2626          	jrne	L174
1563                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1563                     ; 305                (uint8_t)TIM2_ICFilter);
1565  00ab 7b09          	ld	a,(OFST+7,sp)
1566  00ad 88            	push	a
1567  00ae 7b08          	ld	a,(OFST+6,sp)
1568  00b0 97            	ld	xl,a
1569  00b1 7b05          	ld	a,(OFST+3,sp)
1570  00b3 95            	ld	xh,a
1571  00b4 cd0000        	call	L3_TI1_Config
1573  00b7 84            	pop	a
1574                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1576  00b8 7b08          	ld	a,(OFST+6,sp)
1577  00ba cd0000        	call	_TIM2_SetIC1Prescaler
1579                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1581  00bd 7b09          	ld	a,(OFST+7,sp)
1582  00bf 88            	push	a
1583  00c0 7b03          	ld	a,(OFST+1,sp)
1584  00c2 97            	ld	xl,a
1585  00c3 7b02          	ld	a,(OFST+0,sp)
1586  00c5 95            	ld	xh,a
1587  00c6 cd0000        	call	L5_TI2_Config
1589  00c9 84            	pop	a
1590                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1592  00ca 7b08          	ld	a,(OFST+6,sp)
1593  00cc cd0000        	call	_TIM2_SetIC2Prescaler
1596  00cf 2024          	jra	L374
1597  00d1               L174:
1598                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1598                     ; 320                (uint8_t)TIM2_ICFilter);
1600  00d1 7b09          	ld	a,(OFST+7,sp)
1601  00d3 88            	push	a
1602  00d4 7b08          	ld	a,(OFST+6,sp)
1603  00d6 97            	ld	xl,a
1604  00d7 7b05          	ld	a,(OFST+3,sp)
1605  00d9 95            	ld	xh,a
1606  00da cd0000        	call	L5_TI2_Config
1608  00dd 84            	pop	a
1609                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1611  00de 7b08          	ld	a,(OFST+6,sp)
1612  00e0 cd0000        	call	_TIM2_SetIC2Prescaler
1614                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1616  00e3 7b09          	ld	a,(OFST+7,sp)
1617  00e5 88            	push	a
1618  00e6 7b03          	ld	a,(OFST+1,sp)
1619  00e8 97            	ld	xl,a
1620  00e9 7b02          	ld	a,(OFST+0,sp)
1621  00eb 95            	ld	xh,a
1622  00ec cd0000        	call	L3_TI1_Config
1624  00ef 84            	pop	a
1625                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1627  00f0 7b08          	ld	a,(OFST+6,sp)
1628  00f2 cd0000        	call	_TIM2_SetIC1Prescaler
1630  00f5               L374:
1631                     ; 331 }
1634  00f5 5b04          	addw	sp,#4
1635  00f7 81            	ret
1691                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1691                     ; 340 {
1692                     .text:	section	.text,new
1693  0000               _TIM2_Cmd:
1695  0000 88            	push	a
1696       00000000      OFST:	set	0
1699                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1701  0001 4d            	tnz	a
1702  0002 2704          	jreq	L002
1703  0004 a101          	cp	a,#1
1704  0006 2603          	jrne	L671
1705  0008               L002:
1706  0008 4f            	clr	a
1707  0009 2010          	jra	L202
1708  000b               L671:
1709  000b ae0156        	ldw	x,#342
1710  000e 89            	pushw	x
1711  000f ae0000        	ldw	x,#0
1712  0012 89            	pushw	x
1713  0013 ae0000        	ldw	x,#L702
1714  0016 cd0000        	call	_assert_failed
1716  0019 5b04          	addw	sp,#4
1717  001b               L202:
1718                     ; 345   if (NewState != DISABLE)
1720  001b 0d01          	tnz	(OFST+1,sp)
1721  001d 2706          	jreq	L325
1722                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1724  001f 72105300      	bset	21248,#0
1726  0023 2004          	jra	L525
1727  0025               L325:
1728                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1730  0025 72115300      	bres	21248,#0
1731  0029               L525:
1732                     ; 353 }
1735  0029 84            	pop	a
1736  002a 81            	ret
1816                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1816                     ; 369 {
1817                     .text:	section	.text,new
1818  0000               _TIM2_ITConfig:
1820  0000 89            	pushw	x
1821       00000000      OFST:	set	0
1824                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1826  0001 9e            	ld	a,xh
1827  0002 4d            	tnz	a
1828  0003 2708          	jreq	L602
1829  0005 9e            	ld	a,xh
1830  0006 a110          	cp	a,#16
1831  0008 2403          	jruge	L602
1832  000a 4f            	clr	a
1833  000b 2010          	jra	L012
1834  000d               L602:
1835  000d ae0173        	ldw	x,#371
1836  0010 89            	pushw	x
1837  0011 ae0000        	ldw	x,#0
1838  0014 89            	pushw	x
1839  0015 ae0000        	ldw	x,#L702
1840  0018 cd0000        	call	_assert_failed
1842  001b 5b04          	addw	sp,#4
1843  001d               L012:
1844                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1846  001d 0d02          	tnz	(OFST+2,sp)
1847  001f 2706          	jreq	L412
1848  0021 7b02          	ld	a,(OFST+2,sp)
1849  0023 a101          	cp	a,#1
1850  0025 2603          	jrne	L212
1851  0027               L412:
1852  0027 4f            	clr	a
1853  0028 2010          	jra	L612
1854  002a               L212:
1855  002a ae0174        	ldw	x,#372
1856  002d 89            	pushw	x
1857  002e ae0000        	ldw	x,#0
1858  0031 89            	pushw	x
1859  0032 ae0000        	ldw	x,#L702
1860  0035 cd0000        	call	_assert_failed
1862  0038 5b04          	addw	sp,#4
1863  003a               L612:
1864                     ; 374   if (NewState != DISABLE)
1866  003a 0d02          	tnz	(OFST+2,sp)
1867  003c 270a          	jreq	L565
1868                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1870  003e c65303        	ld	a,21251
1871  0041 1a01          	or	a,(OFST+1,sp)
1872  0043 c75303        	ld	21251,a
1874  0046 2009          	jra	L765
1875  0048               L565:
1876                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1878  0048 7b01          	ld	a,(OFST+1,sp)
1879  004a 43            	cpl	a
1880  004b c45303        	and	a,21251
1881  004e c75303        	ld	21251,a
1882  0051               L765:
1883                     ; 384 }
1886  0051 85            	popw	x
1887  0052 81            	ret
1924                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1924                     ; 393 {
1925                     .text:	section	.text,new
1926  0000               _TIM2_UpdateDisableConfig:
1928  0000 88            	push	a
1929       00000000      OFST:	set	0
1932                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1934  0001 4d            	tnz	a
1935  0002 2704          	jreq	L422
1936  0004 a101          	cp	a,#1
1937  0006 2603          	jrne	L222
1938  0008               L422:
1939  0008 4f            	clr	a
1940  0009 2010          	jra	L622
1941  000b               L222:
1942  000b ae018b        	ldw	x,#395
1943  000e 89            	pushw	x
1944  000f ae0000        	ldw	x,#0
1945  0012 89            	pushw	x
1946  0013 ae0000        	ldw	x,#L702
1947  0016 cd0000        	call	_assert_failed
1949  0019 5b04          	addw	sp,#4
1950  001b               L622:
1951                     ; 398   if (NewState != DISABLE)
1953  001b 0d01          	tnz	(OFST+1,sp)
1954  001d 2706          	jreq	L706
1955                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1957  001f 72125300      	bset	21248,#1
1959  0023 2004          	jra	L116
1960  0025               L706:
1961                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1963  0025 72135300      	bres	21248,#1
1964  0029               L116:
1965                     ; 406 }
1968  0029 84            	pop	a
1969  002a 81            	ret
2028                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2028                     ; 417 {
2029                     .text:	section	.text,new
2030  0000               _TIM2_UpdateRequestConfig:
2032  0000 88            	push	a
2033       00000000      OFST:	set	0
2036                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2038  0001 4d            	tnz	a
2039  0002 2704          	jreq	L432
2040  0004 a101          	cp	a,#1
2041  0006 2603          	jrne	L232
2042  0008               L432:
2043  0008 4f            	clr	a
2044  0009 2010          	jra	L632
2045  000b               L232:
2046  000b ae01a3        	ldw	x,#419
2047  000e 89            	pushw	x
2048  000f ae0000        	ldw	x,#0
2049  0012 89            	pushw	x
2050  0013 ae0000        	ldw	x,#L702
2051  0016 cd0000        	call	_assert_failed
2053  0019 5b04          	addw	sp,#4
2054  001b               L632:
2055                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2057  001b 0d01          	tnz	(OFST+1,sp)
2058  001d 2706          	jreq	L146
2059                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2061  001f 72145300      	bset	21248,#2
2063  0023 2004          	jra	L346
2064  0025               L146:
2065                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2067  0025 72155300      	bres	21248,#2
2068  0029               L346:
2069                     ; 430 }
2072  0029 84            	pop	a
2073  002a 81            	ret
2131                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2131                     ; 441 {
2132                     .text:	section	.text,new
2133  0000               _TIM2_SelectOnePulseMode:
2135  0000 88            	push	a
2136       00000000      OFST:	set	0
2139                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2141  0001 a101          	cp	a,#1
2142  0003 2703          	jreq	L442
2143  0005 4d            	tnz	a
2144  0006 2603          	jrne	L242
2145  0008               L442:
2146  0008 4f            	clr	a
2147  0009 2010          	jra	L642
2148  000b               L242:
2149  000b ae01bb        	ldw	x,#443
2150  000e 89            	pushw	x
2151  000f ae0000        	ldw	x,#0
2152  0012 89            	pushw	x
2153  0013 ae0000        	ldw	x,#L702
2154  0016 cd0000        	call	_assert_failed
2156  0019 5b04          	addw	sp,#4
2157  001b               L642:
2158                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2160  001b 0d01          	tnz	(OFST+1,sp)
2161  001d 2706          	jreq	L376
2162                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2164  001f 72165300      	bset	21248,#3
2166  0023 2004          	jra	L576
2167  0025               L376:
2168                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2170  0025 72175300      	bres	21248,#3
2171  0029               L576:
2172                     ; 454 }
2175  0029 84            	pop	a
2176  002a 81            	ret
2245                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2245                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2245                     ; 486 {
2246                     .text:	section	.text,new
2247  0000               _TIM2_PrescalerConfig:
2249  0000 89            	pushw	x
2250       00000000      OFST:	set	0
2253                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2255  0001 9f            	ld	a,xl
2256  0002 4d            	tnz	a
2257  0003 2705          	jreq	L452
2258  0005 9f            	ld	a,xl
2259  0006 a101          	cp	a,#1
2260  0008 2603          	jrne	L252
2261  000a               L452:
2262  000a 4f            	clr	a
2263  000b 2010          	jra	L652
2264  000d               L252:
2265  000d ae01e8        	ldw	x,#488
2266  0010 89            	pushw	x
2267  0011 ae0000        	ldw	x,#0
2268  0014 89            	pushw	x
2269  0015 ae0000        	ldw	x,#L702
2270  0018 cd0000        	call	_assert_failed
2272  001b 5b04          	addw	sp,#4
2273  001d               L652:
2274                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2276  001d 0d01          	tnz	(OFST+1,sp)
2277  001f 275a          	jreq	L262
2278  0021 7b01          	ld	a,(OFST+1,sp)
2279  0023 a101          	cp	a,#1
2280  0025 2754          	jreq	L262
2281  0027 7b01          	ld	a,(OFST+1,sp)
2282  0029 a102          	cp	a,#2
2283  002b 274e          	jreq	L262
2284  002d 7b01          	ld	a,(OFST+1,sp)
2285  002f a103          	cp	a,#3
2286  0031 2748          	jreq	L262
2287  0033 7b01          	ld	a,(OFST+1,sp)
2288  0035 a104          	cp	a,#4
2289  0037 2742          	jreq	L262
2290  0039 7b01          	ld	a,(OFST+1,sp)
2291  003b a105          	cp	a,#5
2292  003d 273c          	jreq	L262
2293  003f 7b01          	ld	a,(OFST+1,sp)
2294  0041 a106          	cp	a,#6
2295  0043 2736          	jreq	L262
2296  0045 7b01          	ld	a,(OFST+1,sp)
2297  0047 a107          	cp	a,#7
2298  0049 2730          	jreq	L262
2299  004b 7b01          	ld	a,(OFST+1,sp)
2300  004d a108          	cp	a,#8
2301  004f 272a          	jreq	L262
2302  0051 7b01          	ld	a,(OFST+1,sp)
2303  0053 a109          	cp	a,#9
2304  0055 2724          	jreq	L262
2305  0057 7b01          	ld	a,(OFST+1,sp)
2306  0059 a10a          	cp	a,#10
2307  005b 271e          	jreq	L262
2308  005d 7b01          	ld	a,(OFST+1,sp)
2309  005f a10b          	cp	a,#11
2310  0061 2718          	jreq	L262
2311  0063 7b01          	ld	a,(OFST+1,sp)
2312  0065 a10c          	cp	a,#12
2313  0067 2712          	jreq	L262
2314  0069 7b01          	ld	a,(OFST+1,sp)
2315  006b a10d          	cp	a,#13
2316  006d 270c          	jreq	L262
2317  006f 7b01          	ld	a,(OFST+1,sp)
2318  0071 a10e          	cp	a,#14
2319  0073 2706          	jreq	L262
2320  0075 7b01          	ld	a,(OFST+1,sp)
2321  0077 a10f          	cp	a,#15
2322  0079 2603          	jrne	L062
2323  007b               L262:
2324  007b 4f            	clr	a
2325  007c 2010          	jra	L462
2326  007e               L062:
2327  007e ae01e9        	ldw	x,#489
2328  0081 89            	pushw	x
2329  0082 ae0000        	ldw	x,#0
2330  0085 89            	pushw	x
2331  0086 ae0000        	ldw	x,#L702
2332  0089 cd0000        	call	_assert_failed
2334  008c 5b04          	addw	sp,#4
2335  008e               L462:
2336                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2338  008e 7b01          	ld	a,(OFST+1,sp)
2339  0090 c7530e        	ld	21262,a
2340                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2342  0093 7b02          	ld	a,(OFST+2,sp)
2343  0095 c75306        	ld	21254,a
2344                     ; 496 }
2347  0098 85            	popw	x
2348  0099 81            	ret
2407                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2407                     ; 508 {
2408                     .text:	section	.text,new
2409  0000               _TIM2_ForcedOC1Config:
2411  0000 88            	push	a
2412       00000000      OFST:	set	0
2415                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2417  0001 a150          	cp	a,#80
2418  0003 2704          	jreq	L272
2419  0005 a140          	cp	a,#64
2420  0007 2603          	jrne	L072
2421  0009               L272:
2422  0009 4f            	clr	a
2423  000a 2010          	jra	L472
2424  000c               L072:
2425  000c ae01fe        	ldw	x,#510
2426  000f 89            	pushw	x
2427  0010 ae0000        	ldw	x,#0
2428  0013 89            	pushw	x
2429  0014 ae0000        	ldw	x,#L702
2430  0017 cd0000        	call	_assert_failed
2432  001a 5b04          	addw	sp,#4
2433  001c               L472:
2434                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2434                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2436  001c c65307        	ld	a,21255
2437  001f a48f          	and	a,#143
2438  0021 1a01          	or	a,(OFST+1,sp)
2439  0023 c75307        	ld	21255,a
2440                     ; 515 }
2443  0026 84            	pop	a
2444  0027 81            	ret
2481                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2481                     ; 527 {
2482                     .text:	section	.text,new
2483  0000               _TIM2_ForcedOC2Config:
2485  0000 88            	push	a
2486       00000000      OFST:	set	0
2489                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2491  0001 a150          	cp	a,#80
2492  0003 2704          	jreq	L203
2493  0005 a140          	cp	a,#64
2494  0007 2603          	jrne	L003
2495  0009               L203:
2496  0009 4f            	clr	a
2497  000a 2010          	jra	L403
2498  000c               L003:
2499  000c ae0211        	ldw	x,#529
2500  000f 89            	pushw	x
2501  0010 ae0000        	ldw	x,#0
2502  0013 89            	pushw	x
2503  0014 ae0000        	ldw	x,#L702
2504  0017 cd0000        	call	_assert_failed
2506  001a 5b04          	addw	sp,#4
2507  001c               L403:
2508                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2508                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2510  001c c65308        	ld	a,21256
2511  001f a48f          	and	a,#143
2512  0021 1a01          	or	a,(OFST+1,sp)
2513  0023 c75308        	ld	21256,a
2514                     ; 534 }
2517  0026 84            	pop	a
2518  0027 81            	ret
2555                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2555                     ; 546 {
2556                     .text:	section	.text,new
2557  0000               _TIM2_ForcedOC3Config:
2559  0000 88            	push	a
2560       00000000      OFST:	set	0
2563                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2565  0001 a150          	cp	a,#80
2566  0003 2704          	jreq	L213
2567  0005 a140          	cp	a,#64
2568  0007 2603          	jrne	L013
2569  0009               L213:
2570  0009 4f            	clr	a
2571  000a 2010          	jra	L413
2572  000c               L013:
2573  000c ae0224        	ldw	x,#548
2574  000f 89            	pushw	x
2575  0010 ae0000        	ldw	x,#0
2576  0013 89            	pushw	x
2577  0014 ae0000        	ldw	x,#L702
2578  0017 cd0000        	call	_assert_failed
2580  001a 5b04          	addw	sp,#4
2581  001c               L413:
2582                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2582                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2584  001c c65309        	ld	a,21257
2585  001f a48f          	and	a,#143
2586  0021 1a01          	or	a,(OFST+1,sp)
2587  0023 c75309        	ld	21257,a
2588                     ; 553 }
2591  0026 84            	pop	a
2592  0027 81            	ret
2629                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2629                     ; 562 {
2630                     .text:	section	.text,new
2631  0000               _TIM2_ARRPreloadConfig:
2633  0000 88            	push	a
2634       00000000      OFST:	set	0
2637                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2639  0001 4d            	tnz	a
2640  0002 2704          	jreq	L223
2641  0004 a101          	cp	a,#1
2642  0006 2603          	jrne	L023
2643  0008               L223:
2644  0008 4f            	clr	a
2645  0009 2010          	jra	L423
2646  000b               L023:
2647  000b ae0234        	ldw	x,#564
2648  000e 89            	pushw	x
2649  000f ae0000        	ldw	x,#0
2650  0012 89            	pushw	x
2651  0013 ae0000        	ldw	x,#L702
2652  0016 cd0000        	call	_assert_failed
2654  0019 5b04          	addw	sp,#4
2655  001b               L423:
2656                     ; 567   if (NewState != DISABLE)
2658  001b 0d01          	tnz	(OFST+1,sp)
2659  001d 2706          	jreq	L1301
2660                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2662  001f 721e5300      	bset	21248,#7
2664  0023 2004          	jra	L3301
2665  0025               L1301:
2666                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2668  0025 721f5300      	bres	21248,#7
2669  0029               L3301:
2670                     ; 575 }
2673  0029 84            	pop	a
2674  002a 81            	ret
2711                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2711                     ; 584 {
2712                     .text:	section	.text,new
2713  0000               _TIM2_OC1PreloadConfig:
2715  0000 88            	push	a
2716       00000000      OFST:	set	0
2719                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2721  0001 4d            	tnz	a
2722  0002 2704          	jreq	L233
2723  0004 a101          	cp	a,#1
2724  0006 2603          	jrne	L033
2725  0008               L233:
2726  0008 4f            	clr	a
2727  0009 2010          	jra	L433
2728  000b               L033:
2729  000b ae024a        	ldw	x,#586
2730  000e 89            	pushw	x
2731  000f ae0000        	ldw	x,#0
2732  0012 89            	pushw	x
2733  0013 ae0000        	ldw	x,#L702
2734  0016 cd0000        	call	_assert_failed
2736  0019 5b04          	addw	sp,#4
2737  001b               L433:
2738                     ; 589   if (NewState != DISABLE)
2740  001b 0d01          	tnz	(OFST+1,sp)
2741  001d 2706          	jreq	L3501
2742                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2744  001f 72165307      	bset	21255,#3
2746  0023 2004          	jra	L5501
2747  0025               L3501:
2748                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2750  0025 72175307      	bres	21255,#3
2751  0029               L5501:
2752                     ; 597 }
2755  0029 84            	pop	a
2756  002a 81            	ret
2793                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2793                     ; 606 {
2794                     .text:	section	.text,new
2795  0000               _TIM2_OC2PreloadConfig:
2797  0000 88            	push	a
2798       00000000      OFST:	set	0
2801                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2803  0001 4d            	tnz	a
2804  0002 2704          	jreq	L243
2805  0004 a101          	cp	a,#1
2806  0006 2603          	jrne	L043
2807  0008               L243:
2808  0008 4f            	clr	a
2809  0009 2010          	jra	L443
2810  000b               L043:
2811  000b ae0260        	ldw	x,#608
2812  000e 89            	pushw	x
2813  000f ae0000        	ldw	x,#0
2814  0012 89            	pushw	x
2815  0013 ae0000        	ldw	x,#L702
2816  0016 cd0000        	call	_assert_failed
2818  0019 5b04          	addw	sp,#4
2819  001b               L443:
2820                     ; 611   if (NewState != DISABLE)
2822  001b 0d01          	tnz	(OFST+1,sp)
2823  001d 2706          	jreq	L5701
2824                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2826  001f 72165308      	bset	21256,#3
2828  0023 2004          	jra	L7701
2829  0025               L5701:
2830                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2832  0025 72175308      	bres	21256,#3
2833  0029               L7701:
2834                     ; 619 }
2837  0029 84            	pop	a
2838  002a 81            	ret
2875                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2875                     ; 628 {
2876                     .text:	section	.text,new
2877  0000               _TIM2_OC3PreloadConfig:
2879  0000 88            	push	a
2880       00000000      OFST:	set	0
2883                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2885  0001 4d            	tnz	a
2886  0002 2704          	jreq	L253
2887  0004 a101          	cp	a,#1
2888  0006 2603          	jrne	L053
2889  0008               L253:
2890  0008 4f            	clr	a
2891  0009 2010          	jra	L453
2892  000b               L053:
2893  000b ae0276        	ldw	x,#630
2894  000e 89            	pushw	x
2895  000f ae0000        	ldw	x,#0
2896  0012 89            	pushw	x
2897  0013 ae0000        	ldw	x,#L702
2898  0016 cd0000        	call	_assert_failed
2900  0019 5b04          	addw	sp,#4
2901  001b               L453:
2902                     ; 633   if (NewState != DISABLE)
2904  001b 0d01          	tnz	(OFST+1,sp)
2905  001d 2706          	jreq	L7111
2906                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2908  001f 72165309      	bset	21257,#3
2910  0023 2004          	jra	L1211
2911  0025               L7111:
2912                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2914  0025 72175309      	bres	21257,#3
2915  0029               L1211:
2916                     ; 641 }
2919  0029 84            	pop	a
2920  002a 81            	ret
2994                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2994                     ; 654 {
2995                     .text:	section	.text,new
2996  0000               _TIM2_GenerateEvent:
2998  0000 88            	push	a
2999       00000000      OFST:	set	0
3002                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
3004  0001 4d            	tnz	a
3005  0002 2703          	jreq	L063
3006  0004 4f            	clr	a
3007  0005 2010          	jra	L263
3008  0007               L063:
3009  0007 ae0290        	ldw	x,#656
3010  000a 89            	pushw	x
3011  000b ae0000        	ldw	x,#0
3012  000e 89            	pushw	x
3013  000f ae0000        	ldw	x,#L702
3014  0012 cd0000        	call	_assert_failed
3016  0015 5b04          	addw	sp,#4
3017  0017               L263:
3018                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
3020  0017 7b01          	ld	a,(OFST+1,sp)
3021  0019 c75306        	ld	21254,a
3022                     ; 660 }
3025  001c 84            	pop	a
3026  001d 81            	ret
3063                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3063                     ; 671 {
3064                     .text:	section	.text,new
3065  0000               _TIM2_OC1PolarityConfig:
3067  0000 88            	push	a
3068       00000000      OFST:	set	0
3071                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3073  0001 4d            	tnz	a
3074  0002 2704          	jreq	L073
3075  0004 a122          	cp	a,#34
3076  0006 2603          	jrne	L663
3077  0008               L073:
3078  0008 4f            	clr	a
3079  0009 2010          	jra	L273
3080  000b               L663:
3081  000b ae02a1        	ldw	x,#673
3082  000e 89            	pushw	x
3083  000f ae0000        	ldw	x,#0
3084  0012 89            	pushw	x
3085  0013 ae0000        	ldw	x,#L702
3086  0016 cd0000        	call	_assert_failed
3088  0019 5b04          	addw	sp,#4
3089  001b               L273:
3090                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3092  001b 0d01          	tnz	(OFST+1,sp)
3093  001d 2706          	jreq	L3711
3094                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3096  001f 7212530a      	bset	21258,#1
3098  0023 2004          	jra	L5711
3099  0025               L3711:
3100                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3102  0025 7213530a      	bres	21258,#1
3103  0029               L5711:
3104                     ; 684 }
3107  0029 84            	pop	a
3108  002a 81            	ret
3145                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3145                     ; 695 {
3146                     .text:	section	.text,new
3147  0000               _TIM2_OC2PolarityConfig:
3149  0000 88            	push	a
3150       00000000      OFST:	set	0
3153                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3155  0001 4d            	tnz	a
3156  0002 2704          	jreq	L004
3157  0004 a122          	cp	a,#34
3158  0006 2603          	jrne	L673
3159  0008               L004:
3160  0008 4f            	clr	a
3161  0009 2010          	jra	L204
3162  000b               L673:
3163  000b ae02b9        	ldw	x,#697
3164  000e 89            	pushw	x
3165  000f ae0000        	ldw	x,#0
3166  0012 89            	pushw	x
3167  0013 ae0000        	ldw	x,#L702
3168  0016 cd0000        	call	_assert_failed
3170  0019 5b04          	addw	sp,#4
3171  001b               L204:
3172                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3174  001b 0d01          	tnz	(OFST+1,sp)
3175  001d 2706          	jreq	L5121
3176                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
3178  001f 721a530a      	bset	21258,#5
3180  0023 2004          	jra	L7121
3181  0025               L5121:
3182                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3184  0025 721b530a      	bres	21258,#5
3185  0029               L7121:
3186                     ; 708 }
3189  0029 84            	pop	a
3190  002a 81            	ret
3227                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3227                     ; 719 {
3228                     .text:	section	.text,new
3229  0000               _TIM2_OC3PolarityConfig:
3231  0000 88            	push	a
3232       00000000      OFST:	set	0
3235                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3237  0001 4d            	tnz	a
3238  0002 2704          	jreq	L014
3239  0004 a122          	cp	a,#34
3240  0006 2603          	jrne	L604
3241  0008               L014:
3242  0008 4f            	clr	a
3243  0009 2010          	jra	L214
3244  000b               L604:
3245  000b ae02d1        	ldw	x,#721
3246  000e 89            	pushw	x
3247  000f ae0000        	ldw	x,#0
3248  0012 89            	pushw	x
3249  0013 ae0000        	ldw	x,#L702
3250  0016 cd0000        	call	_assert_failed
3252  0019 5b04          	addw	sp,#4
3253  001b               L214:
3254                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3256  001b 0d01          	tnz	(OFST+1,sp)
3257  001d 2706          	jreq	L7321
3258                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3260  001f 7212530b      	bset	21259,#1
3262  0023 2004          	jra	L1421
3263  0025               L7321:
3264                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3266  0025 7213530b      	bres	21259,#1
3267  0029               L1421:
3268                     ; 732 }
3271  0029 84            	pop	a
3272  002a 81            	ret
3318                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3318                     ; 746 {
3319                     .text:	section	.text,new
3320  0000               _TIM2_CCxCmd:
3322  0000 89            	pushw	x
3323       00000000      OFST:	set	0
3326                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3328  0001 9e            	ld	a,xh
3329  0002 4d            	tnz	a
3330  0003 270a          	jreq	L024
3331  0005 9e            	ld	a,xh
3332  0006 a101          	cp	a,#1
3333  0008 2705          	jreq	L024
3334  000a 9e            	ld	a,xh
3335  000b a102          	cp	a,#2
3336  000d 2603          	jrne	L614
3337  000f               L024:
3338  000f 4f            	clr	a
3339  0010 2010          	jra	L224
3340  0012               L614:
3341  0012 ae02ec        	ldw	x,#748
3342  0015 89            	pushw	x
3343  0016 ae0000        	ldw	x,#0
3344  0019 89            	pushw	x
3345  001a ae0000        	ldw	x,#L702
3346  001d cd0000        	call	_assert_failed
3348  0020 5b04          	addw	sp,#4
3349  0022               L224:
3350                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3352  0022 0d02          	tnz	(OFST+2,sp)
3353  0024 2706          	jreq	L624
3354  0026 7b02          	ld	a,(OFST+2,sp)
3355  0028 a101          	cp	a,#1
3356  002a 2603          	jrne	L424
3357  002c               L624:
3358  002c 4f            	clr	a
3359  002d 2010          	jra	L034
3360  002f               L424:
3361  002f ae02ed        	ldw	x,#749
3362  0032 89            	pushw	x
3363  0033 ae0000        	ldw	x,#0
3364  0036 89            	pushw	x
3365  0037 ae0000        	ldw	x,#L702
3366  003a cd0000        	call	_assert_failed
3368  003d 5b04          	addw	sp,#4
3369  003f               L034:
3370                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3372  003f 0d01          	tnz	(OFST+1,sp)
3373  0041 2610          	jrne	L5621
3374                     ; 754     if (NewState != DISABLE)
3376  0043 0d02          	tnz	(OFST+2,sp)
3377  0045 2706          	jreq	L7621
3378                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3380  0047 7210530a      	bset	21258,#0
3382  004b 202a          	jra	L3721
3383  004d               L7621:
3384                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3386  004d 7211530a      	bres	21258,#0
3387  0051 2024          	jra	L3721
3388  0053               L5621:
3389                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3391  0053 7b01          	ld	a,(OFST+1,sp)
3392  0055 a101          	cp	a,#1
3393  0057 2610          	jrne	L5721
3394                     ; 767     if (NewState != DISABLE)
3396  0059 0d02          	tnz	(OFST+2,sp)
3397  005b 2706          	jreq	L7721
3398                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3400  005d 7218530a      	bset	21258,#4
3402  0061 2014          	jra	L3721
3403  0063               L7721:
3404                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3406  0063 7219530a      	bres	21258,#4
3407  0067 200e          	jra	L3721
3408  0069               L5721:
3409                     ; 779     if (NewState != DISABLE)
3411  0069 0d02          	tnz	(OFST+2,sp)
3412  006b 2706          	jreq	L5031
3413                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3415  006d 7210530b      	bset	21259,#0
3417  0071 2004          	jra	L3721
3418  0073               L5031:
3419                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3421  0073 7211530b      	bres	21259,#0
3422  0077               L3721:
3423                     ; 788 }
3426  0077 85            	popw	x
3427  0078 81            	ret
3473                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3473                     ; 811 {
3474                     .text:	section	.text,new
3475  0000               _TIM2_SelectOCxM:
3477  0000 89            	pushw	x
3478       00000000      OFST:	set	0
3481                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3483  0001 9e            	ld	a,xh
3484  0002 4d            	tnz	a
3485  0003 270a          	jreq	L634
3486  0005 9e            	ld	a,xh
3487  0006 a101          	cp	a,#1
3488  0008 2705          	jreq	L634
3489  000a 9e            	ld	a,xh
3490  000b a102          	cp	a,#2
3491  000d 2603          	jrne	L434
3492  000f               L634:
3493  000f 4f            	clr	a
3494  0010 2010          	jra	L044
3495  0012               L434:
3496  0012 ae032d        	ldw	x,#813
3497  0015 89            	pushw	x
3498  0016 ae0000        	ldw	x,#0
3499  0019 89            	pushw	x
3500  001a ae0000        	ldw	x,#L702
3501  001d cd0000        	call	_assert_failed
3503  0020 5b04          	addw	sp,#4
3504  0022               L044:
3505                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3507  0022 0d02          	tnz	(OFST+2,sp)
3508  0024 272a          	jreq	L444
3509  0026 7b02          	ld	a,(OFST+2,sp)
3510  0028 a110          	cp	a,#16
3511  002a 2724          	jreq	L444
3512  002c 7b02          	ld	a,(OFST+2,sp)
3513  002e a120          	cp	a,#32
3514  0030 271e          	jreq	L444
3515  0032 7b02          	ld	a,(OFST+2,sp)
3516  0034 a130          	cp	a,#48
3517  0036 2718          	jreq	L444
3518  0038 7b02          	ld	a,(OFST+2,sp)
3519  003a a160          	cp	a,#96
3520  003c 2712          	jreq	L444
3521  003e 7b02          	ld	a,(OFST+2,sp)
3522  0040 a170          	cp	a,#112
3523  0042 270c          	jreq	L444
3524  0044 7b02          	ld	a,(OFST+2,sp)
3525  0046 a150          	cp	a,#80
3526  0048 2706          	jreq	L444
3527  004a 7b02          	ld	a,(OFST+2,sp)
3528  004c a140          	cp	a,#64
3529  004e 2603          	jrne	L244
3530  0050               L444:
3531  0050 4f            	clr	a
3532  0051 2010          	jra	L644
3533  0053               L244:
3534  0053 ae032e        	ldw	x,#814
3535  0056 89            	pushw	x
3536  0057 ae0000        	ldw	x,#0
3537  005a 89            	pushw	x
3538  005b ae0000        	ldw	x,#L702
3539  005e cd0000        	call	_assert_failed
3541  0061 5b04          	addw	sp,#4
3542  0063               L644:
3543                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3545  0063 0d01          	tnz	(OFST+1,sp)
3546  0065 2610          	jrne	L3331
3547                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3549  0067 7211530a      	bres	21258,#0
3550                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3550                     ; 823                             | (uint8_t)TIM2_OCMode);
3552  006b c65307        	ld	a,21255
3553  006e a48f          	and	a,#143
3554  0070 1a02          	or	a,(OFST+2,sp)
3555  0072 c75307        	ld	21255,a
3557  0075 2024          	jra	L5331
3558  0077               L3331:
3559                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3561  0077 7b01          	ld	a,(OFST+1,sp)
3562  0079 a101          	cp	a,#1
3563  007b 2610          	jrne	L7331
3564                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3566  007d 7219530a      	bres	21258,#4
3567                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3567                     ; 832                             | (uint8_t)TIM2_OCMode);
3569  0081 c65308        	ld	a,21256
3570  0084 a48f          	and	a,#143
3571  0086 1a02          	or	a,(OFST+2,sp)
3572  0088 c75308        	ld	21256,a
3574  008b 200e          	jra	L5331
3575  008d               L7331:
3576                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3578  008d 7211530b      	bres	21259,#0
3579                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3579                     ; 841                             | (uint8_t)TIM2_OCMode);
3581  0091 c65309        	ld	a,21257
3582  0094 a48f          	and	a,#143
3583  0096 1a02          	or	a,(OFST+2,sp)
3584  0098 c75309        	ld	21257,a
3585  009b               L5331:
3586                     ; 843 }
3589  009b 85            	popw	x
3590  009c 81            	ret
3624                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3624                     ; 852 {
3625                     .text:	section	.text,new
3626  0000               _TIM2_SetCounter:
3630                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3632  0000 9e            	ld	a,xh
3633  0001 c7530c        	ld	21260,a
3634                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3636  0004 9f            	ld	a,xl
3637  0005 c7530d        	ld	21261,a
3638                     ; 856 }
3641  0008 81            	ret
3675                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3675                     ; 865 {
3676                     .text:	section	.text,new
3677  0000               _TIM2_SetAutoreload:
3681                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3683  0000 9e            	ld	a,xh
3684  0001 c7530f        	ld	21263,a
3685                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3687  0004 9f            	ld	a,xl
3688  0005 c75310        	ld	21264,a
3689                     ; 869 }
3692  0008 81            	ret
3726                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3726                     ; 878 {
3727                     .text:	section	.text,new
3728  0000               _TIM2_SetCompare1:
3732                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3734  0000 9e            	ld	a,xh
3735  0001 c75311        	ld	21265,a
3736                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3738  0004 9f            	ld	a,xl
3739  0005 c75312        	ld	21266,a
3740                     ; 882 }
3743  0008 81            	ret
3777                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3777                     ; 891 {
3778                     .text:	section	.text,new
3779  0000               _TIM2_SetCompare2:
3783                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3785  0000 9e            	ld	a,xh
3786  0001 c75313        	ld	21267,a
3787                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3789  0004 9f            	ld	a,xl
3790  0005 c75314        	ld	21268,a
3791                     ; 895 }
3794  0008 81            	ret
3828                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3828                     ; 904 {
3829                     .text:	section	.text,new
3830  0000               _TIM2_SetCompare3:
3834                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3836  0000 9e            	ld	a,xh
3837  0001 c75315        	ld	21269,a
3838                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3840  0004 9f            	ld	a,xl
3841  0005 c75316        	ld	21270,a
3842                     ; 908 }
3845  0008 81            	ret
3882                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3882                     ; 921 {
3883                     .text:	section	.text,new
3884  0000               _TIM2_SetIC1Prescaler:
3886  0000 88            	push	a
3887       00000000      OFST:	set	0
3890                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3892  0001 4d            	tnz	a
3893  0002 270c          	jreq	L664
3894  0004 a104          	cp	a,#4
3895  0006 2708          	jreq	L664
3896  0008 a108          	cp	a,#8
3897  000a 2704          	jreq	L664
3898  000c a10c          	cp	a,#12
3899  000e 2603          	jrne	L464
3900  0010               L664:
3901  0010 4f            	clr	a
3902  0011 2010          	jra	L074
3903  0013               L464:
3904  0013 ae039b        	ldw	x,#923
3905  0016 89            	pushw	x
3906  0017 ae0000        	ldw	x,#0
3907  001a 89            	pushw	x
3908  001b ae0000        	ldw	x,#L702
3909  001e cd0000        	call	_assert_failed
3911  0021 5b04          	addw	sp,#4
3912  0023               L074:
3913                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3913                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3915  0023 c65307        	ld	a,21255
3916  0026 a4f3          	and	a,#243
3917  0028 1a01          	or	a,(OFST+1,sp)
3918  002a c75307        	ld	21255,a
3919                     ; 928 }
3922  002d 84            	pop	a
3923  002e 81            	ret
3960                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3960                     ; 941 {
3961                     .text:	section	.text,new
3962  0000               _TIM2_SetIC2Prescaler:
3964  0000 88            	push	a
3965       00000000      OFST:	set	0
3968                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3970  0001 4d            	tnz	a
3971  0002 270c          	jreq	L674
3972  0004 a104          	cp	a,#4
3973  0006 2708          	jreq	L674
3974  0008 a108          	cp	a,#8
3975  000a 2704          	jreq	L674
3976  000c a10c          	cp	a,#12
3977  000e 2603          	jrne	L474
3978  0010               L674:
3979  0010 4f            	clr	a
3980  0011 2010          	jra	L005
3981  0013               L474:
3982  0013 ae03af        	ldw	x,#943
3983  0016 89            	pushw	x
3984  0017 ae0000        	ldw	x,#0
3985  001a 89            	pushw	x
3986  001b ae0000        	ldw	x,#L702
3987  001e cd0000        	call	_assert_failed
3989  0021 5b04          	addw	sp,#4
3990  0023               L005:
3991                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3991                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3993  0023 c65308        	ld	a,21256
3994  0026 a4f3          	and	a,#243
3995  0028 1a01          	or	a,(OFST+1,sp)
3996  002a c75308        	ld	21256,a
3997                     ; 948 }
4000  002d 84            	pop	a
4001  002e 81            	ret
4038                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4038                     ; 961 {
4039                     .text:	section	.text,new
4040  0000               _TIM2_SetIC3Prescaler:
4042  0000 88            	push	a
4043       00000000      OFST:	set	0
4046                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4048  0001 4d            	tnz	a
4049  0002 270c          	jreq	L605
4050  0004 a104          	cp	a,#4
4051  0006 2708          	jreq	L605
4052  0008 a108          	cp	a,#8
4053  000a 2704          	jreq	L605
4054  000c a10c          	cp	a,#12
4055  000e 2603          	jrne	L405
4056  0010               L605:
4057  0010 4f            	clr	a
4058  0011 2010          	jra	L015
4059  0013               L405:
4060  0013 ae03c4        	ldw	x,#964
4061  0016 89            	pushw	x
4062  0017 ae0000        	ldw	x,#0
4063  001a 89            	pushw	x
4064  001b ae0000        	ldw	x,#L702
4065  001e cd0000        	call	_assert_failed
4067  0021 5b04          	addw	sp,#4
4068  0023               L015:
4069                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4069                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
4071  0023 c65309        	ld	a,21257
4072  0026 a4f3          	and	a,#243
4073  0028 1a01          	or	a,(OFST+1,sp)
4074  002a c75309        	ld	21257,a
4075                     ; 968 }
4078  002d 84            	pop	a
4079  002e 81            	ret
4131                     ; 975 uint16_t TIM2_GetCapture1(void)
4131                     ; 976 {
4132                     .text:	section	.text,new
4133  0000               _TIM2_GetCapture1:
4135  0000 5204          	subw	sp,#4
4136       00000004      OFST:	set	4
4139                     ; 978   uint16_t tmpccr1 = 0;
4141                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
4145                     ; 981   tmpccr1h = TIM2->CCR1H;
4147  0002 c65311        	ld	a,21265
4148  0005 6b02          	ld	(OFST-2,sp),a
4149                     ; 982   tmpccr1l = TIM2->CCR1L;
4151  0007 c65312        	ld	a,21266
4152  000a 6b01          	ld	(OFST-3,sp),a
4153                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
4155  000c 7b01          	ld	a,(OFST-3,sp)
4156  000e 5f            	clrw	x
4157  000f 97            	ld	xl,a
4158  0010 1f03          	ldw	(OFST-1,sp),x
4159                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4161  0012 7b02          	ld	a,(OFST-2,sp)
4162  0014 5f            	clrw	x
4163  0015 97            	ld	xl,a
4164  0016 4f            	clr	a
4165  0017 02            	rlwa	x,a
4166  0018 01            	rrwa	x,a
4167  0019 1a04          	or	a,(OFST+0,sp)
4168  001b 01            	rrwa	x,a
4169  001c 1a03          	or	a,(OFST-1,sp)
4170  001e 01            	rrwa	x,a
4171  001f 1f03          	ldw	(OFST-1,sp),x
4172                     ; 987   return (uint16_t)tmpccr1;
4174  0021 1e03          	ldw	x,(OFST-1,sp)
4177  0023 5b04          	addw	sp,#4
4178  0025 81            	ret
4230                     ; 995 uint16_t TIM2_GetCapture2(void)
4230                     ; 996 {
4231                     .text:	section	.text,new
4232  0000               _TIM2_GetCapture2:
4234  0000 5204          	subw	sp,#4
4235       00000004      OFST:	set	4
4238                     ; 998   uint16_t tmpccr2 = 0;
4240                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
4244                     ; 1001   tmpccr2h = TIM2->CCR2H;
4246  0002 c65313        	ld	a,21267
4247  0005 6b02          	ld	(OFST-2,sp),a
4248                     ; 1002   tmpccr2l = TIM2->CCR2L;
4250  0007 c65314        	ld	a,21268
4251  000a 6b01          	ld	(OFST-3,sp),a
4252                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
4254  000c 7b01          	ld	a,(OFST-3,sp)
4255  000e 5f            	clrw	x
4256  000f 97            	ld	xl,a
4257  0010 1f03          	ldw	(OFST-1,sp),x
4258                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4260  0012 7b02          	ld	a,(OFST-2,sp)
4261  0014 5f            	clrw	x
4262  0015 97            	ld	xl,a
4263  0016 4f            	clr	a
4264  0017 02            	rlwa	x,a
4265  0018 01            	rrwa	x,a
4266  0019 1a04          	or	a,(OFST+0,sp)
4267  001b 01            	rrwa	x,a
4268  001c 1a03          	or	a,(OFST-1,sp)
4269  001e 01            	rrwa	x,a
4270  001f 1f03          	ldw	(OFST-1,sp),x
4271                     ; 1007   return (uint16_t)tmpccr2;
4273  0021 1e03          	ldw	x,(OFST-1,sp)
4276  0023 5b04          	addw	sp,#4
4277  0025 81            	ret
4329                     ; 1015 uint16_t TIM2_GetCapture3(void)
4329                     ; 1016 {
4330                     .text:	section	.text,new
4331  0000               _TIM2_GetCapture3:
4333  0000 5204          	subw	sp,#4
4334       00000004      OFST:	set	4
4337                     ; 1018   uint16_t tmpccr3 = 0;
4339                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4343                     ; 1021   tmpccr3h = TIM2->CCR3H;
4345  0002 c65315        	ld	a,21269
4346  0005 6b02          	ld	(OFST-2,sp),a
4347                     ; 1022   tmpccr3l = TIM2->CCR3L;
4349  0007 c65316        	ld	a,21270
4350  000a 6b01          	ld	(OFST-3,sp),a
4351                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4353  000c 7b01          	ld	a,(OFST-3,sp)
4354  000e 5f            	clrw	x
4355  000f 97            	ld	xl,a
4356  0010 1f03          	ldw	(OFST-1,sp),x
4357                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4359  0012 7b02          	ld	a,(OFST-2,sp)
4360  0014 5f            	clrw	x
4361  0015 97            	ld	xl,a
4362  0016 4f            	clr	a
4363  0017 02            	rlwa	x,a
4364  0018 01            	rrwa	x,a
4365  0019 1a04          	or	a,(OFST+0,sp)
4366  001b 01            	rrwa	x,a
4367  001c 1a03          	or	a,(OFST-1,sp)
4368  001e 01            	rrwa	x,a
4369  001f 1f03          	ldw	(OFST-1,sp),x
4370                     ; 1027   return (uint16_t)tmpccr3;
4372  0021 1e03          	ldw	x,(OFST-1,sp)
4375  0023 5b04          	addw	sp,#4
4376  0025 81            	ret
4410                     ; 1035 uint16_t TIM2_GetCounter(void)
4410                     ; 1036 {
4411                     .text:	section	.text,new
4412  0000               _TIM2_GetCounter:
4414  0000 89            	pushw	x
4415       00000002      OFST:	set	2
4418                     ; 1037   uint16_t tmpcntr = 0;
4420                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4422  0001 c6530c        	ld	a,21260
4423  0004 5f            	clrw	x
4424  0005 97            	ld	xl,a
4425  0006 4f            	clr	a
4426  0007 02            	rlwa	x,a
4427  0008 1f01          	ldw	(OFST-1,sp),x
4428                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4430  000a c6530d        	ld	a,21261
4431  000d 5f            	clrw	x
4432  000e 97            	ld	xl,a
4433  000f 01            	rrwa	x,a
4434  0010 1a02          	or	a,(OFST+0,sp)
4435  0012 01            	rrwa	x,a
4436  0013 1a01          	or	a,(OFST-1,sp)
4437  0015 01            	rrwa	x,a
4440  0016 5b02          	addw	sp,#2
4441  0018 81            	ret
4465                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4465                     ; 1050 {
4466                     .text:	section	.text,new
4467  0000               _TIM2_GetPrescaler:
4471                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4473  0000 c6530e        	ld	a,21262
4476  0003 81            	ret
4616                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4616                     ; 1069 {
4617                     .text:	section	.text,new
4618  0000               _TIM2_GetFlagStatus:
4620  0000 89            	pushw	x
4621  0001 89            	pushw	x
4622       00000002      OFST:	set	2
4625                     ; 1070   FlagStatus bitstatus = RESET;
4627                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4631                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4633  0002 a30001        	cpw	x,#1
4634  0005 271e          	jreq	L035
4635  0007 a30002        	cpw	x,#2
4636  000a 2719          	jreq	L035
4637  000c a30004        	cpw	x,#4
4638  000f 2714          	jreq	L035
4639  0011 a30008        	cpw	x,#8
4640  0014 270f          	jreq	L035
4641  0016 a30200        	cpw	x,#512
4642  0019 270a          	jreq	L035
4643  001b a30400        	cpw	x,#1024
4644  001e 2705          	jreq	L035
4645  0020 a30800        	cpw	x,#2048
4646  0023 2603          	jrne	L625
4647  0025               L035:
4648  0025 4f            	clr	a
4649  0026 2010          	jra	L235
4650  0028               L625:
4651  0028 ae0432        	ldw	x,#1074
4652  002b 89            	pushw	x
4653  002c ae0000        	ldw	x,#0
4654  002f 89            	pushw	x
4655  0030 ae0000        	ldw	x,#L702
4656  0033 cd0000        	call	_assert_failed
4658  0036 5b04          	addw	sp,#4
4659  0038               L235:
4660                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4662  0038 c65304        	ld	a,21252
4663  003b 1404          	and	a,(OFST+2,sp)
4664  003d 6b01          	ld	(OFST-1,sp),a
4665                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4667  003f 7b03          	ld	a,(OFST+1,sp)
4668  0041 6b02          	ld	(OFST+0,sp),a
4669                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4671  0043 c65305        	ld	a,21253
4672  0046 1402          	and	a,(OFST+0,sp)
4673  0048 1a01          	or	a,(OFST-1,sp)
4674  004a 2706          	jreq	L7371
4675                     ; 1081     bitstatus = SET;
4677  004c a601          	ld	a,#1
4678  004e 6b02          	ld	(OFST+0,sp),a
4680  0050 2002          	jra	L1471
4681  0052               L7371:
4682                     ; 1085     bitstatus = RESET;
4684  0052 0f02          	clr	(OFST+0,sp)
4685  0054               L1471:
4686                     ; 1087   return (FlagStatus)bitstatus;
4688  0054 7b02          	ld	a,(OFST+0,sp)
4691  0056 5b04          	addw	sp,#4
4692  0058 81            	ret
4728                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4728                     ; 1104 {
4729                     .text:	section	.text,new
4730  0000               _TIM2_ClearFlag:
4732  0000 89            	pushw	x
4733       00000000      OFST:	set	0
4736                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4738  0001 01            	rrwa	x,a
4739  0002 a4f0          	and	a,#240
4740  0004 01            	rrwa	x,a
4741  0005 a4f1          	and	a,#241
4742  0007 01            	rrwa	x,a
4743  0008 a30000        	cpw	x,#0
4744  000b 2607          	jrne	L635
4745  000d 1e01          	ldw	x,(OFST+1,sp)
4746  000f 2703          	jreq	L635
4747  0011 4f            	clr	a
4748  0012 2010          	jra	L045
4749  0014               L635:
4750  0014 ae0452        	ldw	x,#1106
4751  0017 89            	pushw	x
4752  0018 ae0000        	ldw	x,#0
4753  001b 89            	pushw	x
4754  001c ae0000        	ldw	x,#L702
4755  001f cd0000        	call	_assert_failed
4757  0022 5b04          	addw	sp,#4
4758  0024               L045:
4759                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4761  0024 7b02          	ld	a,(OFST+2,sp)
4762  0026 43            	cpl	a
4763  0027 c75304        	ld	21252,a
4764                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4766  002a 35ff5305      	mov	21253,#255
4767                     ; 1111 }
4770  002e 85            	popw	x
4771  002f 81            	ret
4836                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4836                     ; 1124 {
4837                     .text:	section	.text,new
4838  0000               _TIM2_GetITStatus:
4840  0000 88            	push	a
4841  0001 89            	pushw	x
4842       00000002      OFST:	set	2
4845                     ; 1125   ITStatus bitstatus = RESET;
4847                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4851                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4853  0002 a101          	cp	a,#1
4854  0004 270c          	jreq	L645
4855  0006 a102          	cp	a,#2
4856  0008 2708          	jreq	L645
4857  000a a104          	cp	a,#4
4858  000c 2704          	jreq	L645
4859  000e a108          	cp	a,#8
4860  0010 2603          	jrne	L445
4861  0012               L645:
4862  0012 4f            	clr	a
4863  0013 2010          	jra	L055
4864  0015               L445:
4865  0015 ae0469        	ldw	x,#1129
4866  0018 89            	pushw	x
4867  0019 ae0000        	ldw	x,#0
4868  001c 89            	pushw	x
4869  001d ae0000        	ldw	x,#L702
4870  0020 cd0000        	call	_assert_failed
4872  0023 5b04          	addw	sp,#4
4873  0025               L055:
4874                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4876  0025 c65304        	ld	a,21252
4877  0028 1403          	and	a,(OFST+1,sp)
4878  002a 6b01          	ld	(OFST-1,sp),a
4879                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4881  002c c65303        	ld	a,21251
4882  002f 1403          	and	a,(OFST+1,sp)
4883  0031 6b02          	ld	(OFST+0,sp),a
4884                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4886  0033 0d01          	tnz	(OFST-1,sp)
4887  0035 270a          	jreq	L3102
4889  0037 0d02          	tnz	(OFST+0,sp)
4890  0039 2706          	jreq	L3102
4891                     ; 1137     bitstatus = SET;
4893  003b a601          	ld	a,#1
4894  003d 6b02          	ld	(OFST+0,sp),a
4896  003f 2002          	jra	L5102
4897  0041               L3102:
4898                     ; 1141     bitstatus = RESET;
4900  0041 0f02          	clr	(OFST+0,sp)
4901  0043               L5102:
4902                     ; 1143   return (ITStatus)(bitstatus);
4904  0043 7b02          	ld	a,(OFST+0,sp)
4907  0045 5b03          	addw	sp,#3
4908  0047 81            	ret
4945                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4945                     ; 1157 {
4946                     .text:	section	.text,new
4947  0000               _TIM2_ClearITPendingBit:
4949  0000 88            	push	a
4950       00000000      OFST:	set	0
4953                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4955  0001 4d            	tnz	a
4956  0002 2707          	jreq	L455
4957  0004 a110          	cp	a,#16
4958  0006 2403          	jruge	L455
4959  0008 4f            	clr	a
4960  0009 2010          	jra	L655
4961  000b               L455:
4962  000b ae0487        	ldw	x,#1159
4963  000e 89            	pushw	x
4964  000f ae0000        	ldw	x,#0
4965  0012 89            	pushw	x
4966  0013 ae0000        	ldw	x,#L702
4967  0016 cd0000        	call	_assert_failed
4969  0019 5b04          	addw	sp,#4
4970  001b               L655:
4971                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4973  001b 7b01          	ld	a,(OFST+1,sp)
4974  001d 43            	cpl	a
4975  001e c75304        	ld	21252,a
4976                     ; 1163 }
4979  0021 84            	pop	a
4980  0022 81            	ret
5032                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
5032                     ; 1182                        uint8_t TIM2_ICSelection,
5032                     ; 1183                        uint8_t TIM2_ICFilter)
5032                     ; 1184 {
5033                     .text:	section	.text,new
5034  0000               L3_TI1_Config:
5036  0000 89            	pushw	x
5037  0001 88            	push	a
5038       00000001      OFST:	set	1
5041                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5043  0002 7211530a      	bres	21258,#0
5044                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5044                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5046  0006 7b06          	ld	a,(OFST+5,sp)
5047  0008 97            	ld	xl,a
5048  0009 a610          	ld	a,#16
5049  000b 42            	mul	x,a
5050  000c 9f            	ld	a,xl
5051  000d 1a03          	or	a,(OFST+2,sp)
5052  000f 6b01          	ld	(OFST+0,sp),a
5053  0011 c65307        	ld	a,21255
5054  0014 a40c          	and	a,#12
5055  0016 1a01          	or	a,(OFST+0,sp)
5056  0018 c75307        	ld	21255,a
5057                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5059  001b 0d02          	tnz	(OFST+1,sp)
5060  001d 2706          	jreq	L3602
5061                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
5063  001f 7212530a      	bset	21258,#1
5065  0023 2004          	jra	L5602
5066  0025               L3602:
5067                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5069  0025 7213530a      	bres	21258,#1
5070  0029               L5602:
5071                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
5073  0029 7210530a      	bset	21258,#0
5074                     ; 1203 }
5077  002d 5b03          	addw	sp,#3
5078  002f 81            	ret
5130                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
5130                     ; 1222                        uint8_t TIM2_ICSelection,
5130                     ; 1223                        uint8_t TIM2_ICFilter)
5130                     ; 1224 {
5131                     .text:	section	.text,new
5132  0000               L5_TI2_Config:
5134  0000 89            	pushw	x
5135  0001 88            	push	a
5136       00000001      OFST:	set	1
5139                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5141  0002 7219530a      	bres	21258,#4
5142                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5142                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5144  0006 7b06          	ld	a,(OFST+5,sp)
5145  0008 97            	ld	xl,a
5146  0009 a610          	ld	a,#16
5147  000b 42            	mul	x,a
5148  000c 9f            	ld	a,xl
5149  000d 1a03          	or	a,(OFST+2,sp)
5150  000f 6b01          	ld	(OFST+0,sp),a
5151  0011 c65308        	ld	a,21256
5152  0014 a40c          	and	a,#12
5153  0016 1a01          	or	a,(OFST+0,sp)
5154  0018 c75308        	ld	21256,a
5155                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5157  001b 0d02          	tnz	(OFST+1,sp)
5158  001d 2706          	jreq	L5112
5159                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
5161  001f 721a530a      	bset	21258,#5
5163  0023 2004          	jra	L7112
5164  0025               L5112:
5165                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5167  0025 721b530a      	bres	21258,#5
5168  0029               L7112:
5169                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
5171  0029 7218530a      	bset	21258,#4
5172                     ; 1245 }
5175  002d 5b03          	addw	sp,#3
5176  002f 81            	ret
5228                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5228                     ; 1262                        uint8_t TIM2_ICFilter)
5228                     ; 1263 {
5229                     .text:	section	.text,new
5230  0000               L7_TI3_Config:
5232  0000 89            	pushw	x
5233  0001 88            	push	a
5234       00000001      OFST:	set	1
5237                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5239  0002 7211530b      	bres	21259,#0
5240                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5240                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5242  0006 7b06          	ld	a,(OFST+5,sp)
5243  0008 97            	ld	xl,a
5244  0009 a610          	ld	a,#16
5245  000b 42            	mul	x,a
5246  000c 9f            	ld	a,xl
5247  000d 1a03          	or	a,(OFST+2,sp)
5248  000f 6b01          	ld	(OFST+0,sp),a
5249  0011 c65309        	ld	a,21257
5250  0014 a40c          	and	a,#12
5251  0016 1a01          	or	a,(OFST+0,sp)
5252  0018 c75309        	ld	21257,a
5253                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5255  001b 0d02          	tnz	(OFST+1,sp)
5256  001d 2706          	jreq	L7412
5257                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
5259  001f 7212530b      	bset	21259,#1
5261  0023 2004          	jra	L1512
5262  0025               L7412:
5263                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5265  0025 7213530b      	bres	21259,#1
5266  0029               L1512:
5267                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
5269  0029 7210530b      	bset	21259,#0
5270                     ; 1283 }
5273  002d 5b03          	addw	sp,#3
5274  002f 81            	ret
5287                     	xdef	_TIM2_ClearITPendingBit
5288                     	xdef	_TIM2_GetITStatus
5289                     	xdef	_TIM2_ClearFlag
5290                     	xdef	_TIM2_GetFlagStatus
5291                     	xdef	_TIM2_GetPrescaler
5292                     	xdef	_TIM2_GetCounter
5293                     	xdef	_TIM2_GetCapture3
5294                     	xdef	_TIM2_GetCapture2
5295                     	xdef	_TIM2_GetCapture1
5296                     	xdef	_TIM2_SetIC3Prescaler
5297                     	xdef	_TIM2_SetIC2Prescaler
5298                     	xdef	_TIM2_SetIC1Prescaler
5299                     	xdef	_TIM2_SetCompare3
5300                     	xdef	_TIM2_SetCompare2
5301                     	xdef	_TIM2_SetCompare1
5302                     	xdef	_TIM2_SetAutoreload
5303                     	xdef	_TIM2_SetCounter
5304                     	xdef	_TIM2_SelectOCxM
5305                     	xdef	_TIM2_CCxCmd
5306                     	xdef	_TIM2_OC3PolarityConfig
5307                     	xdef	_TIM2_OC2PolarityConfig
5308                     	xdef	_TIM2_OC1PolarityConfig
5309                     	xdef	_TIM2_GenerateEvent
5310                     	xdef	_TIM2_OC3PreloadConfig
5311                     	xdef	_TIM2_OC2PreloadConfig
5312                     	xdef	_TIM2_OC1PreloadConfig
5313                     	xdef	_TIM2_ARRPreloadConfig
5314                     	xdef	_TIM2_ForcedOC3Config
5315                     	xdef	_TIM2_ForcedOC2Config
5316                     	xdef	_TIM2_ForcedOC1Config
5317                     	xdef	_TIM2_PrescalerConfig
5318                     	xdef	_TIM2_SelectOnePulseMode
5319                     	xdef	_TIM2_UpdateRequestConfig
5320                     	xdef	_TIM2_UpdateDisableConfig
5321                     	xdef	_TIM2_ITConfig
5322                     	xdef	_TIM2_Cmd
5323                     	xdef	_TIM2_PWMIConfig
5324                     	xdef	_TIM2_ICInit
5325                     	xdef	_TIM2_OC3Init
5326                     	xdef	_TIM2_OC2Init
5327                     	xdef	_TIM2_OC1Init
5328                     	xdef	_TIM2_TimeBaseInit
5329                     	xdef	_TIM2_DeInit
5330                     	xref	_assert_failed
5331                     .const:	section	.text
5332  0000               L702:
5333  0000 2e2e5c737476  	dc.b	"..\stvd\cosmic\stm"
5334  0012 38735f737464  	dc.b	"8s_stdperiph_lib\l"
5335  0024 696272617269  	dc.b	"ibraries\stm8s_std"
5336  0036 706572697068  	dc.b	"periph_driver\src\"
5337  0048 73746d38735f  	dc.b	"stm8s_tim2.c",0
5357                     	end
