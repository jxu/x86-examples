; x86-64 linux syscalls test 
; (NASM defaults to intel syntax)
        section .text 
        global _start 
_start:      
        mov     rax,60  ; syscall for exit
        xor     rdi,rdi ; exit code 0
        syscall
