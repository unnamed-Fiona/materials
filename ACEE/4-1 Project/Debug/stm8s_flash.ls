   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  77                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  77                     ; 88 {
  79                     .text:	section	.text,new
  80  0000               _FLASH_Unlock:
  82  0000 88            	push	a
  83       00000000      OFST:	set	0
  86                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  88  0001 a1fd          	cp	a,#253
  89  0003 2704          	jreq	L01
  90  0005 a1f7          	cp	a,#247
  91  0007 2603          	jrne	L6
  92  0009               L01:
  93  0009 4f            	clr	a
  94  000a 2010          	jra	L21
  95  000c               L6:
  96  000c ae005a        	ldw	x,#90
  97  000f 89            	pushw	x
  98  0010 ae0000        	ldw	x,#0
  99  0013 89            	pushw	x
 100  0014 ae0010        	ldw	x,#L73
 101  0017 cd0000        	call	_assert_failed
 103  001a 5b04          	addw	sp,#4
 104  001c               L21:
 105                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 107  001c 7b01          	ld	a,(OFST+1,sp)
 108  001e a1fd          	cp	a,#253
 109  0020 260a          	jrne	L14
 110                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 112  0022 35565062      	mov	20578,#86
 113                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 115  0026 35ae5062      	mov	20578,#174
 117  002a 2008          	jra	L34
 118  002c               L14:
 119                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 121  002c 35ae5064      	mov	20580,#174
 122                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 124  0030 35565064      	mov	20580,#86
 125  0034               L34:
 126                     ; 104 }
 129  0034 84            	pop	a
 130  0035 81            	ret
 166                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 166                     ; 113 {
 167                     .text:	section	.text,new
 168  0000               _FLASH_Lock:
 170  0000 88            	push	a
 171       00000000      OFST:	set	0
 174                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 176  0001 a1fd          	cp	a,#253
 177  0003 2704          	jreq	L02
 178  0005 a1f7          	cp	a,#247
 179  0007 2603          	jrne	L61
 180  0009               L02:
 181  0009 4f            	clr	a
 182  000a 2010          	jra	L22
 183  000c               L61:
 184  000c ae0073        	ldw	x,#115
 185  000f 89            	pushw	x
 186  0010 ae0000        	ldw	x,#0
 187  0013 89            	pushw	x
 188  0014 ae0010        	ldw	x,#L73
 189  0017 cd0000        	call	_assert_failed
 191  001a 5b04          	addw	sp,#4
 192  001c               L22:
 193                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 195  001c c6505f        	ld	a,20575
 196  001f 1401          	and	a,(OFST+1,sp)
 197  0021 c7505f        	ld	20575,a
 198                     ; 119 }
 201  0024 84            	pop	a
 202  0025 81            	ret
 225                     ; 126 void FLASH_DeInit(void)
 225                     ; 127 {
 226                     .text:	section	.text,new
 227  0000               _FLASH_DeInit:
 231                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 233  0000 725f505a      	clr	20570
 234                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 236  0004 725f505b      	clr	20571
 237                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 239  0008 35ff505c      	mov	20572,#255
 240                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 242  000c 7217505f      	bres	20575,#3
 243                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 245  0010 7213505f      	bres	20575,#1
 246                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 248  0014 c6505f        	ld	a,20575
 249                     ; 134 }
 252  0017 81            	ret
 308                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 308                     ; 143 {
 309                     .text:	section	.text,new
 310  0000               _FLASH_ITConfig:
 312  0000 88            	push	a
 313       00000000      OFST:	set	0
 316                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 318  0001 4d            	tnz	a
 319  0002 2704          	jreq	L23
 320  0004 a101          	cp	a,#1
 321  0006 2603          	jrne	L03
 322  0008               L23:
 323  0008 4f            	clr	a
 324  0009 2010          	jra	L43
 325  000b               L03:
 326  000b ae0091        	ldw	x,#145
 327  000e 89            	pushw	x
 328  000f ae0000        	ldw	x,#0
 329  0012 89            	pushw	x
 330  0013 ae0010        	ldw	x,#L73
 331  0016 cd0000        	call	_assert_failed
 333  0019 5b04          	addw	sp,#4
 334  001b               L43:
 335                     ; 147   if(NewState != DISABLE)
 337  001b 0d01          	tnz	(OFST+1,sp)
 338  001d 2706          	jreq	L121
 339                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 341  001f 7212505a      	bset	20570,#1
 343  0023 2004          	jra	L321
 344  0025               L121:
 345                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 347  0025 7213505a      	bres	20570,#1
 348  0029               L321:
 349                     ; 155 }
 352  0029 84            	pop	a
 353  002a 81            	ret
 388                     .const:	section	.text
 389  0000               L64:
 390  0000 00008000      	dc.l	32768
 391  0004               L05:
 392  0004 0000a000      	dc.l	40960
 393  0008               L25:
 394  0008 00004000      	dc.l	16384
 395  000c               L45:
 396  000c 00004280      	dc.l	17024
 397                     ; 164 void FLASH_EraseByte(uint32_t Address)
 397                     ; 165 {
 398                     .text:	section	.text,new
 399  0000               _FLASH_EraseByte:
 401       00000000      OFST:	set	0
 404                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 406  0000 96            	ldw	x,sp
 407  0001 1c0003        	addw	x,#OFST+3
 408  0004 cd0000        	call	c_ltor
 410  0007 ae0000        	ldw	x,#L64
 411  000a cd0000        	call	c_lcmp
 413  000d 250f          	jrult	L44
 414  000f 96            	ldw	x,sp
 415  0010 1c0003        	addw	x,#OFST+3
 416  0013 cd0000        	call	c_ltor
 418  0016 ae0004        	ldw	x,#L05
 419  0019 cd0000        	call	c_lcmp
 421  001c 251e          	jrult	L24
 422  001e               L44:
 423  001e 96            	ldw	x,sp
 424  001f 1c0003        	addw	x,#OFST+3
 425  0022 cd0000        	call	c_ltor
 427  0025 ae0008        	ldw	x,#L25
 428  0028 cd0000        	call	c_lcmp
 430  002b 2512          	jrult	L04
 431  002d 96            	ldw	x,sp
 432  002e 1c0003        	addw	x,#OFST+3
 433  0031 cd0000        	call	c_ltor
 435  0034 ae000c        	ldw	x,#L45
 436  0037 cd0000        	call	c_lcmp
 438  003a 2403          	jruge	L04
 439  003c               L24:
 440  003c 4f            	clr	a
 441  003d 2010          	jra	L65
 442  003f               L04:
 443  003f ae00a7        	ldw	x,#167
 444  0042 89            	pushw	x
 445  0043 ae0000        	ldw	x,#0
 446  0046 89            	pushw	x
 447  0047 ae0010        	ldw	x,#L73
 448  004a cd0000        	call	_assert_failed
 450  004d 5b04          	addw	sp,#4
 451  004f               L65:
 452                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 454  004f 1e05          	ldw	x,(OFST+5,sp)
 455  0051 7f            	clr	(x)
 456                     ; 171 }
 459  0052 81            	ret
 503                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 503                     ; 182 {
 504                     .text:	section	.text,new
 505  0000               _FLASH_ProgramByte:
 507       00000000      OFST:	set	0
 510                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 512  0000 96            	ldw	x,sp
 513  0001 1c0003        	addw	x,#OFST+3
 514  0004 cd0000        	call	c_ltor
 516  0007 ae0000        	ldw	x,#L64
 517  000a cd0000        	call	c_lcmp
 519  000d 250f          	jrult	L66
 520  000f 96            	ldw	x,sp
 521  0010 1c0003        	addw	x,#OFST+3
 522  0013 cd0000        	call	c_ltor
 524  0016 ae0004        	ldw	x,#L05
 525  0019 cd0000        	call	c_lcmp
 527  001c 251e          	jrult	L46
 528  001e               L66:
 529  001e 96            	ldw	x,sp
 530  001f 1c0003        	addw	x,#OFST+3
 531  0022 cd0000        	call	c_ltor
 533  0025 ae0008        	ldw	x,#L25
 534  0028 cd0000        	call	c_lcmp
 536  002b 2512          	jrult	L26
 537  002d 96            	ldw	x,sp
 538  002e 1c0003        	addw	x,#OFST+3
 539  0031 cd0000        	call	c_ltor
 541  0034 ae000c        	ldw	x,#L45
 542  0037 cd0000        	call	c_lcmp
 544  003a 2403          	jruge	L26
 545  003c               L46:
 546  003c 4f            	clr	a
 547  003d 2010          	jra	L07
 548  003f               L26:
 549  003f ae00b8        	ldw	x,#184
 550  0042 89            	pushw	x
 551  0043 ae0000        	ldw	x,#0
 552  0046 89            	pushw	x
 553  0047 ae0010        	ldw	x,#L73
 554  004a cd0000        	call	_assert_failed
 556  004d 5b04          	addw	sp,#4
 557  004f               L07:
 558                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 560  004f 7b07          	ld	a,(OFST+7,sp)
 561  0051 1e05          	ldw	x,(OFST+5,sp)
 562  0053 f7            	ld	(x),a
 563                     ; 186 }
 566  0054 81            	ret
 601                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 601                     ; 196 {
 602                     .text:	section	.text,new
 603  0000               _FLASH_ReadByte:
 605       00000000      OFST:	set	0
 608                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 610  0000 96            	ldw	x,sp
 611  0001 1c0003        	addw	x,#OFST+3
 612  0004 cd0000        	call	c_ltor
 614  0007 ae0000        	ldw	x,#L64
 615  000a cd0000        	call	c_lcmp
 617  000d 250f          	jrult	L001
 618  000f 96            	ldw	x,sp
 619  0010 1c0003        	addw	x,#OFST+3
 620  0013 cd0000        	call	c_ltor
 622  0016 ae0004        	ldw	x,#L05
 623  0019 cd0000        	call	c_lcmp
 625  001c 251e          	jrult	L67
 626  001e               L001:
 627  001e 96            	ldw	x,sp
 628  001f 1c0003        	addw	x,#OFST+3
 629  0022 cd0000        	call	c_ltor
 631  0025 ae0008        	ldw	x,#L25
 632  0028 cd0000        	call	c_lcmp
 634  002b 2512          	jrult	L47
 635  002d 96            	ldw	x,sp
 636  002e 1c0003        	addw	x,#OFST+3
 637  0031 cd0000        	call	c_ltor
 639  0034 ae000c        	ldw	x,#L45
 640  0037 cd0000        	call	c_lcmp
 642  003a 2403          	jruge	L47
 643  003c               L67:
 644  003c 4f            	clr	a
 645  003d 2010          	jra	L201
 646  003f               L47:
 647  003f ae00c6        	ldw	x,#198
 648  0042 89            	pushw	x
 649  0043 ae0000        	ldw	x,#0
 650  0046 89            	pushw	x
 651  0047 ae0010        	ldw	x,#L73
 652  004a cd0000        	call	_assert_failed
 654  004d 5b04          	addw	sp,#4
 655  004f               L201:
 656                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 658  004f 1e05          	ldw	x,(OFST+5,sp)
 659  0051 f6            	ld	a,(x)
 662  0052 81            	ret
 706                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 706                     ; 213 {
 707                     .text:	section	.text,new
 708  0000               _FLASH_ProgramWord:
 710       00000000      OFST:	set	0
 713                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 715  0000 96            	ldw	x,sp
 716  0001 1c0003        	addw	x,#OFST+3
 717  0004 cd0000        	call	c_ltor
 719  0007 ae0000        	ldw	x,#L64
 720  000a cd0000        	call	c_lcmp
 722  000d 250f          	jrult	L211
 723  000f 96            	ldw	x,sp
 724  0010 1c0003        	addw	x,#OFST+3
 725  0013 cd0000        	call	c_ltor
 727  0016 ae0004        	ldw	x,#L05
 728  0019 cd0000        	call	c_lcmp
 730  001c 251e          	jrult	L011
 731  001e               L211:
 732  001e 96            	ldw	x,sp
 733  001f 1c0003        	addw	x,#OFST+3
 734  0022 cd0000        	call	c_ltor
 736  0025 ae0008        	ldw	x,#L25
 737  0028 cd0000        	call	c_lcmp
 739  002b 2512          	jrult	L601
 740  002d 96            	ldw	x,sp
 741  002e 1c0003        	addw	x,#OFST+3
 742  0031 cd0000        	call	c_ltor
 744  0034 ae000c        	ldw	x,#L45
 745  0037 cd0000        	call	c_lcmp
 747  003a 2403          	jruge	L601
 748  003c               L011:
 749  003c 4f            	clr	a
 750  003d 2010          	jra	L411
 751  003f               L601:
 752  003f ae00d7        	ldw	x,#215
 753  0042 89            	pushw	x
 754  0043 ae0000        	ldw	x,#0
 755  0046 89            	pushw	x
 756  0047 ae0010        	ldw	x,#L73
 757  004a cd0000        	call	_assert_failed
 759  004d 5b04          	addw	sp,#4
 760  004f               L411:
 761                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 763  004f 721c505b      	bset	20571,#6
 764                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 766  0053 721d505c      	bres	20572,#6
 767                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 769  0057 7b07          	ld	a,(OFST+7,sp)
 770  0059 1e05          	ldw	x,(OFST+5,sp)
 771  005b f7            	ld	(x),a
 772                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 774  005c 7b08          	ld	a,(OFST+8,sp)
 775  005e 1e05          	ldw	x,(OFST+5,sp)
 776  0060 e701          	ld	(1,x),a
 777                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 779  0062 7b09          	ld	a,(OFST+9,sp)
 780  0064 1e05          	ldw	x,(OFST+5,sp)
 781  0066 e702          	ld	(2,x),a
 782                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 784  0068 7b0a          	ld	a,(OFST+10,sp)
 785  006a 1e05          	ldw	x,(OFST+5,sp)
 786  006c e703          	ld	(3,x),a
 787                     ; 229 }
 790  006e 81            	ret
 836                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 836                     ; 238 {
 837                     .text:	section	.text,new
 838  0000               _FLASH_ProgramOptionByte:
 840  0000 89            	pushw	x
 841       00000000      OFST:	set	0
 844                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 846  0001 a34800        	cpw	x,#18432
 847  0004 2508          	jrult	L021
 848  0006 a34880        	cpw	x,#18560
 849  0009 2403          	jruge	L021
 850  000b 4f            	clr	a
 851  000c 2010          	jra	L221
 852  000e               L021:
 853  000e ae00f0        	ldw	x,#240
 854  0011 89            	pushw	x
 855  0012 ae0000        	ldw	x,#0
 856  0015 89            	pushw	x
 857  0016 ae0010        	ldw	x,#L73
 858  0019 cd0000        	call	_assert_failed
 860  001c 5b04          	addw	sp,#4
 861  001e               L221:
 862                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 864  001e 721e505b      	bset	20571,#7
 865                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 867  0022 721f505c      	bres	20572,#7
 868                     ; 247   if(Address == 0x4800)
 870  0026 1e01          	ldw	x,(OFST+1,sp)
 871  0028 a34800        	cpw	x,#18432
 872  002b 2607          	jrne	L742
 873                     ; 250     *((NEAR uint8_t*)Address) = Data;
 875  002d 7b05          	ld	a,(OFST+5,sp)
 876  002f 1e01          	ldw	x,(OFST+1,sp)
 877  0031 f7            	ld	(x),a
 879  0032 200c          	jra	L152
 880  0034               L742:
 881                     ; 255     *((NEAR uint8_t*)Address) = Data;
 883  0034 7b05          	ld	a,(OFST+5,sp)
 884  0036 1e01          	ldw	x,(OFST+1,sp)
 885  0038 f7            	ld	(x),a
 886                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 888  0039 7b05          	ld	a,(OFST+5,sp)
 889  003b 43            	cpl	a
 890  003c 1e01          	ldw	x,(OFST+1,sp)
 891  003e e701          	ld	(1,x),a
 892  0040               L152:
 893                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 895  0040 a6fd          	ld	a,#253
 896  0042 cd0000        	call	_FLASH_WaitForLastOperation
 898                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 900  0045 721f505b      	bres	20571,#7
 901                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 903  0049 721e505c      	bset	20572,#7
 904                     ; 263 }
 907  004d 85            	popw	x
 908  004e 81            	ret
 945                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 945                     ; 271 {
 946                     .text:	section	.text,new
 947  0000               _FLASH_EraseOptionByte:
 949  0000 89            	pushw	x
 950       00000000      OFST:	set	0
 953                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 955  0001 a34800        	cpw	x,#18432
 956  0004 2508          	jrult	L621
 957  0006 a34880        	cpw	x,#18560
 958  0009 2403          	jruge	L621
 959  000b 4f            	clr	a
 960  000c 2010          	jra	L031
 961  000e               L621:
 962  000e ae0111        	ldw	x,#273
 963  0011 89            	pushw	x
 964  0012 ae0000        	ldw	x,#0
 965  0015 89            	pushw	x
 966  0016 ae0010        	ldw	x,#L73
 967  0019 cd0000        	call	_assert_failed
 969  001c 5b04          	addw	sp,#4
 970  001e               L031:
 971                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 973  001e 721e505b      	bset	20571,#7
 974                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 976  0022 721f505c      	bres	20572,#7
 977                     ; 280   if(Address == 0x4800)
 979  0026 1e01          	ldw	x,(OFST+1,sp)
 980  0028 a34800        	cpw	x,#18432
 981  002b 2605          	jrne	L172
 982                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 984  002d 1e01          	ldw	x,(OFST+1,sp)
 985  002f 7f            	clr	(x)
 987  0030 2009          	jra	L372
 988  0032               L172:
 989                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 991  0032 1e01          	ldw	x,(OFST+1,sp)
 992  0034 7f            	clr	(x)
 993                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 995  0035 1e01          	ldw	x,(OFST+1,sp)
 996  0037 a6ff          	ld	a,#255
 997  0039 e701          	ld	(1,x),a
 998  003b               L372:
 999                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1001  003b a6fd          	ld	a,#253
1002  003d cd0000        	call	_FLASH_WaitForLastOperation
1004                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1006  0040 721f505b      	bres	20571,#7
1007                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
1009  0044 721e505c      	bset	20572,#7
1010                     ; 296 }
1013  0048 85            	popw	x
1014  0049 81            	ret
1078                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1078                     ; 304 {
1079                     .text:	section	.text,new
1080  0000               _FLASH_ReadOptionByte:
1082  0000 89            	pushw	x
1083  0001 5204          	subw	sp,#4
1084       00000004      OFST:	set	4
1087                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1089                     ; 306   uint16_t res_value = 0;
1091                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1093  0003 a34800        	cpw	x,#18432
1094  0006 2508          	jrult	L431
1095  0008 a34880        	cpw	x,#18560
1096  000b 2403          	jruge	L431
1097  000d 4f            	clr	a
1098  000e 2010          	jra	L631
1099  0010               L431:
1100  0010 ae0135        	ldw	x,#309
1101  0013 89            	pushw	x
1102  0014 ae0000        	ldw	x,#0
1103  0017 89            	pushw	x
1104  0018 ae0010        	ldw	x,#L73
1105  001b cd0000        	call	_assert_failed
1107  001e 5b04          	addw	sp,#4
1108  0020               L631:
1109                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1111  0020 1e05          	ldw	x,(OFST+1,sp)
1112  0022 f6            	ld	a,(x)
1113  0023 6b02          	ld	(OFST-2,sp),a
1114                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1116  0025 1e05          	ldw	x,(OFST+1,sp)
1117  0027 e601          	ld	a,(1,x)
1118  0029 6b01          	ld	(OFST-3,sp),a
1119                     ; 315   if(Address == 0x4800)	 
1121  002b 1e05          	ldw	x,(OFST+1,sp)
1122  002d a34800        	cpw	x,#18432
1123  0030 2608          	jrne	L723
1124                     ; 317     res_value =	 value_optbyte;
1126  0032 7b02          	ld	a,(OFST-2,sp)
1127  0034 5f            	clrw	x
1128  0035 97            	ld	xl,a
1129  0036 1f03          	ldw	(OFST-1,sp),x
1131  0038 2023          	jra	L133
1132  003a               L723:
1133                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1135  003a 7b01          	ld	a,(OFST-3,sp)
1136  003c 43            	cpl	a
1137  003d 1102          	cp	a,(OFST-2,sp)
1138  003f 2617          	jrne	L333
1139                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1141  0041 7b02          	ld	a,(OFST-2,sp)
1142  0043 5f            	clrw	x
1143  0044 97            	ld	xl,a
1144  0045 4f            	clr	a
1145  0046 02            	rlwa	x,a
1146  0047 1f03          	ldw	(OFST-1,sp),x
1147                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1149  0049 7b01          	ld	a,(OFST-3,sp)
1150  004b 5f            	clrw	x
1151  004c 97            	ld	xl,a
1152  004d 01            	rrwa	x,a
1153  004e 1a04          	or	a,(OFST+0,sp)
1154  0050 01            	rrwa	x,a
1155  0051 1a03          	or	a,(OFST-1,sp)
1156  0053 01            	rrwa	x,a
1157  0054 1f03          	ldw	(OFST-1,sp),x
1159  0056 2005          	jra	L133
1160  0058               L333:
1161                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1163  0058 ae5555        	ldw	x,#21845
1164  005b 1f03          	ldw	(OFST-1,sp),x
1165  005d               L133:
1166                     ; 331   return(res_value);
1168  005d 1e03          	ldw	x,(OFST-1,sp)
1171  005f 5b06          	addw	sp,#6
1172  0061 81            	ret
1247                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1247                     ; 341 {
1248                     .text:	section	.text,new
1249  0000               _FLASH_SetLowPowerMode:
1251  0000 88            	push	a
1252       00000000      OFST:	set	0
1255                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1257  0001 a104          	cp	a,#4
1258  0003 270b          	jreq	L441
1259  0005 a108          	cp	a,#8
1260  0007 2707          	jreq	L441
1261  0009 4d            	tnz	a
1262  000a 2704          	jreq	L441
1263  000c a10c          	cp	a,#12
1264  000e 2603          	jrne	L241
1265  0010               L441:
1266  0010 4f            	clr	a
1267  0011 2010          	jra	L641
1268  0013               L241:
1269  0013 ae0157        	ldw	x,#343
1270  0016 89            	pushw	x
1271  0017 ae0000        	ldw	x,#0
1272  001a 89            	pushw	x
1273  001b ae0010        	ldw	x,#L73
1274  001e cd0000        	call	_assert_failed
1276  0021 5b04          	addw	sp,#4
1277  0023               L641:
1278                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1280  0023 c6505a        	ld	a,20570
1281  0026 a4f3          	and	a,#243
1282  0028 c7505a        	ld	20570,a
1283                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1285  002b c6505a        	ld	a,20570
1286  002e 1a01          	or	a,(OFST+1,sp)
1287  0030 c7505a        	ld	20570,a
1288                     ; 350 }
1291  0033 84            	pop	a
1292  0034 81            	ret
1351                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1351                     ; 359 {
1352                     .text:	section	.text,new
1353  0000               _FLASH_SetProgrammingTime:
1355  0000 88            	push	a
1356       00000000      OFST:	set	0
1359                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1361  0001 4d            	tnz	a
1362  0002 2704          	jreq	L451
1363  0004 a101          	cp	a,#1
1364  0006 2603          	jrne	L251
1365  0008               L451:
1366  0008 4f            	clr	a
1367  0009 2010          	jra	L651
1368  000b               L251:
1369  000b ae0169        	ldw	x,#361
1370  000e 89            	pushw	x
1371  000f ae0000        	ldw	x,#0
1372  0012 89            	pushw	x
1373  0013 ae0010        	ldw	x,#L73
1374  0016 cd0000        	call	_assert_failed
1376  0019 5b04          	addw	sp,#4
1377  001b               L651:
1378                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1380  001b 7211505a      	bres	20570,#0
1381                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1383  001f c6505a        	ld	a,20570
1384  0022 1a01          	or	a,(OFST+1,sp)
1385  0024 c7505a        	ld	20570,a
1386                     ; 365 }
1389  0027 84            	pop	a
1390  0028 81            	ret
1415                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1415                     ; 373 {
1416                     .text:	section	.text,new
1417  0000               _FLASH_GetLowPowerMode:
1421                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1423  0000 c6505a        	ld	a,20570
1424  0003 a40c          	and	a,#12
1427  0005 81            	ret
1452                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1452                     ; 383 {
1453                     .text:	section	.text,new
1454  0000               _FLASH_GetProgrammingTime:
1458                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1460  0000 c6505a        	ld	a,20570
1461  0003 a401          	and	a,#1
1464  0005 81            	ret
1498                     ; 392 uint32_t FLASH_GetBootSize(void)
1498                     ; 393 {
1499                     .text:	section	.text,new
1500  0000               _FLASH_GetBootSize:
1502  0000 5204          	subw	sp,#4
1503       00000004      OFST:	set	4
1506                     ; 394   uint32_t temp = 0;
1508                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1510  0002 c6505d        	ld	a,20573
1511  0005 5f            	clrw	x
1512  0006 97            	ld	xl,a
1513  0007 90ae0200      	ldw	y,#512
1514  000b cd0000        	call	c_umul
1516  000e 96            	ldw	x,sp
1517  000f 1c0001        	addw	x,#OFST-3
1518  0012 cd0000        	call	c_rtol
1520                     ; 400   if(FLASH->FPR == 0xFF)
1522  0015 c6505d        	ld	a,20573
1523  0018 a1ff          	cp	a,#255
1524  001a 2611          	jrne	L554
1525                     ; 402     temp += 512;
1527  001c ae0200        	ldw	x,#512
1528  001f bf02          	ldw	c_lreg+2,x
1529  0021 ae0000        	ldw	x,#0
1530  0024 bf00          	ldw	c_lreg,x
1531  0026 96            	ldw	x,sp
1532  0027 1c0001        	addw	x,#OFST-3
1533  002a cd0000        	call	c_lgadd
1535  002d               L554:
1536                     ; 406   return(temp);
1538  002d 96            	ldw	x,sp
1539  002e 1c0001        	addw	x,#OFST-3
1540  0031 cd0000        	call	c_ltor
1544  0034 5b04          	addw	sp,#4
1545  0036 81            	ret
1648                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1648                     ; 418 {
1649                     .text:	section	.text,new
1650  0000               _FLASH_GetFlagStatus:
1652  0000 88            	push	a
1653  0001 88            	push	a
1654       00000001      OFST:	set	1
1657                     ; 419   FlagStatus status = RESET;
1659                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1661  0002 a108          	cp	a,#8
1662  0004 270c          	jreq	L271
1663  0006 a104          	cp	a,#4
1664  0008 2708          	jreq	L271
1665  000a a102          	cp	a,#2
1666  000c 2704          	jreq	L271
1667  000e a101          	cp	a,#1
1668  0010 2603          	jrne	L071
1669  0012               L271:
1670  0012 4f            	clr	a
1671  0013 2010          	jra	L471
1672  0015               L071:
1673  0015 ae01a5        	ldw	x,#421
1674  0018 89            	pushw	x
1675  0019 ae0000        	ldw	x,#0
1676  001c 89            	pushw	x
1677  001d ae0010        	ldw	x,#L73
1678  0020 cd0000        	call	_assert_failed
1680  0023 5b04          	addw	sp,#4
1681  0025               L471:
1682                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1684  0025 c6505f        	ld	a,20575
1685  0028 1502          	bcp	a,(OFST+1,sp)
1686  002a 2706          	jreq	L525
1687                     ; 426     status = SET; /* FLASH_FLAG is set */
1689  002c a601          	ld	a,#1
1690  002e 6b01          	ld	(OFST+0,sp),a
1692  0030 2002          	jra	L725
1693  0032               L525:
1694                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1696  0032 0f01          	clr	(OFST+0,sp)
1697  0034               L725:
1698                     ; 434   return status;
1700  0034 7b01          	ld	a,(OFST+0,sp)
1703  0036 85            	popw	x
1704  0037 81            	ret
1789                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1789                     ; 550 {
1790                     .text:	section	.text,new
1791  0000               _FLASH_WaitForLastOperation:
1793  0000 5203          	subw	sp,#3
1794       00000003      OFST:	set	3
1797                     ; 551   uint8_t flagstatus = 0x00;
1799  0002 0f03          	clr	(OFST+0,sp)
1800                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1802  0004 aeffff        	ldw	x,#65535
1803  0007 1f01          	ldw	(OFST-2,sp),x
1804                     ; 576   UNUSED(FLASH_MemType);
1807  0009 200e          	jra	L375
1808  000b               L175:
1809                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1811  000b c6505f        	ld	a,20575
1812  000e a405          	and	a,#5
1813  0010 6b03          	ld	(OFST+0,sp),a
1814                     ; 580     timeout--;
1816  0012 1e01          	ldw	x,(OFST-2,sp)
1817  0014 1d0001        	subw	x,#1
1818  0017 1f01          	ldw	(OFST-2,sp),x
1819  0019               L375:
1820                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1822  0019 0d03          	tnz	(OFST+0,sp)
1823  001b 2604          	jrne	L775
1825  001d 1e01          	ldw	x,(OFST-2,sp)
1826  001f 26ea          	jrne	L175
1827  0021               L775:
1828                     ; 584   if(timeout == 0x00 )
1830  0021 1e01          	ldw	x,(OFST-2,sp)
1831  0023 2604          	jrne	L106
1832                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1834  0025 a602          	ld	a,#2
1835  0027 6b03          	ld	(OFST+0,sp),a
1836  0029               L106:
1837                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1839  0029 7b03          	ld	a,(OFST+0,sp)
1842  002b 5b03          	addw	sp,#3
1843  002d 81            	ret
1907                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1907                     ; 600 {
1908                     .text:	section	.text,new
1909  0000               _FLASH_EraseBlock:
1911  0000 89            	pushw	x
1912  0001 5206          	subw	sp,#6
1913       00000006      OFST:	set	6
1916                     ; 601   uint32_t startaddress = 0;
1918                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1920  0003 7b0b          	ld	a,(OFST+5,sp)
1921  0005 a1fd          	cp	a,#253
1922  0007 2706          	jreq	L402
1923  0009 7b0b          	ld	a,(OFST+5,sp)
1924  000b a1f7          	cp	a,#247
1925  000d 2603          	jrne	L202
1926  000f               L402:
1927  000f 4f            	clr	a
1928  0010 2010          	jra	L602
1929  0012               L202:
1930  0012 ae0263        	ldw	x,#611
1931  0015 89            	pushw	x
1932  0016 ae0000        	ldw	x,#0
1933  0019 89            	pushw	x
1934  001a ae0010        	ldw	x,#L73
1935  001d cd0000        	call	_assert_failed
1937  0020 5b04          	addw	sp,#4
1938  0022               L602:
1939                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1941  0022 7b0b          	ld	a,(OFST+5,sp)
1942  0024 a1fd          	cp	a,#253
1943  0026 2626          	jrne	L536
1944                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1946  0028 1e07          	ldw	x,(OFST+1,sp)
1947  002a a30080        	cpw	x,#128
1948  002d 2403          	jruge	L012
1949  002f 4f            	clr	a
1950  0030 2010          	jra	L212
1951  0032               L012:
1952  0032 ae0266        	ldw	x,#614
1953  0035 89            	pushw	x
1954  0036 ae0000        	ldw	x,#0
1955  0039 89            	pushw	x
1956  003a ae0010        	ldw	x,#L73
1957  003d cd0000        	call	_assert_failed
1959  0040 5b04          	addw	sp,#4
1960  0042               L212:
1961                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1963  0042 ae8000        	ldw	x,#32768
1964  0045 1f05          	ldw	(OFST-1,sp),x
1965  0047 ae0000        	ldw	x,#0
1966  004a 1f03          	ldw	(OFST-3,sp),x
1968  004c 2024          	jra	L736
1969  004e               L536:
1970                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1972  004e 1e07          	ldw	x,(OFST+1,sp)
1973  0050 a3000a        	cpw	x,#10
1974  0053 2403          	jruge	L412
1975  0055 4f            	clr	a
1976  0056 2010          	jra	L612
1977  0058               L412:
1978  0058 ae026b        	ldw	x,#619
1979  005b 89            	pushw	x
1980  005c ae0000        	ldw	x,#0
1981  005f 89            	pushw	x
1982  0060 ae0010        	ldw	x,#L73
1983  0063 cd0000        	call	_assert_failed
1985  0066 5b04          	addw	sp,#4
1986  0068               L612:
1987                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1989  0068 ae4000        	ldw	x,#16384
1990  006b 1f05          	ldw	(OFST-1,sp),x
1991  006d ae0000        	ldw	x,#0
1992  0070 1f03          	ldw	(OFST-3,sp),x
1993  0072               L736:
1994                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1996  0072 1e07          	ldw	x,(OFST+1,sp)
1997  0074 a640          	ld	a,#64
1998  0076 cd0000        	call	c_cmulx
2000  0079 96            	ldw	x,sp
2001  007a 1c0003        	addw	x,#OFST-3
2002  007d cd0000        	call	c_ladd
2004  0080 be02          	ldw	x,c_lreg+2
2005  0082 1f01          	ldw	(OFST-5,sp),x
2006                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
2008  0084 721a505b      	bset	20571,#5
2009                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2011  0088 721b505c      	bres	20572,#5
2012                     ; 637     *pwFlash = (uint32_t)0;
2014  008c 1e01          	ldw	x,(OFST-5,sp)
2015  008e a600          	ld	a,#0
2016  0090 e703          	ld	(3,x),a
2017  0092 a600          	ld	a,#0
2018  0094 e702          	ld	(2,x),a
2019  0096 a600          	ld	a,#0
2020  0098 e701          	ld	(1,x),a
2021  009a a600          	ld	a,#0
2022  009c f7            	ld	(x),a
2023                     ; 645 }
2026  009d 5b08          	addw	sp,#8
2027  009f 81            	ret
2132                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2132                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2132                     ; 658 {
2133                     .text:	section	.text,new
2134  0000               _FLASH_ProgramBlock:
2136  0000 89            	pushw	x
2137  0001 5206          	subw	sp,#6
2138       00000006      OFST:	set	6
2141                     ; 659   uint16_t Count = 0;
2143                     ; 660   uint32_t startaddress = 0;
2145                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2147  0003 7b0b          	ld	a,(OFST+5,sp)
2148  0005 a1fd          	cp	a,#253
2149  0007 2706          	jreq	L422
2150  0009 7b0b          	ld	a,(OFST+5,sp)
2151  000b a1f7          	cp	a,#247
2152  000d 2603          	jrne	L222
2153  000f               L422:
2154  000f 4f            	clr	a
2155  0010 2010          	jra	L622
2156  0012               L222:
2157  0012 ae0297        	ldw	x,#663
2158  0015 89            	pushw	x
2159  0016 ae0000        	ldw	x,#0
2160  0019 89            	pushw	x
2161  001a ae0010        	ldw	x,#L73
2162  001d cd0000        	call	_assert_failed
2164  0020 5b04          	addw	sp,#4
2165  0022               L622:
2166                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2168  0022 0d0c          	tnz	(OFST+6,sp)
2169  0024 2706          	jreq	L232
2170  0026 7b0c          	ld	a,(OFST+6,sp)
2171  0028 a110          	cp	a,#16
2172  002a 2603          	jrne	L032
2173  002c               L232:
2174  002c 4f            	clr	a
2175  002d 2010          	jra	L432
2176  002f               L032:
2177  002f ae0298        	ldw	x,#664
2178  0032 89            	pushw	x
2179  0033 ae0000        	ldw	x,#0
2180  0036 89            	pushw	x
2181  0037 ae0010        	ldw	x,#L73
2182  003a cd0000        	call	_assert_failed
2184  003d 5b04          	addw	sp,#4
2185  003f               L432:
2186                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2188  003f 7b0b          	ld	a,(OFST+5,sp)
2189  0041 a1fd          	cp	a,#253
2190  0043 2626          	jrne	L317
2191                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2193  0045 1e07          	ldw	x,(OFST+1,sp)
2194  0047 a30080        	cpw	x,#128
2195  004a 2403          	jruge	L632
2196  004c 4f            	clr	a
2197  004d 2010          	jra	L042
2198  004f               L632:
2199  004f ae029b        	ldw	x,#667
2200  0052 89            	pushw	x
2201  0053 ae0000        	ldw	x,#0
2202  0056 89            	pushw	x
2203  0057 ae0010        	ldw	x,#L73
2204  005a cd0000        	call	_assert_failed
2206  005d 5b04          	addw	sp,#4
2207  005f               L042:
2208                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2210  005f ae8000        	ldw	x,#32768
2211  0062 1f03          	ldw	(OFST-3,sp),x
2212  0064 ae0000        	ldw	x,#0
2213  0067 1f01          	ldw	(OFST-5,sp),x
2215  0069 2024          	jra	L517
2216  006b               L317:
2217                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2219  006b 1e07          	ldw	x,(OFST+1,sp)
2220  006d a3000a        	cpw	x,#10
2221  0070 2403          	jruge	L242
2222  0072 4f            	clr	a
2223  0073 2010          	jra	L442
2224  0075               L242:
2225  0075 ae02a0        	ldw	x,#672
2226  0078 89            	pushw	x
2227  0079 ae0000        	ldw	x,#0
2228  007c 89            	pushw	x
2229  007d ae0010        	ldw	x,#L73
2230  0080 cd0000        	call	_assert_failed
2232  0083 5b04          	addw	sp,#4
2233  0085               L442:
2234                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2236  0085 ae4000        	ldw	x,#16384
2237  0088 1f03          	ldw	(OFST-3,sp),x
2238  008a ae0000        	ldw	x,#0
2239  008d 1f01          	ldw	(OFST-5,sp),x
2240  008f               L517:
2241                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2243  008f 1e07          	ldw	x,(OFST+1,sp)
2244  0091 a640          	ld	a,#64
2245  0093 cd0000        	call	c_cmulx
2247  0096 96            	ldw	x,sp
2248  0097 1c0001        	addw	x,#OFST-5
2249  009a cd0000        	call	c_lgadd
2251                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2253  009d 0d0c          	tnz	(OFST+6,sp)
2254  009f 260a          	jrne	L717
2255                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
2257  00a1 7210505b      	bset	20571,#0
2258                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2260  00a5 7211505c      	bres	20572,#0
2262  00a9 2008          	jra	L127
2263  00ab               L717:
2264                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
2266  00ab 7218505b      	bset	20571,#4
2267                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2269  00af 7219505c      	bres	20572,#4
2270  00b3               L127:
2271                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2273  00b3 5f            	clrw	x
2274  00b4 1f05          	ldw	(OFST-1,sp),x
2275  00b6               L327:
2276                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2278  00b6 1e0d          	ldw	x,(OFST+7,sp)
2279  00b8 72fb05        	addw	x,(OFST-1,sp)
2280  00bb f6            	ld	a,(x)
2281  00bc 1e03          	ldw	x,(OFST-3,sp)
2282  00be 72fb05        	addw	x,(OFST-1,sp)
2283  00c1 f7            	ld	(x),a
2284                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2286  00c2 1e05          	ldw	x,(OFST-1,sp)
2287  00c4 1c0001        	addw	x,#1
2288  00c7 1f05          	ldw	(OFST-1,sp),x
2291  00c9 1e05          	ldw	x,(OFST-1,sp)
2292  00cb a30040        	cpw	x,#64
2293  00ce 25e6          	jrult	L327
2294                     ; 698 }
2297  00d0 5b08          	addw	sp,#8
2298  00d2 81            	ret
2311                     	xdef	_FLASH_WaitForLastOperation
2312                     	xdef	_FLASH_ProgramBlock
2313                     	xdef	_FLASH_EraseBlock
2314                     	xdef	_FLASH_GetFlagStatus
2315                     	xdef	_FLASH_GetBootSize
2316                     	xdef	_FLASH_GetProgrammingTime
2317                     	xdef	_FLASH_GetLowPowerMode
2318                     	xdef	_FLASH_SetProgrammingTime
2319                     	xdef	_FLASH_SetLowPowerMode
2320                     	xdef	_FLASH_EraseOptionByte
2321                     	xdef	_FLASH_ProgramOptionByte
2322                     	xdef	_FLASH_ReadOptionByte
2323                     	xdef	_FLASH_ProgramWord
2324                     	xdef	_FLASH_ReadByte
2325                     	xdef	_FLASH_ProgramByte
2326                     	xdef	_FLASH_EraseByte
2327                     	xdef	_FLASH_ITConfig
2328                     	xdef	_FLASH_DeInit
2329                     	xdef	_FLASH_Lock
2330                     	xdef	_FLASH_Unlock
2331                     	xref	_assert_failed
2332                     	switch	.const
2333  0010               L73:
2334  0010 2e2e5c737476  	dc.b	"..\stvd\cosmic\stm"
2335  0022 38735f737464  	dc.b	"8s_stdperiph_lib\l"
2336  0034 696272617269  	dc.b	"ibraries\stm8s_std"
2337  0046 706572697068  	dc.b	"periph_driver\src\"
2338  0058 73746d38735f  	dc.b	"stm8s_flash.c",0
2339                     	xref.b	c_lreg
2340                     	xref.b	c_x
2341                     	xref.b	c_y
2361                     	xref	c_ladd
2362                     	xref	c_cmulx
2363                     	xref	c_lgadd
2364                     	xref	c_rtol
2365                     	xref	c_umul
2366                     	xref	c_lcmp
2367                     	xref	c_ltor
2368                     	end
