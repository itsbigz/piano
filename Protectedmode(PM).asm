[org 0x7e00]
jmp lose_cursor

gdtr :
   dw gdt_end-gdt-1      ; Length of the gdt
   dd gdt		         ; physical address of gdt
gdt
nullsel equ $-gdt           ; $->current location,so nullsel = 0h
gdt0 		       		 ; Null descriptor,as per convention gdt0 is 0
   dd 0		      		 ; Each gdt entry is 8 bytes, so at 08h it is CS
   dd 0                  ; In all the segment descriptor is 64 bits
codesel equ $-gdt        ; This is 8h,ie 2nd descriptor in gdt
code_gdt		         ; Code descriptor 4Gb flat segment at 0000:0000h
   dw 0xffff	         ; Limit 4Gb  bits 0-15 of segment descriptor
   dw 0x0000	         ; Base 0h bits 16-31 of segment descriptor (sd)
   db 0x00               ; Base addr of seg 16-23 of 32bit addr,32-39 of sd	
   db 0x9a	       		 ; P,DPL(2),S,TYPE(3),A->Present bit 1,Descriptor			; privilege level 0-3,Segment descriptor 1 ie code	    		                  ; or data seg descriptor,Type of seg,Accessed bit
   db 0xcf	       		 ; Upper 4 bits G,D,0,AVL ->1 segment len is page		    ; granular, 1 default operation size is 32bit seg		                              ; AVL : Available field for user or OS
                         ; Lower nibble bits 16-19 of segment limit
   db 0x00	       		 ; Base addr of seg 24-31 of 32bit addr,56-63 of sd
datasel equ $-gdt	     ; ie 10h, beginning of next 8 bytes for data sd
data_gdt		       	 ; Data descriptor 4Gb flat seg at 0000:0000h
   dw 0xffff	       	 ; Limit 4Gb
   dw 0x0000	       	 ; Base 0000:0000h
   db 0x00	      		 ; Descriptor format same as above
   db 0x92
   db 0xcf
   db 0x00
videosel equ $-gdt	       ; ie 18h,next gdt entry
   dw 3999	       ; Limit 80*25*2-1
   dw 0x8000	       ; Base 0xb8000
   db 0x0b
   db 0x92	       ; present,ring 0,data,expand-up,writable
   db 0x00	       ; byte granularity 16 bit
   db 0x00
gdt_end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

lose_cursor:
	mov bh , 0			; lose cursor
	mov dh, -1
	mov dl, -1
	mov ah, 0x02
	int 10h
;;;;;

go_pm:
	cli		    	; Clear or disable interrupts
	lgdt[gdtr]	    ; Load GDT	 
	mov eax,cr0	    ; The lsb of cr0 is the protected mode bit
	or al,0x01	    ; Set protected mode bit
	mov cr0,eax	    ; Mov modified word to the control register
	jmp codesel:start   
    
cursor_invisible:	
	 mov ah,01h ;Set for Function Code
	 mov cx,2607h ;Set For type of cursor (0007h = fullblock 2607h = invisible)
	 int 10h ;Call the interrupt 
	
bits 32	
start:
	mov eax,datasel   
	mov ds,eax	       		; Initialise ds & es to data segment
	mov es,eax
	mov eax,videosel	    ; Initialise gs to video memory
	mov gs, eax
	mov ebp, 0x90000
	mov esp, ebp
	jmp kernel_start
	
%include "kernel.asm"
%include "an.asm"
%include "piano.asm"

kernel_start:

;write your start menu code here



call clear_scr

mov	cx, 6
mov	bx, 820

lable_start:
white_c_one:
	mov bx, 820
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	add esp,8
	
white_d_one:
	mov bx , 828
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx , 8

white_e_one:
	mov bx, 836
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx , 8
	
	
white_f_one:
	mov bx, 844
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx , 8

white_g_one:
	mov bx, 852
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx , 8

	
white_a_one:
	mov bx, 860
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx , 8

	
white_b_one:
	mov bx, 868
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8
	
	
white_c_two:
	mov bx, 876
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8
	
white_d_two:
	mov bx , 884
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8

white_e_two:
	mov bx, 892
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8
	
white_f_two:
	mov bx, 900
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8
	
white_g_two:
	mov bx, 908
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8
white_a_two:
	mov bx, 916
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8	
	
white_b_two:
	mov bx, 924
	push	word 17
	push	word 4
	push	bx
	push	word 70h
	call	do_paint
	
	add esp,8
	; add bx, 8
	
	
blackKey1:

c_sharp_one:
	;mov	cx, 7
	mov	bx, 820
	;jmp blackKey
	
	;blackKey:
	add bx, 4
	;cmp	cx, 0
	;jle	lable_end
	;dec cx
	;cmp cx, 4
	;je scip
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	add bx, 8
	;jmp blackKey
	
	;scip:
	;dec cx
	;add bx, 6
	;jmp blackKey
	
d_sharp_one:
	mov bx, 828
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 16
	
f_sharp_one:
	mov bx, 844
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 8
	
g_sharp_one:
	mov bx, 852
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 8
	
a_sharp_one:
	mov bx, 860
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 16
	
c_sharp_two:
	mov bx, 876
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 8
	
d_sharp_two:
	mov bx, 884
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 16
	
f_sharp_two:
	mov bx, 900
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 8
	
g_sharp_two:
	mov bx, 908
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 8
	
a_sharp_two:
	mov bx, 916
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 07h
	call	do_paint
	add esp,8
	; add bx, 16
	
	

	
	
	
	

lable_end:
	mov bx, 2424
	mov byte [gs:bx] , 99
	
	add bx, 8
	mov byte [gs:bx] , 100
	
	add bx,8
	mov byte [gs:bx] , 101
	
	add bx, 8
	mov byte [gs:bx] , 102
	
	add bx, 8
	mov byte [gs:bx] , 103
	
	add bx, 8
	mov byte [gs:bx] , 97
	
	add bx, 8
	mov byte [gs:bx] , 98
	
	add bx, 8 
	mov byte [gs:bx] , 99
	
	add bx, 8
	mov byte [gs:bx] , 100
	
	add bx,8
	mov byte [gs:bx] , 101
	
	add bx, 8
	mov byte [gs:bx] , 102
	
	add bx, 8
	mov byte [gs:bx] , 103
	
	add bx, 8
	mov byte [gs:bx] , 97
	
	add bx, 8
	mov byte [gs:bx] , 98
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov bx, 1308
	mov byte [gs:bx] , 99
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 6
	mov byte [gs:bx] , 100
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 14
	mov byte [gs:bx] , 102
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 6
	mov byte [gs:bx] , 103
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 6
	mov byte [gs:bx] , 97
	add bx, 2
	mov byte [gs:bx] , 35

	add bx, 14
	mov byte [gs:bx] , 99
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 6
	mov byte [gs:bx] , 100
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 14
	mov byte [gs:bx] , 102
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 6
	mov byte [gs:bx] , 103
	add bx, 2
	mov byte [gs:bx] , 35
	
	add bx, 6
	mov byte [gs:bx] , 97
	add bx, 2
	mov byte [gs:bx] , 35
	

call read_char
	jmp $

call read_char