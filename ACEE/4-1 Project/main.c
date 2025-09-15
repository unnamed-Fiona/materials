
#include "stm8s.h"


#define RLED_GPIO_PORT  (GPIOC)
#define RLED_GPIO_PINS  (GPIO_PIN_6)
#define GLED_GPIO_PORT  (GPIOC)
#define GLED_GPIO_PINS  (GPIO_PIN_7)
#define BUTTON1_PORT (GPIOC)
#define BUTTON1_PINS (GPIO_PIN_1)
#define BUTTON2_PORT (GPIOC)
#define BUTTON2_PINS (GPIO_PIN_2)


void Delay (uint16_t nCount);
static void GPIO_Config(void);
void Init_Timer4(void);
void Init_UART1(void);
void Send(char* c) ;
void Delay(uint16_t nCount);
void UART1_SendString(char* str);


volatile uint16_t time=0;
volatile uint8_t button1_pressed=0;
volatile uint8_t button2_pressed=0;




void main(void)
{
    button1_pressed = 0;
	button2_pressed = 0;
  /* Initialize I/Os in Output Mode */
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);      
    CLK_SWIMConfig(CLK_SWIMDIVIDER_2);//保证16MHz，让设定的中断时间更接近1s
		
  Init_Timer4();
  Init_UART1();
	
  GPIO_Config();
  Send("Program start.\n");
  
  while(1) {
    // 每秒发送
    if (time >= 1000) {
        Send("Hello, World!\n");
        time = 0;
    }
    
    // 按钮处理（防抖动）
    if (button1_pressed) {
        Delay(20000);  
        if (GPIO_ReadInputPin(BUTTON1_PORT, BUTTON1_PINS)) { // 检测按键是否被释放
            GPIO_WriteReverse(GLED_GPIO_PORT,GLED_GPIO_PINS);
        }
        button1_pressed = 0;
    }

    if (button2_pressed) {
        Delay(20000);
        if (GPIO_ReadInputPin(BUTTON2_PORT, BUTTON2_PINS)) { // 检测按键是否被释放
            GPIO_WriteReverse(RLED_GPIO_PORT,RLED_GPIO_PINS);
        }
        button2_pressed = 0;
    }
  }

}



void UART1_SendString(char* str) {
    while (*str) {
        UART1_SendData8(*str++);
        while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
    }
}


void Init_Timer4(void)
{
    time = 0;
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125);                      //预分频128，自动重载155
  /* Clear TIM4 update flag */
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);                              //清除更新标志
	
	 /* Enable update interrupt */
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);                     //中断计时器
	TIM4_Cmd(ENABLE);                                       //启动
}


void Init_UART1(void)
{
	UART1_DeInit();
	UART1_Init((u32)115200,                            //波特率
  UART1_WORDLENGTH_8D,                          //8数据位
  UART1_STOPBITS_1,                               //1位停止位
  UART1_PARITY_NO,                                  //无校验位
  UART1_SYNCMODE_CLOCK_DISABLE,                    //禁同步时钟
  UART1_MODE_TXRX_ENABLE);                               //发送且接收
	
  UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);

//	UART1_Cmd(ENABLE);
}


void Send(char* c) {
  while((UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET)); // 等待发送缓冲区空
  UART1_SendString(c); // 发送字符串
}


INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) {
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  time++;
}


INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 6) {
  if (!GPIO_ReadInputPin(BUTTON1_PORT, BUTTON1_PINS)) {
      button1_pressed = 1;
  }
  if (!GPIO_ReadInputPin(BUTTON2_PORT, BUTTON2_PINS)) {
      button2_pressed = 1;
  }
}


static void GPIO_Config(void)
{
  GPIO_Init(RLED_GPIO_PORT, (GPIO_Pin_TypeDef)RLED_GPIO_PINS, GPIO_MODE_OUT_PP_HIGH_FAST);  //上电
  GPIO_Init(GLED_GPIO_PORT, (GPIO_Pin_TypeDef)GLED_GPIO_PINS, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(BUTTON1_PORT, (GPIO_Pin_TypeDef)BUTTON1_PINS, GPIO_MODE_IN_PU_IT);          //按下拉低电压
  GPIO_Init(BUTTON2_PORT, (GPIO_Pin_TypeDef)BUTTON2_PINS, GPIO_MODE_IN_PU_IT);
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);//按下沿触发中断
}


void Delay(uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}


#ifdef USE_FULL_ASSERT


void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
