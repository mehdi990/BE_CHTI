	PRESERVE8
	THUMB   
	#include "GestionSon.h"  	

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		

	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici
CallbackSon proc
;
;if(indice<long)
	push {r4-r6,lr}
	ldr r0,=son
	ldr r2,=index
	ldr r4,=LongueurSon
	ldrsh r1,[r0,r2,lsl#1]
	cmp r2,r4
	bge end
	add r2,r2,#1
	mov r5,#719
	
	
	

;Rx= (son[indice]+32768)/92)
;indice++
;
;
;		
;		






END	