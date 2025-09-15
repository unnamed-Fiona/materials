   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     	bsct
  17  0000               _time:
  18  0000 0000          	dc.w	0
  19  0002               _button1_pressed:
  20  0002 00            	dc.b	0
  21  0003               _button2_pressed:
  22  0003 00            	dc.b	0
  63                     ; 31 void main(void)
  63                     ; 32 {
  65                     .text:	section	.text,new
  66  0000               _main:
  70                     ; 33     button1_pressed = 0;
  72  0000 3f02          	clr	_button1_pressed
  73                     ; 34 	button2_pressed = 0;
  75  0002 3f03          	clr	_button2_pressed
  76                     ; 36 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);      
  78  0004 4f            	clr	a
  79  0005 cd0000        	call	_CLK_HSIPrescalerConfig
  81                     ; 37     CLK_SWIMConfig(CLK_SWIMDIVIDER_2);//保证16MHz，让设定的中断时间更接近1s
  83  0008 4f            	clr	a
  84  0009 cd0000        	call	_CLK_SWIMConfig
  86                     ; 39   Init_Timer4();
  88  000c cd0000        	call	_Init_Timer4
  90                     ; 40   Init_UART1();
  92  000f cd0000        	call	_Init_UART1
  94                     ; 42   GPIO_Config();
  96  0012 cd0000        	call	L3_GPIO_Config
  98                     ; 43   Send("Program start.\n");
 100  0015 ae000f        	ldw	x,#L32
 101  0018 cd0000        	call	_Send
 103  001b               L52:
 104                     ; 47     if (time >= 1000) {
 106  001b be00          	ldw	x,_time
 107  001d a303e8        	cpw	x,#1000
 108  0020 2509          	jrult	L13
 109                     ; 48         Send("Hello, World!\n");
 111  0022 ae0000        	ldw	x,#L33
 112  0025 cd0000        	call	_Send
 114                     ; 49         time = 0;
 116  0028 5f            	clrw	x
 117  0029 bf00          	ldw	_time,x
 118  002b               L13:
 119                     ; 53     if (button1_pressed) {
 121  002b 3d02          	tnz	_button1_pressed
 122  002d 271e          	jreq	L53
 123                     ; 54         Delay(20000);  
 125  002f ae4e20        	ldw	x,#20000
 126  0032 cd0000        	call	_Delay
 128                     ; 55         if (GPIO_ReadInputPin(BUTTON1_PORT, BUTTON1_PINS)) { // 检测按键是否被释放
 130  0035 4b02          	push	#2
 131  0037 ae500a        	ldw	x,#20490
 132  003a cd0000        	call	_GPIO_ReadInputPin
 134  003d 5b01          	addw	sp,#1
 135  003f 4d            	tnz	a
 136  0040 2709          	jreq	L73
 137                     ; 56             GPIO_WriteReverse(GLED_GPIO_PORT,GLED_GPIO_PINS);
 139  0042 4b80          	push	#128
 140  0044 ae500a        	ldw	x,#20490
 141  0047 cd0000        	call	_GPIO_WriteReverse
 143  004a 84            	pop	a
 144  004b               L73:
 145                     ; 58         button1_pressed = 0;
 147  004b 3f02          	clr	_button1_pressed
 148  004d               L53:
 149                     ; 61     if (button2_pressed) {
 151  004d 3d03          	tnz	_button2_pressed
 152  004f 27ca          	jreq	L52
 153                     ; 62         Delay(20000);
 155  0051 ae4e20        	ldw	x,#20000
 156  0054 cd0000        	call	_Delay
 158                     ; 63         if (GPIO_ReadInputPin(BUTTON2_PORT, BUTTON2_PINS)) { // 检测按键是否被释放
 160  0057 4b04          	push	#4
 161  0059 ae500a        	ldw	x,#20490
 162  005c cd0000        	call	_GPIO_ReadInputPin
 164  005f 5b01          	addw	sp,#1
 165  0061 4d            	tnz	a
 166  0062 2709          	jreq	L34
 167                     ; 64             GPIO_WriteReverse(RLED_GPIO_PORT,RLED_GPIO_PINS);
 169  0064 4b40          	push	#64
 170  0066 ae500a        	ldw	x,#20490
 171  0069 cd0000        	call	_GPIO_WriteReverse
 173  006c 84            	pop	a
 174  006d               L34:
 175                     ; 66         button2_pressed = 0;
 177  006d 3f03          	clr	_button2_pressed
 178  006f 20aa          	jra	L52
 215                     ; 74 void UART1_SendString(char* str) {
 216                     .text:	section	.text,new
 217  0000               _UART1_SendString:
 219  0000 89            	pushw	x
 220       00000000      OFST:	set	0
 223  0001 2017          	jra	L56
 224  0003               L36:
 225                     ; 76         UART1_SendData8(*str++);
 227  0003 1e01          	ldw	x,(OFST+1,sp)
 228  0005 1c0001        	addw	x,#1
 229  0008 1f01          	ldw	(OFST+1,sp),x
 230  000a 1d0001        	subw	x,#1
 231  000d f6            	ld	a,(x)
 232  000e cd0000        	call	_UART1_SendData8
 235  0011               L37:
 236                     ; 77         while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 238  0011 ae0080        	ldw	x,#128
 239  0014 cd0000        	call	_UART1_GetFlagStatus
 241  0017 4d            	tnz	a
 242  0018 27f7          	jreq	L37
 243  001a               L56:
 244                     ; 75     while (*str) {
 246  001a 1e01          	ldw	x,(OFST+1,sp)
 247  001c 7d            	tnz	(x)
 248  001d 26e4          	jrne	L36
 249                     ; 79 }
 252  001f 85            	popw	x
 253  0020 81            	ret
 281                     ; 82 void Init_Timer4(void)
 281                     ; 83 {
 282                     .text:	section	.text,new
 283  0000               _Init_Timer4:
 287                     ; 84     time = 0;
 289  0000 5f            	clrw	x
 290  0001 bf00          	ldw	_time,x
 291                     ; 85 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125);                      //预分频128，自动重载155
 293  0003 ae007d        	ldw	x,#125
 294  0006 a607          	ld	a,#7
 295  0008 95            	ld	xh,a
 296  0009 cd0000        	call	_TIM4_TimeBaseInit
 298                     ; 87   TIM4_ClearFlag(TIM4_FLAG_UPDATE);                              //清除更新标志
 300  000c a601          	ld	a,#1
 301  000e cd0000        	call	_TIM4_ClearFlag
 303                     ; 90 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);                     //中断计时器
 305  0011 ae0001        	ldw	x,#1
 306  0014 a601          	ld	a,#1
 307  0016 95            	ld	xh,a
 308  0017 cd0000        	call	_TIM4_ITConfig
 310                     ; 91 	TIM4_Cmd(ENABLE);                                       //启动
 312  001a a601          	ld	a,#1
 313  001c cd0000        	call	_TIM4_Cmd
 315                     ; 92 }
 318  001f 81            	ret
 344                     ; 95 void Init_UART1(void)
 344                     ; 96 {
 345                     .text:	section	.text,new
 346  0000               _Init_UART1:
 350                     ; 97 	UART1_DeInit();
 352  0000 cd0000        	call	_UART1_DeInit
 354                     ; 98 	UART1_Init((u32)115200,                            //波特率
 354                     ; 99   UART1_WORDLENGTH_8D,                          //8数据位
 354                     ; 100   UART1_STOPBITS_1,                               //1位停止位
 354                     ; 101   UART1_PARITY_NO,                                  //无校验位
 354                     ; 102   UART1_SYNCMODE_CLOCK_DISABLE,                    //禁同步时钟
 354                     ; 103   UART1_MODE_TXRX_ENABLE);                               //发送且接收
 356  0003 4b0c          	push	#12
 357  0005 4b80          	push	#128
 358  0007 4b00          	push	#0
 359  0009 4b00          	push	#0
 360  000b 4b00          	push	#0
 361  000d aec200        	ldw	x,#49664
 362  0010 89            	pushw	x
 363  0011 ae0001        	ldw	x,#1
 364  0014 89            	pushw	x
 365  0015 cd0000        	call	_UART1_Init
 367  0018 5b09          	addw	sp,#9
 368                     ; 105   UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
 370  001a 4b01          	push	#1
 371  001c ae0205        	ldw	x,#517
 372  001f cd0000        	call	_UART1_ITConfig
 374  0022 84            	pop	a
 375                     ; 108 }
 378  0023 81            	ret
 415                     ; 111 void Send(char* c) {
 416                     .text:	section	.text,new
 417  0000               _Send:
 419  0000 89            	pushw	x
 420       00000000      OFST:	set	0
 423  0001               L731:
 424                     ; 112   while((UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET)); // 等待发送缓冲区空
 426  0001 ae0080        	ldw	x,#128
 427  0004 cd0000        	call	_UART1_GetFlagStatus
 429  0007 4d            	tnz	a
 430  0008 27f7          	jreq	L731
 431                     ; 113   UART1_SendString(c); // 发送字符串
 433  000a 1e01          	ldw	x,(OFST+1,sp)
 434  000c cd0000        	call	_UART1_SendString
 436                     ; 114 }
 439  000f 85            	popw	x
 440  0010 81            	ret
 466                     ; 117 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) {
 468                     .text:	section	.text,new
 469  0000               f_TIM4_UPD_OVF_IRQHandler:
 471  0000 3b0002        	push	c_x+2
 472  0003 be00          	ldw	x,c_x
 473  0005 89            	pushw	x
 474  0006 3b0002        	push	c_y+2
 475  0009 be00          	ldw	x,c_y
 476  000b 89            	pushw	x
 479                     ; 118   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 481  000c a601          	ld	a,#1
 482  000e cd0000        	call	_TIM4_ClearITPendingBit
 484                     ; 119   time++;
 486  0011 be00          	ldw	x,_time
 487  0013 1c0001        	addw	x,#1
 488  0016 bf00          	ldw	_time,x
 489                     ; 120 }
 492  0018 85            	popw	x
 493  0019 bf00          	ldw	c_y,x
 494  001b 320002        	pop	c_y+2
 495  001e 85            	popw	x
 496  001f bf00          	ldw	c_x,x
 497  0021 320002        	pop	c_x+2
 498  0024 80            	iret
 524                     ; 123 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 6) {
 525                     .text:	section	.text,new
 526  0000               f_EXTI_PORTC_IRQHandler:
 528  0000 3b0002        	push	c_x+2
 529  0003 be00          	ldw	x,c_x
 530  0005 89            	pushw	x
 531  0006 3b0002        	push	c_y+2
 532  0009 be00          	ldw	x,c_y
 533  000b 89            	pushw	x
 536                     ; 124   if (!GPIO_ReadInputPin(BUTTON1_PORT, BUTTON1_PINS)) {
 538  000c 4b02          	push	#2
 539  000e ae500a        	ldw	x,#20490
 540  0011 cd0000        	call	_GPIO_ReadInputPin
 542  0014 5b01          	addw	sp,#1
 543  0016 4d            	tnz	a
 544  0017 2604          	jrne	L361
 545                     ; 125       button1_pressed = 1;
 547  0019 35010002      	mov	_button1_pressed,#1
 548  001d               L361:
 549                     ; 127   if (!GPIO_ReadInputPin(BUTTON2_PORT, BUTTON2_PINS)) {
 551  001d 4b04          	push	#4
 552  001f ae500a        	ldw	x,#20490
 553  0022 cd0000        	call	_GPIO_ReadInputPin
 555  0025 5b01          	addw	sp,#1
 556  0027 4d            	tnz	a
 557  0028 2604          	jrne	L561
 558                     ; 128       button2_pressed = 1;
 560  002a 35010003      	mov	_button2_pressed,#1
 561  002e               L561:
 562                     ; 130 }
 565  002e 85            	popw	x
 566  002f bf00          	ldw	c_y,x
 567  0031 320002        	pop	c_y+2
 568  0034 85            	popw	x
 569  0035 bf00          	ldw	c_x,x
 570  0037 320002        	pop	c_x+2
 571  003a 80            	iret
 595                     ; 133 static void GPIO_Config(void)
 595                     ; 134 {
 597                     .text:	section	.text,new
 598  0000               L3_GPIO_Config:
 602                     ; 135   GPIO_Init(RLED_GPIO_PORT, (GPIO_Pin_TypeDef)RLED_GPIO_PINS, GPIO_MODE_OUT_PP_HIGH_FAST);  //上电
 604  0000 4bf0          	push	#240
 605  0002 4b40          	push	#64
 606  0004 ae500a        	ldw	x,#20490
 607  0007 cd0000        	call	_GPIO_Init
 609  000a 85            	popw	x
 610                     ; 136   GPIO_Init(GLED_GPIO_PORT, (GPIO_Pin_TypeDef)GLED_GPIO_PINS, GPIO_MODE_OUT_PP_HIGH_FAST);
 612  000b 4bf0          	push	#240
 613  000d 4b80          	push	#128
 614  000f ae500a        	ldw	x,#20490
 615  0012 cd0000        	call	_GPIO_Init
 617  0015 85            	popw	x
 618                     ; 137   GPIO_Init(BUTTON1_PORT, (GPIO_Pin_TypeDef)BUTTON1_PINS, GPIO_MODE_IN_PU_IT);          //按下拉低电压
 620  0016 4b60          	push	#96
 621  0018 4b02          	push	#2
 622  001a ae500a        	ldw	x,#20490
 623  001d cd0000        	call	_GPIO_Init
 625  0020 85            	popw	x
 626                     ; 138   GPIO_Init(BUTTON2_PORT, (GPIO_Pin_TypeDef)BUTTON2_PINS, GPIO_MODE_IN_PU_IT);
 628  0021 4b60          	push	#96
 629  0023 4b04          	push	#4
 630  0025 ae500a        	ldw	x,#20490
 631  0028 cd0000        	call	_GPIO_Init
 633  002b 85            	popw	x
 634                     ; 139   EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);//按下沿触发中断
 636  002c ae0002        	ldw	x,#2
 637  002f a602          	ld	a,#2
 638  0031 95            	ld	xh,a
 639  0032 cd0000        	call	_EXTI_SetExtIntSensitivity
 641                     ; 140 }
 644  0035 81            	ret
 678                     ; 143 void Delay(uint16_t nCount)
 678                     ; 144 {
 679                     .text:	section	.text,new
 680  0000               _Delay:
 682  0000 89            	pushw	x
 683       00000000      OFST:	set	0
 686  0001 2007          	jra	L712
 687  0003               L512:
 688                     ; 148     nCount--;
 690  0003 1e01          	ldw	x,(OFST+1,sp)
 691  0005 1d0001        	subw	x,#1
 692  0008 1f01          	ldw	(OFST+1,sp),x
 693  000a               L712:
 694                     ; 146   while (nCount != 0)
 696  000a 1e01          	ldw	x,(OFST+1,sp)
 697  000c 26f5          	jrne	L512
 698                     ; 150 }
 701  000e 85            	popw	x
 702  000f 81            	ret
 737                     ; 156 void assert_failed(u8* file, u32 line)
 737                     ; 157 { 
 738                     .text:	section	.text,new
 739  0000               _assert_failed:
 743  0000               L142:
 744  0000 20fe          	jra	L142
 786                     	xdef	f_EXTI_PORTC_IRQHandler
 787                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 788                     	xdef	_main
 789                     	xdef	_button2_pressed
 790                     	xdef	_button1_pressed
 791                     	xdef	_time
 792                     	xdef	_UART1_SendString
 793                     	xdef	_Send
 794                     	xdef	_Init_UART1
 795                     	xdef	_Init_Timer4
 796                     	xdef	_Delay
 797                     	xdef	_assert_failed
 798                     	xref	_UART1_GetFlagStatus
 799                     	xref	_UART1_SendData8
 800                     	xref	_UART1_ITConfig
 801                     	xref	_UART1_Init
 802                     	xref	_UART1_DeInit
 803                     	xref	_TIM4_ClearITPendingBit
 804                     	xref	_TIM4_ClearFlag
 805                     	xref	_TIM4_ITConfig
 806                     	xref	_TIM4_Cmd
 807                     	xref	_TIM4_TimeBaseInit
 808                     	xref	_GPIO_ReadInputPin
 809                     	xref	_GPIO_WriteReverse
 810                     	xref	_GPIO_Init
 811                     	xref	_EXTI_SetExtIntSensitivity
 812                     	xref	_CLK_SWIMConfig
 813                     	xref	_CLK_HSIPrescalerConfig
 814                     .const:	section	.text
 815  0000               L33:
 816  0000 48656c6c6f2c  	dc.b	"Hello, World!",10,0
 817  000f               L32:
 818  000f 50726f677261  	dc.b	"Program start.",10,0
 819                     	xref.b	c_x
 820                     	xref.b	c_y
 840                     	end
