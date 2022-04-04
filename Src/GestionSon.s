	PRESERVE8
	THUMB   
	INCLUDE DriverJeuLaser.inc  	

; ====================== zone de réservation de données,  ======================================
	import Son
	import LongueurSon
	export CallbackSon
	export SortieSon
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite

index dcd 0
SortieSon dcw 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
		

; écrire le code ici
CallbackSon proc
;
;if(indice<long)
	push {r4,r5,r6,r7,r8,lr}
	ldr r0,=Son
	ldr r2,=index
	ldr r6,[r2]
	ldr r4,=LongueurSon
	ldr r8,=SortieSon
	;ldr r3, [r2]
	ldr r7, [r4]

	cmp r6,r7
	bge fin  ; fin de if
	ldrsh r1,[r0,r6,lsl#1]

		
;Rx= (son[indice]+32768)/92)
	mov r3,#0
	mov r5,#719

	add r3,#32768
	mul r5,r5,r3
	lsr r5,r5,#16 ; r5/2^16
	str r5,[r0]
	
	str r5,[r8]
;indice++	

	add r6,r6,#1
	str r6,[r2]
	pop {r4,r5,r6,r7,lr}
	
fin
	bx lr



;
;
;		
;		




endp

END	