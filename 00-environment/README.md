#环境搭建

所有文件的编写是在linux下完成的, window下面可以同样的工具进行编写, 或者选择虚拟机也可以. 虽然文章会给出windows下软件的解决方案, 但还是推荐windows用户安装linux虚拟机来学习

###实验软件
1. nasm 
2. gcc
3. make
4. qemu
5. gdb
###实验平台
linux OR windows
###软件安装
####nasm安装
#####linux安装nasm
1. 可以进入官网选择相应版本下载源码包编译
[http://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D]
2. ubuntu在终端运行`sudo apt install nasm`
#####window安装nasm
进入官网选择相应版本目录下的win版本的nasm
[http://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D]
####gcc, gdb, make的安装
#####linux安装gcc,gdb,make
linux下一般自带gcc, gdb, make
#####windows安装gcc,gdb,make
可从官网上下载对应的工具, 或者下载集成工具MinGW
####qemu安装
#####linux安装qemu
1. 可以进入官网选择相应版本下载源码包编译
[http://www.qemu.org/download/#linux]

2. ubuntu在终端运行`sudo apt install qemu`

#####windows安装qemu
进入官网下载相应的32位或者64位版本
[http://www.qemu.org/download/#windows]
