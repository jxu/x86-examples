; write32 but only 14 bytes
global _start

section .text
_start:
    push    '!'         
    push    4
    pop     eax         ; write call number 4
    inc     ebx         ; write to stdout (fd=1)
    mov     ecx, esp    ; use char on stack
    inc     edx         ; write 1 char
    int     0x80        ; syscall
    
    pop     ecx         ; restore sp                    
                        ; reuse eax = 1
                        ; exit code whatever in ebx
    int     0x80        ; syscall
