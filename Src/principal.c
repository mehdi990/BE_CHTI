

#include "DriverJeuLaser.h"

extern int THEDFT(short int* signal64ech, char k);
extern short LeSignal[64];
int resultat[64];



int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();


	
	

//============================================================================	
	
for(int k=0;k<64;k++){

	resultat[k]=THEDFT(LeSignal,k);
}
while	(1)
	{
	}
}

