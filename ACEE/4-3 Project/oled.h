//////////////////////////////////////////////////////////////////////////////////	 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//�о�԰����
//���̵�ַ��http://shop73023976.taobao.com/?spm=2013.1.0.0.M4PqC2
//
//  �� �� ��   : main.c
//  �� �� ��   : v2.0
//  ��    ��   : HuangKai
//  ��������   : 2011-11-07
//  ����޸�   : 
//  ��������   : OLED 4�ӿ���ʾ����(STM8L051F3)
//              ˵��: 
//              ----------------------------------------------------------------
//              GND    ��Դ��
//              VCC  ��3.3v��Դ
//              SCL   PC1
//              SDA   PC0
//              RES  PB6�����ֱ��ѡ��4��iic�ӿڵ���RES�źſ��Բ����ǣ�ֱ�Ӻ��ԣ�
         
//              ----------------------------------------------------------------
// �޸���ʷ   :
// ��    ��   : 
// ��    ��   : HuangKai
// �޸�����   : �����ļ�
//��Ȩ���У�����ؾ���
//Copyright(C) �о�԰����2014/3/16
//All rights reserved
//******************************************************************************/

#ifndef __OLED_H
#define __OLED_H			  	 
//#include "stm8l15x.h"//STM8L051/151��ϵ�й��ÿ⺯��
#include "stm8s.h"
#define OLED_CMD  0	//д����
#define OLED_DATA 1	//д����
#define OLED_MODE 0

/****************ʱ��*********************/
#define OLED_SCLK_PORT  (GPIOC)
#define OLED_SCLK_PINS  (GPIO_PIN_1)

/****************����*********************/
#define OLED_SDIN_PORT  (GPIOB)
#define OLED_SDIN_PINS  (GPIO_PIN_5)

/****************��λ*********************/
#define OLED_RST_PORT  (GPIOC)
#define OLED_RST_PINS  (GPIO_PIN_3)

/****************����/����*********************/
#define OLED_DC_PORT  (GPIOD)
#define OLED_DC_PINS  (GPIO_PIN_4)

/****************Ƭѡ*********************/
#define OLED_CS_PORT  (GPIOA)
#define OLED_CS_PINS  (GPIO_PIN_3)

#define LED_PORT  (GPIOD)
#define LED_PINS  (GPIO_PIN_0)


#define OLED_SCLK_Clr() GPIO_WriteLow(OLED_SCLK_PORT, OLED_SCLK_PINS)
#define OLED_SCLK_Set() GPIO_WriteHigh(OLED_SCLK_PORT, OLED_SCLK_PINS)

#define OLED_SDIN_Clr() GPIO_WriteLow(OLED_SDIN_PORT, OLED_SDIN_PINS)
#define OLED_SDIN_Set() GPIO_WriteHigh(OLED_SDIN_PORT, OLED_SDIN_PINS)

#define OLED_RST_Clr() GPIO_WriteLow(OLED_RST_PORT, OLED_RST_PINS)
#define OLED_RST_Set() GPIO_WriteHigh(OLED_RST_PORT, OLED_RST_PINS)


#define OLED_DC_Clr() GPIO_WriteLow(OLED_DC_PORT, OLED_DC_PINS)
#define OLED_DC_Set() GPIO_WriteHigh(OLED_DC_PORT, OLED_DC_PINS)


#define OLED_CS_Clr()  GPIO_WriteLow(OLED_CS_PORT, OLED_CS_PINS)
#define OLED_CS_Set()  GPIO_WriteHigh(OLED_CS_PORT, OLED_CS_PINS)


#define LED_Clr()  GPIO_WriteLow(LED_PORT, LED_PINS)
#define LED_Set()  GPIO_WriteHigh(LED_PORT, LED_PINS)



#define SIZE 16
#define XLevelL		0x02
#define XLevelH		0x10
#define Max_Column	128
#define Max_Row		64
#define	Brightness	0xFF 
#define X_WIDTH 	128
#define Y_WIDTH 	64	    						  
//-----------------OLED�˿ڶ���----------------  					   

void delay_ms(unsigned int ms);
		     

//OLED�����ú���
	    
void OLED_Display_On(void);
void OLED_Display_Off(void);	   							   		    
void OLED_Init(void);
void OLED_Clear(void);
void OLED_DrawPoint(u8 x,u8 y,u8 t);
void OLED_Fill(u8 x1,u8 y1,u8 x2,u8 y2,u8 dot);
void OLED_ShowChar(u8 x,u8 y,u8 chr);
void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2);
void OLED_ShowString(u8 x,u8 y, u8 *p);	 
void OLED_Set_Pos(unsigned char x, unsigned char y);
void OLED_ShowCHinese(u8 x,u8 y,u8 no);
void OLED_DrawBMP(unsigned char x0, unsigned char y0,unsigned char x1, unsigned char y1,unsigned char BMP[]);
void LED_ON(void);
void LED_OFF(void);
void OLED_DrawLine(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2);
void IIC_Start();
int abs(int t);
void IIC_Stop();
void IIC_Wait_Ack();
void Write_IIC_Byte(unsigned char IIC_Byte);
void Write_IIC_Command(unsigned char IIC_Command);
void Write_IIC_Data(unsigned char IIC_Data);
void OLED_WR_Byte(u8 dat, u8 cmd);
void OLED_Set_Pos(unsigned char x, unsigned char y)
#endif  
	 



