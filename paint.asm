section .data
	startPointPaint 		dw 		0
	widthtPaint			dw 		0
	hightPaint			dw		0
	style			db		0


section .code

do_paint:
	
	
	mov		ebp, esp
	
	add		ebp, 4
	mov 	ax, word [ss:bp]
	mov		byte [style],al
	add		ebp, 2
	mov 	ax, word [ss:bp]
	mov		word [startPointPaint],ax
	add		ebp, 2
	mov		ax, word [ss:bp]
	mov		word [hightPaint], ax
	add		ebp, 2
	mov		ax, word [ss:bp]
	mov		word [widthtPaint], ax
	
	
	;;;;;;;;;;
	pushad
	;;;;;;;;;;
	
	dec		word [widthtPaint]
	dec		word [hightPaint]

	
	mov 	bx,[startPointPaint]
	add 	bx,163
	mov 	cx,[widthtPaint]
	mov 	dx,[hightPaint]

L0:
	cmp 	cx, 0
	je 		donepaint
	mov 	dx,[hightPaint]
L1:
	cmp		dx,0
	je 		L2
	;mov byte [gs:bx] , 20h
	;Inc	bx
	mov 	al,byte [style]
	mov 	byte[gs:bx], al
	add 	bx,2
	dec 	dx
	jmp 	L1
L2:
	add 	bx,160
	dec 	cx
	sub 	bx,[hightPaint]
	sub 	bx,[hightPaint]
	jmp		L0
	
	
donepaint:
	;;;;;;;;;;
	popad
	;;;;;;;;;;
	ret
	
	
	
	
	
	
	
	