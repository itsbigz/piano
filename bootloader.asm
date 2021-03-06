[bits 16]
[org 0x7c00]

Reset:
	mov		ah, 0		; reset floppy disk function
	mov		dl, 0		; drive 0 is floppy drive
	int		0x13		; call BIOS
	jc		Reset		; If Carry Flag (CF) is set, 
						; there was an error. Try resetting again

boot:	
	mov ah, 0x02		; BIOS read sector function
	mov al, 0x08		; read three sector
	mov ch,	0x00		; Track to read
	mov cl,	0x02		; Sector to read
	mov dh,	0x00		; Head to read
	mov dl,	0x00		; Drive to read
	
	mov bx, 0x0000
	mov es, bx
	mov bx, 0x7e00
	
jmp_kernel:
	int 13h		
	jc jmp_kernel
	jmp 0000h:7e00h

times 510 - ($-$$) db 0
dw 0xaa55
