section .text
mov eax,0x10
jmp $

section file2data         ;自定义数据段，未使用传统.data数据段

file2var db 3

section file2text         ;自定义代码段，未使用传统.text数据段

global print              ;导出print，给其他模块使用

print:

  mov rdx,[rsp+16]         ;字符串长度
  mov rcx,[rsp+8]         ;字符串

  ;系统调用
  mov rbx,1
  mov rax,4               ;sys_write
  int 0x80                ;系统调用
  ret