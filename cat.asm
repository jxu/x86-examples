; x86 32-bit linux cat program (read/write syscalls)
global _start

section .text
_start:
        mov     eax, 3      ; read call number     
        xor     ebx, ebx    ; read from stdin (fd=0)
        mov     ecx, buf    ; read to buf
        mov     edx, 1      ; read 1 char
        int     0x80        ; syscall

        test    eax, eax    ; check if byte read
        jz      exit 

        mov     eax, 4      ; write call number 
        mov     ebx, 1      ; write to stdout (fd=1)
        mov     ecx, buf    ; use char in buf
        mov     edx, 1      ; write 1 char
        int     0x80        ; syscall

        jmp     _start

exit:
        mov     eax, 1      ; exit call number
        xor     ebx, ebx    ; exit code 0
        int     0x80        ; syscall

section .bss
buf:    resb    1
