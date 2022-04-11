	PRESERVE8
	THUMB   
	import Son	
	import LongueurSon
	export CallbackSon
	export SortieSon	
	include DriverJeuLaser.inc  	

; ====================== zone de réservation de données,  ======================================
	
	
	
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite

index dcd 0
SortieSon dcd 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
		

; écrire le code ici
StartSon proc
	ldr r0, =index
	mov r1, #0
	str r1, [r0]
	ENDP



CallbackSon proc
;
;if(indice<long)
	push {r4,r5,r6,r7,r8,lr}
	ldr r4,=LongueurSon 
	ldr r7, [r4] ;r7--> val de longueurS                     
	ldr r2,=index
	ldr r6,[r2]
	cmp r6,r7
	bgt boucle
	;if index>LongueurS move to continue
	ldr r0,=Son
	ldrsh r1,[r0,r6,lsl#1]
	
	
	ldr r8,=SortieSon
	;ldr r3, [r2]
	add r1,#32768
	mov r5,#719
	mul r1,r1,r5
	asr r1, #16
	str r1,[r8]
	mov r0,r1
	bl PWM_Set_Value_TIM3_Ch3
	
;continue
    ;indice++	

	add r6,r6,#1
	str r6,[r2]
    b fin
boucle
	push {lr}
    bl StartSon
	pop{lr}
	
fin	
	pop {r4,r5,r6,r7,r8,lr}
	bx lr
	
	
	
	
	ENDP
	END
	

	
	;bge fin  ; fin de if
	

		
;Rx= (son[indice]+32768)/92)
	;mov r3,#0
	

	
	
	;lsr r5,r5,#16 ; r5/2^16
	
	
	;str r5,[r8]
	

	
	




;
;
;		
;		




