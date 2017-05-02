print_hex:
	pusha
	mov ah, 0x0e
	int 0x10
	mov cx, 0
	printh:
		mov al, dx
		int 0x10
		add dx, 1
		add cx, 1
		cmp cx, 4
		jne printh
	popa
	ret

