[org 0x7c00]

	mov bx, HELLO_MSG
	call print_string

	mov bx, GOODBYE_MSG
	call print_string

	mov dx, 0xb4
	call print_hex

	jmp $

%include "print_string.asm"
%include "print_hex.asm"

HELLO_MSG:
	db 'Hello, world!', 0

GOODBYE_MSG:
	db 'Goodbye!', 0

times 510-($-$$) db 0
				 dw 0xaa55
