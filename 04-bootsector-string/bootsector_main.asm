;------------------------------------------------------------------
;
;	文件名：	bootsector_main.asm
;	功  能：	输出字符串主函数
;
;------------------------------------------------------------------

[org 0x7c00]

	mov bx, HELLO_MSG			; 把HELLO_MSG的内容放到寄存器bx中
	call print_string			; 调用print_string函数

	call print_rn				; 输出换行符

	mov bx, GOODBYE_MSG         ; 把字符串GOODBYE_MSG放到寄存器bx中
	call print_string			; 调用pring_string函数
	
	call print_rn				; 输出换行符
	
	mov dx, 0x2E4B				; 把十六进制数0x2E4B放到dx
	call print_hex				; 调用print_hex函数

	jmp $						; 无限循环

%include "print_string.asm"		; 包含print_string.asm文件
								; 类似于c语言中include
%include "print_hex.asm"

HELLO_MSG:						; 定义HELLO_MSG, 注意HELLO_MSG的内容
	db 'Hello, World!', 0		; 为：[Hello, World!0]

GOODBYE_MSG:					; 同理GOODBYE_MSG的内容为[Goodbye!0]
	db 'Goodbye!', 0			

times 510-($-$$) db 0			; 剩余字节填充0
				 dw 0xaa55		; 启动扇区标志
