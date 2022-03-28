	PRESERVE8
	THUMB   
	include ../Driver/DriverJeuLaser.inc
	export FlagCligno
	export timer_callback
	

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
FlagCligno dcd 0;		

	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		
	

timer_callback proc
	push {lr, r4, r5}
	mov r0, #1
	ldr r4, =FlagCligno
	ldr r5, [r4]
	cmp r5, #1
	bne flag

	bl GPIOB_Set

	mov r5, #0
	str r5, [r4]
	b after
flag
	bl GPIOB_Clear
	mov r5, #1
	str r5, [r4]
after
	pop {lr,r4,r5}
	bx lr


		
		
	END	