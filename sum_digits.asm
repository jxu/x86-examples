; Calling sum_digits on null-term string with C calling convention
section .text
global _start

sum_digits:
        xor     eax, eax            ; sum = 0
L:
        movsx   edx, BYTE [rdi]     ; c = *str
        inc     rdi                 ; ++str
        lea     eax, [rax-48+rdx]   ; sum += c - '0'
        cmp     BYTE [rdi], 0
        jne     L                   ; while (*str)
        ret
_start:
        mov     edi, input
        jmp     sum_digits

section .data
input:
        db      "123", 0
