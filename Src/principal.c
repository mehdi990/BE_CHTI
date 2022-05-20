

#include "DriverJeuLaser.h"
#include "GestionSon.h"


extern int THEDFT(short int* signal64ech, char k);
extern short LeSignal[64];
extern short int TabCos;
extern short int TabSin;
int compt[4];


int resultat[64];
short int dma_buf[64];

void StartSon(void);

void CallbackSon(void);
int score[4];
int tab1[64];
int resultat[64];
int tab3[64];

void Callback_Systick(void){
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
  Stop_DMA1;
	for ( int i=0; i<64 ;i++){
		resultat[i]=THEDFT(dma_buf, i);
	}	
	if(resultat[17] >=0x56a8c) {
		compt[0]++;
		if(compt[0] ==20){
			score[0]++;
			compt[0]=0;
			StartSon();
		}
	}
	if (resultat[18] >=0x56a8c){
		compt[1]++;
		if(compt[1] ==20){
			score[1]++;
			compt[1]=0;
			StartSon();
    }
  }
	if (resultat[19] >=0x56a8c){
		compt[2]++;
		if(compt[2] ==20){
			score[2]++;
			compt[2]=0;
			StartSon();
    }
  }
	if (resultat[20] >=0x56a8c){
		compt[3]++;
		if(compt[3] ==20){
			score[3]++;
			compt[3]=0;
			StartSon();
    }
  }
}
	

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();
	for(int i=0;i<4;i++){
		score[i]=0;
	
//config SysTick 
Systick_Period_ff(360000);
Systick_Prio_IT(10, Callback_Systick);
SysTick_On ;
	
//config ADC	
Init_TimingADC_ActiveADC_ff( ADC1, 72 );
Single_Channel_ADC( ADC1, 2 );
Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
	
//config DMA	
Init_ADC1_DMA1( 0, dma_buf );

SysTick_Enable_IT ;

	
	

//============================================================================	
	

while	(1)
	{
	}
}

