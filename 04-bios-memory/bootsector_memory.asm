;---------------------------------------------------------------------
;
;	文件名：	bootsector_memory.asm
;	功  能：	理解内存加载时的分布以及[0x7c00]
; 	描  述：	
;
;---------------------------------------------------------------------

mov ah, 0x0e

mov al, the_secret
int 0x10

mov al, [the_secret]
int 0x10

mov bx, the_secret
add bx, 0x7c00 
mov al, [bx]
int 0x10

mov al, [0x7c76]
int 0x10

mov dx, the_secret
call print_hex

jmp $

%include "../04-bootsector-string/print_hex.asm"
%include "../04-bootsector-string/print_string.asm"
the_secret:
	db "X"

times 510-($-$$) db 0

dw 0xaa55

