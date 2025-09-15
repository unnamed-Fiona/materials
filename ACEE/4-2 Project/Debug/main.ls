   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _HexTable:
  17  0000 30            	dc.b	48
  18  0001 31            	dc.b	49
  19  0002 32            	dc.b	50
  20  0003 33            	dc.b	51
  21  0004 34            	dc.b	52
  22  0005 35            	dc.b	53
  23  0006 36            	dc.b	54
  24  0007 37            	dc.b	55
  25  0008 38            	dc.b	56
  26  0009 39            	dc.b	57
  27  000a 41            	dc.b	65
  28  000b 42            	dc.b	66
  29  000c 43            	dc.b	67
  30  000d 44            	dc.b	68
  31  000e 45            	dc.b	69
  32  000f 46            	dc.b	70
  33  0010               _adc_flag:
  34  0010 00            	dc.b	0
  68                     ; 12 void Init_Timer4(void)
  68                     ; 13 {
  70                     	switch	.text
  71  0000               _Init_Timer4:
  75                     ; 15     TIM4_DeInit();                                            //初始化
  77  0000 cd0000        	call	_TIM4_DeInit
  79                     ; 16     TIM4_TimeBaseInit(TIM4_PRESCALER_128, 1242);               //预分频128，自动重载1242
  81  0003 ae00da        	ldw	x,#218
  82  0006 a607          	ld	a,#7
  83  0008 95            	ld	xh,a
  84  0009 cd0000        	call	_TIM4_TimeBaseInit
  86                     ; 18     TIM4_ClearFlag(TIM4_FLAG_UPDATE);                         //清除更新标志
  88  000c a601          	ld	a,#1
  89  000e cd0000        	call	_TIM4_ClearFlag
  91                     ; 20     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);                    //中断计时器
  93  0011 ae0001        	ldw	x,#1
  94  0014 a601          	ld	a,#1
  95  0016 95            	ld	xh,a
  96  0017 cd0000        	call	_TIM4_ITConfig
  98                     ; 21     TIM4_Cmd(ENABLE);                                         //启动
 100  001a a601          	ld	a,#1
 101  001c cd0000        	call	_TIM4_Cmd
 103                     ; 28 }
 106  001f 81            	ret
 132                     ; 29 void Init_UART1(void)
 132                     ; 30 {
 133                     	switch	.text
 134  0020               _Init_UART1:
 138                     ; 31 	UART1_DeInit();
 140  0020 cd0000        	call	_UART1_DeInit
 142                     ; 32 	UART1_Init((u32)115200, 
 142                     ; 33 		UART1_WORDLENGTH_8D,//数据位长度8
 142                     ; 34 		UART1_STOPBITS_1, //停止位设为1
 142                     ; 35 		UART1_PARITY_NO, //校验位不使用
 142                     ; 36 		UART1_SYNCMODE_CLOCK_DISABLE, //同步模式时钟禁用
 142                     ; 37 		UART1_MODE_TX_ENABLE); //传输模式启用
 144  0023 4b04          	push	#4
 145  0025 4b80          	push	#128
 146  0027 4b00          	push	#0
 147  0029 4b00          	push	#0
 148  002b 4b00          	push	#0
 149  002d aec200        	ldw	x,#49664
 150  0030 89            	pushw	x
 151  0031 ae0001        	ldw	x,#1
 152  0034 89            	pushw	x
 153  0035 cd0000        	call	_UART1_Init
 155  0038 5b09          	addw	sp,#9
 156                     ; 38 	UART1_Cmd(ENABLE);
 158  003a a601          	ld	a,#1
 159  003c cd0000        	call	_UART1_Cmd
 161                     ; 39 }
 164  003f 81            	ret
 200                     ; 40 void Send(uint8_t dat)             //发送一个字节
 200                     ; 41 {
 201                     	switch	.text
 202  0040               _Send:
 204  0040 88            	push	a
 205       00000000      OFST:	set	0
 208  0041               L15:
 209                     ; 42   while(( UART1_GetFlagStatus(UART1_FLAG_TXE)==RESET));
 211  0041 ae0080        	ldw	x,#128
 212  0044 cd0000        	call	_UART1_GetFlagStatus
 214  0047 4d            	tnz	a
 215  0048 27f7          	jreq	L15
 216                     ; 44 		UART1_SendData8(dat);
 218  004a 7b01          	ld	a,(OFST+1,sp)
 219  004c cd0000        	call	_UART1_SendData8
 221                     ; 46 }
 224  004f 84            	pop	a
 225  0050 81            	ret
 252                     ; 47 void Init_ADC(void)           //初始化ADC
 252                     ; 48 {
 253                     	switch	.text
 254  0051               _Init_ADC:
 258                     ; 49 	GPIO_Init(INPUT_PORT,INPUT_PIN, GPIO_MODE_IN_FL_NO_IT); //GPIOD.2设置为模拟输入，浮动输入，无中断，便于后续读取该引脚的模拟量
 260  0051 4b00          	push	#0
 261  0053 4b04          	push	#4
 262  0055 ae500f        	ldw	x,#20495
 263  0058 cd0000        	call	_GPIO_Init
 265  005b 85            	popw	x
 266                     ; 50 	ADC1_DeInit();//重新初始化
 268  005c cd0000        	call	_ADC1_DeInit
 270                     ; 51 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,//ADC1每次启动转化一次
 270                     ; 52 		ADC1_CHANNEL_3,//输入通道，STM8S有5个模拟输入通道，分别是0-4
 270                     ; 53 		ADC1_PRESSEL_FCPU_D2, //ADC1时钟频率为FCPU/2，CPU时钟频率的一半
 270                     ; 54 		ADC1_EXTTRIG_TIM, //外部触发禁用
 270                     ; 55 		DISABLE, ADC1_ALIGN_RIGHT, //右对齐，只用到了8位，右对齐方便
 270                     ; 56 		ADC1_SCHMITTTRIG_CHANNEL3, ENABLE);//通道3开启施密特触发器，提高抗干扰能力
 272  005f 4b01          	push	#1
 273  0061 4b03          	push	#3
 274  0063 4b08          	push	#8
 275  0065 4b00          	push	#0
 276  0067 4b00          	push	#0
 277  0069 4b00          	push	#0
 278  006b ae0003        	ldw	x,#3
 279  006e 4f            	clr	a
 280  006f 95            	ld	xh,a
 281  0070 cd0000        	call	_ADC1_Init
 283  0073 5b06          	addw	sp,#6
 284                     ; 57 	ADC1_Cmd(ENABLE);
 286  0075 a601          	ld	a,#1
 287  0077 cd0000        	call	_ADC1_Cmd
 289                     ; 61 }
 292  007a 81            	ret
 328                     ; 62 void UART1_sendhex(unsigned char dat)
 328                     ; 63 {
 329                     	switch	.text
 330  007b               _UART1_sendhex:
 332  007b 88            	push	a
 333       00000000      OFST:	set	0
 336                     ; 64 		Send('0');
 338  007c a630          	ld	a,#48
 339  007e adc0          	call	_Send
 341                     ; 65 		Send('x');
 343  0080 a678          	ld	a,#120
 344  0082 adbc          	call	_Send
 346                     ; 66 		Send(HexTable[dat >> 4]);//发送高4位，利用HexTable查找对应的字符
 348  0084 7b01          	ld	a,(OFST+1,sp)
 349  0086 4e            	swap	a
 350  0087 a40f          	and	a,#15
 351  0089 5f            	clrw	x
 352  008a 97            	ld	xl,a
 353  008b e600          	ld	a,(_HexTable,x)
 354  008d adb1          	call	_Send
 356                     ; 67 		Send(HexTable[dat&0x0f]);
 358  008f 7b01          	ld	a,(OFST+1,sp)
 359  0091 a40f          	and	a,#15
 360  0093 5f            	clrw	x
 361  0094 97            	ld	xl,a
 362  0095 e600          	ld	a,(_HexTable,x)
 363  0097 ada7          	call	_Send
 365                     ; 68 		Send(' ');
 367  0099 a620          	ld	a,#32
 368  009b ada3          	call	_Send
 370                     ; 69 }
 373  009d 84            	pop	a
 374  009e 81            	ret
 410                     ; 70 void UART1_sendstr(unsigned char *dat)
 410                     ; 71 {
 411                     	switch	.text
 412  009f               _UART1_sendstr:
 414  009f 89            	pushw	x
 415       00000000      OFST:	set	0
 418  00a0 200c          	jra	L321
 419  00a2               L121:
 420                     ; 74 				Send(*dat);
 422  00a2 1e01          	ldw	x,(OFST+1,sp)
 423  00a4 f6            	ld	a,(x)
 424  00a5 ad99          	call	_Send
 426                     ; 75 				dat++;
 428  00a7 1e01          	ldw	x,(OFST+1,sp)
 429  00a9 1c0001        	addw	x,#1
 430  00ac 1f01          	ldw	(OFST+1,sp),x
 431  00ae               L321:
 432                     ; 72 		while(*dat!='\0')
 434  00ae 1e01          	ldw	x,(OFST+1,sp)
 435  00b0 7d            	tnz	(x)
 436  00b1 26ef          	jrne	L121
 437                     ; 78 }
 440  00b3 85            	popw	x
 441  00b4 81            	ret
 523                     ; 82 void main(void)
 523                     ; 83 {
 524                     	switch	.text
 525  00b5               _main:
 527  00b5 5203          	subw	sp,#3
 528       00000003      OFST:	set	3
 531                     ; 87 	Init_UART1();                //初始化串口，用于和上位机通信
 533  00b7 cd0020        	call	_Init_UART1
 535                     ; 88 	Init_ADC();                      //初始化ADC
 537  00ba ad95          	call	_Init_ADC
 539                     ; 89 	Init_Timer4();                //初始化定时器4
 541  00bc cd0000        	call	_Init_Timer4
 543  00bf               L561:
 544                     ; 93 	  if (adc_flag) {
 546  00bf 3d10          	tnz	_adc_flag
 547  00c1 27fc          	jreq	L561
 548                     ; 95 		  ADC1_StartConversion();         //启动ADC1转换，模拟信号转换为数字信号
 550  00c3 cd0000        	call	_ADC1_StartConversion
 552                     ; 96 		  flag_status = ADC1_GetFlagStatus(ADC1_FLAG_EOC); //判断ADC1转换是否完成
 554  00c6 a680          	ld	a,#128
 555  00c8 cd0000        	call	_ADC1_GetFlagStatus
 557  00cb 6b01          	ld	(OFST-2,sp),a
 559  00cd               L771:
 560                     ; 97 		  while (flag_status == RESET); //等待转换完成
 562  00cd 0d01          	tnz	(OFST-2,sp)
 563  00cf 27fc          	jreq	L771
 564                     ; 98 		  u16_adc1_value = ADC1_GetConversionValue(); //获取转换结果
 566  00d1 cd0000        	call	_ADC1_GetConversionValue
 568  00d4 1f02          	ldw	(OFST-1,sp),x
 569                     ; 99 		  U = (u16_adc1_value * 3300) / 255; //计算实际电压值，ADC的参考电压是3300mV，8位ADC最大值为255，所以要乘以3300再除以255
 571  00d6 1e02          	ldw	x,(OFST-1,sp)
 572  00d8 90ae0ce4      	ldw	y,#3300
 573  00dc cd0000        	call	c_imul
 575  00df a6ff          	ld	a,#255
 576  00e1 62            	div	x,a
 577  00e2 1f02          	ldw	(OFST-1,sp),x
 578                     ; 100 		  UART1_sendhex((U >> 8));//发送高8位
 580  00e4 7b02          	ld	a,(OFST-1,sp)
 581  00e6 ad93          	call	_UART1_sendhex
 583                     ; 101 		  UART1_sendhex((U & 0xff));//发送低8位，串口通信一次只能发送一个字节，所以要分开发送
 585  00e8 7b03          	ld	a,(OFST+0,sp)
 586  00ea a4ff          	and	a,#255
 587  00ec ad8d          	call	_UART1_sendhex
 589                     ; 102 		  UART1_sendstr("\r\n");//发送换行
 591  00ee ae0000        	ldw	x,#L302
 592  00f1 adac          	call	_UART1_sendstr
 594                     ; 104 		  adc_flag = 0;
 596  00f3 3f10          	clr	_adc_flag
 597  00f5 20c8          	jra	L561
 623                     ; 108 INTERRUPT_HANDLER(TIM4_UPD_OVF_BRK_IRQHandler, 23) {
 625                     	switch	.text
 626  00f7               f_TIM4_UPD_OVF_BRK_IRQHandler:
 628  00f7 3b0002        	push	c_x+2
 629  00fa be00          	ldw	x,c_x
 630  00fc 89            	pushw	x
 631  00fd 3b0002        	push	c_y+2
 632  0100 be00          	ldw	x,c_y
 633  0102 89            	pushw	x
 636                     ; 109 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 638  0103 a601          	ld	a,#1
 639  0105 cd0000        	call	_TIM4_ClearITPendingBit
 641                     ; 110 	adc_flag = 1;
 643  0108 35010010      	mov	_adc_flag,#1
 644                     ; 111 }
 647  010c 85            	popw	x
 648  010d bf00          	ldw	c_y,x
 649  010f 320002        	pop	c_y+2
 650  0112 85            	popw	x
 651  0113 bf00          	ldw	c_x,x
 652  0115 320002        	pop	c_x+2
 653  0118 80            	iret
 687                     ; 118 void assert_failed(u8* file, u32 line)
 687                     ; 119 { 
 689                     	switch	.text
 690  0119               _assert_failed:
 694  0119               L332:
 695  0119 20fe          	jra	L332
 729                     	xdef	f_TIM4_UPD_OVF_BRK_IRQHandler
 730                     	xdef	_main
 731                     	xdef	_UART1_sendstr
 732                     	xdef	_UART1_sendhex
 733                     	xdef	_Init_ADC
 734                     	xdef	_Send
 735                     	xdef	_Init_UART1
 736                     	xdef	_Init_Timer4
 737                     	xdef	_adc_flag
 738                     	xdef	_HexTable
 739                     	xdef	_assert_failed
 740                     	xref	_UART1_GetFlagStatus
 741                     	xref	_UART1_SendData8
 742                     	xref	_UART1_Cmd
 743                     	xref	_UART1_Init
 744                     	xref	_UART1_DeInit
 745                     	xref	_TIM4_ClearITPendingBit
 746                     	xref	_TIM4_ClearFlag
 747                     	xref	_TIM4_ITConfig
 748                     	xref	_TIM4_Cmd
 749                     	xref	_TIM4_TimeBaseInit
 750                     	xref	_TIM4_DeInit
 751                     	xref	_GPIO_Init
 752                     	xref	_ADC1_GetFlagStatus
 753                     	xref	_ADC1_GetConversionValue
 754                     	xref	_ADC1_StartConversion
 755                     	xref	_ADC1_Cmd
 756                     	xref	_ADC1_Init
 757                     	xref	_ADC1_DeInit
 758                     .const:	section	.text
 759  0000               L302:
 760  0000 0d0a00        	dc.b	13,10,0
 761                     	xref.b	c_x
 762                     	xref.b	c_y
 782                     	xref	c_imul
 783                     	end
