;------------------------------------------------------------------
;
;	文件名：	print_string.asm
; 	功  能：	输出字符串, 输出回车换行
;	描  述：	1. BIOS中断调用：
;				设置ah = 0x0e,通过tty模式向屏幕写字符,使用int指令
;				调用BISO的显示中断0x10H, 每发生一次中断,BIOS就把寄
;				存器al中的值送到显存中显示出来.
;				[BIOS interrupt call]
;				https://www.wikiwand.com/en/BIOS_interrupt_call
;				2. 回车换行:
;				在windows下是'\n\r', 在类unix下是:'\r'
; 				因为生成的虚拟文件时window下面的bin格式,
; 				所以换行时的字符为, '\n\r'
;------------------------------------------------------------------

; 输出一个字符串
print_string:
	pusha				; 保存现场, 当前寄存器值入栈
	mov ah, 0x0e 		; 设置为tty显示模式
	print:		
		mov al, [bx]	; 基址寄存器寻址, 循环每一位放到al
		int 0x10		; 调用0x10中断
		add bx, 1		; 基址循环加一,类似c语言的指针加一操作
		cmp al, 0       
		jne print		; 如果al为0(也即读取到字符串的尾部标志0)
	popa				; 恢复现场, 保存的寄存器值出栈	
	ret					; 返回被调用处


; 输出一个回车换行
print_rn:
	pusha
	mov ah, 0x0e
	mov al, 0x0a 		; 换行'\n'
	int 0x10			
	mov al, 0x0d  		; 回车'\r'
	int 0x10
	popa
	ret


