;%include "paint.asm"
keyboard_port      EQU   60H   ; port to read from keyboard

table	     db    01BH,'1234567890-=',08H,09H
			       db    'qwertyuiop[]',0DH,0
			       db    'asdfghjkl;',27H,60H,0,'\'
			       db    'zxcvbnm,./',0,0,0,' ',0
				   db    0,0,0,0,0,0,0,0,0,0
			       db    0,0,0,11h,0,0,14h,0,12h,0
			       db    0,13h,0,0,0,0,0,0,0,0  
hbd_flag    dw 0
hbd_note    db 0
fur_flag	dw 0
fur_note	db 0
read_char:
		in      al,keyboard_port ; read keyboard status & scan code
		test    al,80h ; checks if the 7th bit is 0
		jnz     read_char ; if not, loop back

		and     al,7fh ; isolate the scan code
		mov     si,table
		dec     al ; index is one less than scan code
		cbw
		add	  	si, ax
		mov	  	al, byte [si]
which_note:
		;C 	130.81 	9121
		cmp     al,byte 'q'
		je      red_c_one
		;C# 	138.59 	8609
		cmp     al,byte 'w'
		je      red_c_sharp_one
		;D 	146.83 	8126
		cmp     al,byte 'e'
		je      red_d_one
		;D# 	155.56 	7670
		cmp     al,byte 'r'
		je      red_d_sharp_one
		;E 	164.81 	7239
		cmp     al,byte 't'
		je      red_e_one
		;F 	174.61 	6833
		cmp     al,byte 'y'
		je      red_f_one	
		;F# 	185.00 	6449
		cmp     al,byte 'u'
		je      red_f_sharp_one
		;G 	196.00 	6087
		cmp     al,byte 'i'
		je      red_g_one
		;G# 	207.65 	5746
		cmp     al,byte 'o'
		je      red_g_sharp_one
		;A 	220.00 	5423
		cmp     al,byte 'p'
		je      red_a_one
		;A# 	233.08 	5119
		cmp     al,byte '['
		je      red_a_sharp_one
		;B 	246.94 	4831
		cmp     al,byte ']'
		je      red_b_one
		;Middle C 	261.63 	4560
		cmp     al,byte 'a'
		je      red_c_two
		;C# 	277.18 	4304
		cmp     al,byte 's'
		je      red_c_sharp_two
		;D 	293.66 	4063
		cmp     al,byte 'd'
		je      red_d_two
		;D# 	311.13 	3834
		cmp     al,byte 'f'
		je      red_d_sharp_two
		;E 	329.63 	3619
		cmp     al,byte 'g'
		je      red_e_two
		;F 	349.23 	3416
		cmp     al,byte 'h'
		je      red_f_two
		;F# 	369.99 	3224
		cmp     al,byte 'j'
		je      red_f_sharp_two
		;G 	391.00 	3043
		cmp     al,byte 'k'
		je      red_g_two
		;G# 	415.30 	2873
		cmp     al,byte 'l'
		je      red_g_sharp_two
		;A 	440.00 	2711
		cmp     al,byte ';'
		je      red_a_two
		;A# 	466.16 	2559
		cmp     al,byte 'z'
		je      red_a_sharp_two
		;B 	493.88 	2415
		cmp     al,byte 'x'
		je      red_b_two
		;hbd song
		; cmp al, '1' 
		; mov dx, 25
		; mov [hbd_note], dx
		; mov [hbd_flag], word 1
		; je hbd25
		;;;fur elise
		cmp al, '2' 
		mov dx, 33
		mov [fur_note], dx
		mov [fur_flag], word 1
		je fur33
		jmp read_char
; hbd25:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one		
; hbd24:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one
; hbd23:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_b_one
; hbd22:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one
; hbd21:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_d_two
; hbd20:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_c_sharp_two
; hbd19:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one
; hbd18:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one
; hbd17:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_b_one
; hbd16:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one
; hbd15:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_e_two
; hbd14:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_d_two
; hbd13:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one
; hbd12:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_one
; hbd11:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_a_two
; hbd10:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_f_sharp_two
; hbd9:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_d_two
; hbd8:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_c_sharp_two
; hbd7:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_b_one
; hbd6:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_g_two
; hbd5:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_g_two
; hbd4:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_f_sharp_two
; hbd3:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_d_two
; hbd2:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_e_two
; hbd1:	mov dx, [hbd_note]
		; dec dx
		; mov [hbd_note], dx
		; jmp red_d_two
fur33:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_two
fur32:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_d_sharp_two
fur31:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_two
fur30:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_d_sharp_two
fur29:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_two
fur28:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_b_one
fur27:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_d_two
fur26:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_c_two
fur25:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_a_one
fur24:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_c_one
fur23:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_one
fur22:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_a_one	
fur21:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_b_one
fur20:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_two
fur19:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_a_one
fur18:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_b_one
fur17:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_c_two
fur16:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_two
fur15:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_d_sharp_two
fur14:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_two
fur13:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_d_sharp_two
fur12:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_two
fur11:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_b_one
fur10:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_d_two
fur9:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_c_two
fur8:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_a_one
fur7:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_c_one
fur6:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_one
fur5:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_a_one	
fur4:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_b_one
fur3:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_e_one
fur2:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_c_two
fur1:	mov dx, [fur_note]
		dec dx
		mov [fur_note], dx
		jmp red_b_one		
piano:
        push    eax
        mov     al,byte 182         ; Prepare the speaker for the
        out     43h, byte al         ;  note.
        mov     ax, word bx        ; Frequency number (in decimal)
        out     42h, byte al         ; Output low byte.
        mov     al, byte ah          ; Output high byte.
        out     42h, byte al
        in      al, 60h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 10000011b   ; Set bits 1 and 0.
        out     61h,byte  al         ; Send new value.
        mov     bx, word 500         ; Pause for duration of note.
.piano_pause1:
        mov     cx, word 65535
.piano_pause2:
        dec     word cx
        jne     .piano_pause2
        dec     word bx
        jne     .piano_pause2
        in      al, byte 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, byte al         ; Send new value.
        pop     eax
		
		; mov dx, [hbd_flag]
		; cmp dx, 1
		; je hbd_song
		mov dx, [fur_flag]
		cmp dx, 1
		je fur_song
		jmp kernel_start
fur_song:
		mov dx, [fur_note]
		cmp dx, 1
		je fur1
		cmp dx, 2
		je fur2
		cmp dx, 3
		je fur3
		cmp dx, 4
		je fur4
		cmp dx, 5
		je fur5
		cmp dx, 6
		je fur6
		cmp dx, 7
		je fur7
		cmp dx, 8
		je fur8
		cmp dx, 9
		je fur9
		cmp dx, 10
		je fur10
		cmp dx, 11
		je fur11
		cmp dx, 12
		je fur12
		cmp dx, 13
		je fur13
		cmp dx, 14
		je fur14
		cmp dx, 15
		je fur15
		cmp dx, 16
		je fur16
		cmp dx, 17
		je fur17
		cmp dx, 18
		je fur18
		cmp dx, 19
		je fur19
		cmp dx, 20
		je fur20
		cmp dx, 21
		je fur21
		cmp dx, 22
		je fur22
		cmp dx, 23
		je fur23
		cmp dx, 24
		je fur24
		cmp dx, 25
		je fur25
		cmp dx, 26
		je fur26
		cmp dx, 27
		je fur27
		cmp dx, 28
		je fur28
		cmp dx, 29
		je fur29
		cmp dx, 30
		je fur30
		cmp dx, 31
		je fur31
		cmp dx, 32
		je fur32
		mov [fur_flag], word 0
		jmp kernel_start
; hbd_song:
		; mov dx, [hbd_note]
		; cmp dx, 1
		; je hbd1
		; cmp dx, 2
		; je hbd2
		; cmp dx, 3
		; je hbd3
		; cmp dx, 4
		; je hbd4
		; cmp dx, 5
		; je hbd5
		; cmp dx, 6
		; je hbd6
		; cmp dx, 7
		; je hbd7
		; cmp dx, 8
		; je hbd8
		; cmp dx, 9
		; je hbd9
		; cmp dx, 10
		; je hbd10
		; cmp dx, 11
		; je hbd11
		; cmp dx, 12
		; je hbd12
		; cmp dx, 13
		; je hbd13
		; cmp dx, 14
		; je hbd14
		; cmp dx, 15
		; je hbd15
		; cmp dx, 16
		; je hbd16
		; cmp dx, 17
		; je hbd17
		; cmp dx, 18
		; je hbd18
		; cmp dx, 19
		; je hbd19
		; cmp dx, 20
		; je hbd20
		; cmp dx, 21
		; je hbd21
		; cmp dx, 22
		; je hbd22
		; cmp dx, 23
		; je hbd23
		; cmp dx, 24
		; je hbd24
		; mov [hbd_flag], word 0
		; jmp kernel_start	
pushed_buttons:
red_c_one:
	mov bx, 820
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 9121
	jmp piano

red_c_sharp_one:
	mov	bx, 820
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 8609
	jmp piano

red_d_one:
	mov bx , 828
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 8126
	jmp piano
	
	
red_d_sharp_one:
	mov bx, 828
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 7670
	jmp piano

red_e_one:
	mov bx, 836
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint	
	add esp,8
	mov bx, 7239
	jmp piano
	
red_f_one:
	mov bx, 844
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 6833
	jmp piano
	
red_f_sharp_one:
	mov bx, 844
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 6449
	jmp piano

red_g_one:
	mov bx, 852
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 6087
	jmp piano
	
red_g_sharp_one:
	mov bx, 852
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 5746
	jmp piano

red_a_one:
	mov bx, 860
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 5423
	jmp piano
	
red_a_sharp_one:
	mov bx, 860
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 5119
	jmp piano
	
red_b_one:
	mov bx, 868
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 4831
	jmp piano
	
red_c_two:
	mov bx, 876
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 4560
	jmp piano
	
red_c_sharp_two:
	mov bx, 876
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 4304
	jmp piano
	
red_d_two:
	mov bx , 884
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 4063
	jmp piano
	
red_d_sharp_two:
	mov bx, 884
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 3834
	jmp piano

red_e_two:
	mov bx, 892
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 3619
	jmp piano
	
red_f_two:
	mov bx, 900
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 3416
	jmp piano
	
red_f_sharp_two:
	mov bx, 900
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 3224
	jmp piano
	
red_g_two:
	mov bx, 908
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 3043
	jmp piano
	
red_g_sharp_two:
	mov bx, 908
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 2873
	jmp piano
	
red_a_two:
	mov bx, 916
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 2711
	jmp piano
	
red_a_sharp_two:
	mov bx, 916
	add bx, 4
	push	word 8
	push	word 4
	push    bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 2559
	jmp piano
	
red_b_two:
	mov bx, 924
	push	word 17
	push	word 4
	push	bx
	push	word 0e7h
	call	do_paint
	add esp,8
	mov bx, 2415
	jmp piano