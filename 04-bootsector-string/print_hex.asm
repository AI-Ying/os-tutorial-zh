/*打印十六进制数字*/
print_hex:
	pusha /*保存现场, 当前寄存器值入栈*/
    mv cx, 0
	
	cmp cx, 0

	mv ax, dx
	add ax, 0xf000


	popa /*恢复现场, 保存的寄存器值出战*/
	ret



HEX_OUT:
	db '0x0000', 0
