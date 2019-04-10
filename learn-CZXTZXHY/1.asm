section .bss
resb 2*32

section file1data       ;自定义数据段，未使用传统.data

strHello db "Hello,World!",0Ah
STRLEN equ $ - strHello

section file1text       ;自定义代码段，未使用传统.text

extern print            ;声明此函数在别的文件中
                        ;告诉编译器编译此文件时找不到该符号也没有关系，在链接时会找到
global _start           ;连接器把_start当做程序入口

_start:
    push STRLEN         ;传入参数，字符串长度
    push strHello       ;传入参数，待打印的字符串
    call print          ;此函数定义在2.asm中
    
    ;返回系统
    mov rbx,0           ;返回值,0
    mov rax,1           ;系统调用1:sys_exit
    int 0x80            ;系统调用