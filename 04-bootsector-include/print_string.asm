print_string:
	pusha
	mov ah, 0x0e
	print:
		mov al, [bx]
		int 0x10
		add bx, 1
		cmp al, 0
		jne print
	popa
	ret

