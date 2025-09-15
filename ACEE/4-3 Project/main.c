
//#include "stm8l15x.h"//STM8L051/151等系列共用库函数
#include "stm8s.h"
#include "oled.h"
#include<stdlib.h>
/* Private defines -----------------------------------------------------------*/
#define INPUT_PORT GPIOA
#define INPUT_PIN GPIO_PIN_2
#define BUTTON1_PORT (GPIOC)
#define BUTTON1_PINS (GPIO_PIN_3)
#define BUTTON2_PORT (GPIOC)
#define BUTTON2_PINS (GPIO_PIN_2)
#define SAMPLE_HZ 10
#define STDU 5000
volatile uint8_t adc_flag = 0;
//volatile uint8_t button1_pressed = 0;
//volatile uint8_t button2_pressed = 0;
typedef struct queue* Node;
struct queue {
	uint16_t U;
	uint16_t I;
	uint16_t P;
	Node next;
};
/* Private function prototypes -----------------------------------------------*/
void Init_Timer4(void);
void Init_ADC(void);
void Delay(uint16_t nCount);
void dequeue(Node dummy);
void shiftstr(uint16_t num, char* s);
void welcomepage(void);
void datapage(Node end);
void graphpage(Node dummy);
static void GPIO_Config(void);
/* Private functions ---------------------------------------------------------*/
void Init_Timer4(void)
{

	TIM4_DeInit();                                            //��ʼ��
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 12499);               // 预分频128，自动重装载值12499，实现1Hz
	/* Clear TIM4 update flag */
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);                         //������±�־
	/* Enable update interrupt */
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);                    //�жϼ�ʱ��
	TIM4_Cmd(ENABLE);                                         //����

}
void Init_ADC(void)
{
	GPIO_Init(INPUT_PORT, INPUT_PIN, GPIO_MODE_IN_FL_NO_IT); //GPIOD.2����Ϊģ�����룬�������룬���жϣ����ں�����ȡ�����ŵ�ģ����
	ADC1_DeInit();//���³�ʼ��
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,//ADC1ÿ������ת��һ��
		ADC1_CHANNEL_3,//����ͨ����STM8S��5��ģ������ͨ�����ֱ���0-4
		ADC1_PRESSEL_FCPU_D2, //ADC1ʱ��Ƶ��ΪFCPU/2��CPUʱ��Ƶ�ʵ�һ��
		ADC1_EXTTRIG_TIM, //�ⲿ��������
		DISABLE, ADC1_ALIGN_RIGHT, //�Ҷ��룬ֻ�õ���8λ���Ҷ��뷽��
		ADC1_SCHMITTTRIG_CHANNEL3, ENABLE);//ͨ��3����ʩ���ش���������߿���������
	ADC1_Cmd(ENABLE);



}

void Delay(uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {   
    nCount--;
  }
}

void dequeue(Node dummy) {
	Node t = dummy->next;
	while (t = t->next) {
		if (t->P > dummy->I) dummy->I = t->P;//I来暂记去除第一个结点的最高功率
	}
	dummy->P = dummy->I;
	t = dummy->next;
	dummy->next = dummy->next->next;
	free(t);
}

void shiftstr(uint16_t num, char* s) {
	s[0] = num / 1000 + '0';
	s[1] = '.';
	s[2] = (num % 1000) / 100 + '0';
	s[3] = (num % 100) / 10 + '0';
	s[4] = num % 10 + '0';
}

void welcomepage() {
	OLED_Clear();
	OLED_ShowString(30, 10, "Welcome to");

	OLED_ShowString(30, 30, "Circle control");
	OLED_ShowString(30, 50, "ver.1.0");
}

void datapage(Node end) {
	char s[6];
	OLED_Clear();
	shiftstr(end->U,s);
	s[5] = 'V';
	OLED_ShowString(30, 10, s);
	shiftstr(end->I, s);
	s[5] = 'A';
	OLED_ShowString(30, 30 , s);
	shiftstr(end->P, s);
	s[5] = 'W';
	OLED_ShowString(30, 50, s);

}

void graphpage(Node dummy) {
	Node t = dummy;
	uint8_t i = 0,x=12,y=54,prex=12,prey=54;//y=54-(Ptmp/Phist)*40
	OLED_Clear();
	// 绘制坐标轴
	OLED_DrawLine(10, 10, 10, 54);  // Y轴
	OLED_DrawLine(10, 54, 118, 54);
	
	OLED_ShowString(0, 0, "History(10s)");
	OLED_ShowString(90, 54, "t(s)");
	OLED_ShowString(0, 10, "P(W)");
	while (t = t->next) {
		x = 12 + i * 10;
		if (dummy->P) y = 54 - (t->P * 100 / dummy->P) * 40 / 100;
		else y = 0;
		OLED_DrawLine(prex, prey, x, y);
		prex = x;prey = y;
		i++;
	}
}

static void GPIO_Config(void)
{

	GPIO_Init(BUTTON1_PORT, (GPIO_Pin_TypeDef)BUTTON1_PINS, GPIO_MODE_IN_PU_IT);          //按下拉低电压
	GPIO_Init(BUTTON2_PORT, (GPIO_Pin_TypeDef)BUTTON2_PINS, GPIO_MODE_IN_PU_IT);
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);//按下沿触发中断
}

void main(void)
{	u8 page=1;
	FlagStatus flag_status;       //检查标志位状态
	u16 u16_adc1_value; 
  uint16_t U,I,P;	
	struct queue dhead;
	Node t = NULL;
	Node dummy = &dhead,end=&dhead;
	dummy->next = NULL;
	dummy->U = 0;
	GPIO_Config();
		//delay_init();	    	 //?óê±oˉêy3?ê??ˉ	  
	//	NVIC_Configuration(); 	 //éè??NVIC?D??·?×é2:2???à??ó??è??￡?2???ìó|ó??è?? 	LED_Init();			     //LED???ú3?ê??ˉ
		OLED_Init();			//3?ê??ˉOLED  
		OLED_Clear()  	; 
		welcomepage();
	while(1) 
	{		//LED_Clr();
          
		if (!GPIO_ReadInputPin(BUTTON1_PORT, BUTTON1_PINS)) { // 检测按键是否被按下
			delay_ms(50);
			if (page > 1) page--;
		}
			
		if (!GPIO_ReadInputPin(BUTTON2_PORT, BUTTON2_PINS)) { // 检测按键是否被按下
			delay_ms(50);
			if (page < 3) page++;
		}
		switch (page) {
		case 1:
			welcomepage();
			break;
		case 2:
			datapage(end);
			break;
		case 3:
			graphpage(dummy);
			break;
		}
	    if (adc_flag) {
		    //Send(0xf0);
			
			ADC1_StartConversion();        
			flag_status = ADC1_GetFlagStatus(ADC1_FLAG_EOC); 
			while (flag_status == RESET); //�ȴ�ת�����
			u16_adc1_value = ADC1_GetConversionValue(); 
			U = (u16_adc1_value * STDU) / 1024; 
			while (dummy->U > 10) {
				dequeue(dummy);
			}
			
			if ((t = (Node)malloc(sizeof(struct queue))) == NULL) {
				OLED_Clear();
				OLED_ShowString(20, 10, "malloc fail!");
				exit(1);
			}
			t->U = U;
			//I和P待求///////////////////////////////////////////////////并且求P要实时更新dummy head node中P，代表历史最高
			t->next = NULL;
			end->next = t;
			end = end->next;
			adc_flag = 0;
		}

		OLED_Clear();

		
	}	  
	
}
INTERRUPT_HANDLER(TIM4_UPD_OVF_BRK_IRQHandler, 23) {
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	adc_flag = 1;
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
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
