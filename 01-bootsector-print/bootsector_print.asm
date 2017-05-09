;--------------------------------------------------------------------
;
;    文件名：    bootsector_print.asm
;    功  能：    在屏幕上输出'Hello'
;    描  述：    1.计算机启动过程：
;                    加电后,计算机进入BIOS(Basic Input/Output System),
;                    然后BIOS选择启动方式(U盘,软盘,硬盘等),我们选择的
;                    是硬盘启动(也是qemu的默认启动方式).若选择硬盘启动
;                    则BIOS首先读取硬盘的0柱面0磁头1扇区,也即主引导记录
;                    MBR(Master Boot Record),又叫主引导扇区.
;                    读取的主引导扇区数据有 512 字节, BIOS 程序将它加载
;                    到逻辑地址 0x0000:0x7c00处,也就是物理地址0x07c00处
;                    然后判断它是否有效,主引导扇区必须满足最后两个字节
;                    为0xaa55才有效(注意：这里并没有设置代码加载到内存
;                    0x7c00处,关于代码加载到内存0x7c00,在04-bios-memory
;                    中会详细讲到)
;                2.BIOS中断调用：
;                    通过使用BIOS中断调用达到向屏幕输出字符的目的
;                    设置寄存器ah = 0x0e(通过tty模式向屏幕输出字符)
;                    设置BIOS中断调用为0x10H,每发生一次中断,BIOS就把
;                    寄存器(这里是al)中的值送到显存中显示出来
;                    [BIOS interrupt call]
;                    https://www.wikiwand.com/en/BIOS_interrupt_call
;
;    步  骤：    linux下在终端执行：
;                    nasm -f bin bootsector_print.asm
;                    qemu bootsector_print
;
;--------------------------------------------------------------------


mov ah, 0x0e             ; 设置tty模式

mov al, 'H'              ; 把字母H放到寄存器al中
int 0x10                 ; int为x86汇编中的中断调用指令,这里BIOS
                         ; 调用0x10H中断.把字母H放到显存处
mov al, 'e'              ; 把字母e放到寄存器al中,此时覆盖了字母H
int 0x10                 ; 以下同理不在赘述
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

jmp $                    ; $表示当前地址,jmp是跳转指令,这句话的意思
                         ; 是不停跳转到此处,也即无限循环

times 510 - ($-$$) db 0  ; $$表示汇编代码的起始地址,这里是0x0000
                         ; ($-$$)表示汇编代码段的大小,即占了多少字节
                         ; 510-($-$$)表示从汇编代码的结尾到第510个字节
                         ; 之间的大小. 因为每个扇区的大小为512个字节
                         ; 去掉最后两个字节,所以是510.
                         ; db(define byte) 表示定义一个字节的数值
                         ; 这句话的意思是从汇编代码的结尾到第510个字节
                         ; 之间的空间,全部以字节的方式填充0

dw 0xaa55                ; dw(define word) 表示定义一个字的数值,最后
                         ; 两个字节0xaa55表示启动扇区的标志
