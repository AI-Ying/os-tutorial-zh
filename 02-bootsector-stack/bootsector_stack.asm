;--------------------------------------------------------------
;
;    文件名：    bootsector_stack.asm
;    功  能：    通过堆栈的方式输出字符ABC
;    描  述：    堆栈是一种数据结构,
;
;
;
;
;
mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

push 'C'
push 'B'
push 'A'

pop bx
mov al, bl
int 0x10

pop bx 
mov al, bl
int 0x10

mov al, [0x7ffe]

int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55
