global _start

section .text
_start:
    push    0x0A79      ; "y\n"
    mov     ebx, 1      ; write to stdout (fd=1)
    mov     ecx, esp    ; use chars on stack
    mov     edx, 2      ; write 2 chars

loop:
    mov     eax, 4    ; sys_write call number 
    int     0x80
    jmp     loop
