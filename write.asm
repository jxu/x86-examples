; x86-64 linux write syscall
global _start

section .text
_start:
    push    0x21        ; '!'
    mov     rax, 1      ; write call number 
    mov     rdi, 1      ; write to stdout (fd=1)
    mov     rsi, rsp    ; use char on stack
    mov     rdx, 1      ; write 1 char
    syscall  
    add     rsp, 8      ; restore sp 

    mov     eax, 60     ; exit call number
    xor     rdi, rdi    ; exit code 0
    syscall             ; syscall
