section .data


NULL            equ 0
LF              equ 10
EXIT_SUCCESS    equ 0
STDOUT          equ 1


SYS_exit        equ 60
SYS_write       equ 1



text            db "Hello, world!", LF, NULL

section .text
global _start
_start:


    lea rbx, byte [text]                    
    mov rdx, 0                              
CountLoop:
    cmp byte [rbx], NULL                   
    je CountDone                           
    inc rdx                                 
    inc rbx                                 
    jmp CountLoop

CountDone:
    cmp rdx, 0                              
    je last



    mov rax, SYS_write
    mov rdi, STDOUT
    lea rsi, byte [text]
    syscall

last:
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall

 
