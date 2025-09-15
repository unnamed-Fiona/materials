

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#define INPUT_PORT GPIOD
#define INPUT_PIN GPIO_PIN_4
#define SAMPLE_HZ 10
#define STDU 5000
uint8_t HexTable[] = { '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F' };//ʮ������ת����
volatile uint8_t adc_flag = 0;

// ��ʱ��2��ʼ����10Hz����ADC��
void Init_Timer4(void)
{
	
    TIM4_DeInit();                                            //��ʼ��
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 1242);               //Ԥ��Ƶ128���Զ�����1242
    /* Clear TIM4 update flag */
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);                         //������±�־
	 /* Enable update interrupt */
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);                    //�жϼ�ʱ��
    TIM4_Cmd(ENABLE);                                         //����
    
    // �������
    // Ԥ��Ƶ���Ƶ�� = F_CPU / 128 = 16000000 / 128 = 125000 Hz
    // ���������� = 125000 / 10 = 12500
    // �Զ�����ֵ = 12500 - 1 = 124
	/* Clear TIM4 update flag */
}
void Init_UART1(void)
{
	UART1_DeInit();
	UART1_Init((u32)115200, 
		UART1_WORDLENGTH_8D,//����λ����8
		UART1_STOPBITS_1, //ֹͣλ��Ϊ1
		UART1_PARITY_NO, //У��λ��ʹ��
		UART1_SYNCMODE_CLOCK_DISABLE, //ͬ��ģʽʱ�ӽ���
		UART1_MODE_TX_ENABLE); //����ģʽ����
	UART1_Cmd(ENABLE);
}
void Send(uint8_t dat)             //����һ���ֽ�
{
  while(( UART1_GetFlagStatus(UART1_FLAG_TXE)==RESET));
	
		UART1_SendData8(dat);
	
}
void Init_ADC(void)           //��ʼ��ADC
{
	GPIO_Init(INPUT_PORT,INPUT_PIN, GPIO_MODE_IN_FL_NO_IT); //GPIOD.2����Ϊģ�����룬�������룬���жϣ����ں�����ȡ�����ŵ�ģ����
	ADC1_DeInit();//���³�ʼ��
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,//ADC1ÿ������ת��һ��
		ADC1_CHANNEL_3,//����ͨ����STM8S��5��ģ������ͨ�����ֱ���0-4
		ADC1_PRESSEL_FCPU_D2, //ADC1ʱ��Ƶ��ΪFCPU/2��CPUʱ��Ƶ�ʵ�һ��
		ADC1_EXTTRIG_TIM, //�ⲿ��������
		DISABLE, ADC1_ALIGN_RIGHT, //�Ҷ��룬ֻ�õ���8λ���Ҷ��뷽��
		ADC1_SCHMITTTRIG_CHANNEL3, ENABLE);//ͨ��3����ʩ���ش���������߿���������
	ADC1_Cmd(ENABLE);



}
/*
void UART1_sendhex(unsigned char dat)
{
		Send('0');
		Send('x');
		Send(HexTable[dat >> 4]);//���͸�4λ������HexTable���Ҷ�Ӧ���ַ�
		Send(HexTable[dat&0x0f]);
		Send(' ');
}
*/
void UART1_sendstr(unsigned char *dat)
{
	char i = 0;
	/*
	while(*dat!='\0')
	{
		Send(*dat);
		dat++;
		//delay2us();
	}
	*/
	for (i = 0;i < 4;i++) {
		Send(dat[i]);
		if (!i) {
			Send('.');
		}
	}
}



void main(void)
{
	char s[4] = { 0 };
	FlagStatus flag_status;           //ö�����ͣ������жϱ�־λ�Ƿ�����
	u16 u16_adc1_value;             //�洢ADC1ת�������u16Ϊ16λ�޷�������
	u16 U;                 //�洢ʵ�ʵ�ѹֵ��������������λ���㣬��������о�����Ҫ��Ƕ��ʽ�����
	Init_UART1();                //��ʼ�����ڣ����ں���λ��ͨ��
	Init_ADC();                      //��ʼ��ADC
	Init_Timer4();                //��ʼ����ʱ��4
 /* Infinite loop */
  while (1)
  {
	  if (adc_flag) {
		  //Send(0xf0);Ϊʲô���ﲻ�ܷ���0xf0������0xf0�ᵼ�´��ڽ��ղ�������
		  ADC1_StartConversion();         //����ADC1ת����ģ���ź�ת��Ϊ�����ź�
		  flag_status = ADC1_GetFlagStatus(ADC1_FLAG_EOC); //�ж�ADC1ת���Ƿ����
		  while (flag_status == RESET); //�ȴ�ת�����
		  u16_adc1_value = ADC1_GetConversionValue(); //��ȡת�����
		  U = (u16_adc1_value * STDU) / 1024; //����ʵ�ʵ�ѹֵ��ADC�Ĳο���ѹ��3300mV��8λADC���ֵΪ255������Ҫ����3300�ٳ���255
		  /*
		  UART1_sendhex((U >> 8));//���͸�8λ
		  UART1_sendhex((U & 0xff));//���͵�8λ������ͨ��һ��ֻ�ܷ���һ���ֽڣ�����Ҫ�ֿ�����
		  UART1_sendstr("\r\n");//���ͻ���
		  */
		  s[0] = (U / 1000) + '0';
		  s[1] = ((U % 1000) / 100) + '0';
		  s[2] = ((U % 100) / 10) + '0';
		  s[3] = (U % 10) + '0';
		  UART1_sendstr(s);
		  //����Ҫ��ʵ�ʵ�·����֮����ݹ�ʽ����ʵ�ʵ�ѹ�͵�������//////////////////////////////////////////////////////////////
		  adc_flag = 0;
	  }
  }
}
INTERRUPT_HANDLER(TIM4_UPD_OVF_BRK_IRQHandler, 23) {
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	adc_flag = 1;
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