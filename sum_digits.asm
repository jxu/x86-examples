section .text
global _start

sum_digits:                         ; input: null-terminated string in esi
        xor     edx, edx            ; sum = 0
        xor     eax, eax            ; clear upper bits of eax
.L:                                 ; do
        lodsb                       ; al c = *str++
        lea     edx, [edx-48+eax]   ; sum += c - '0'
        cmp     BYTE [esi], 0       ; while (*str)
        jne     .L
        ret                         ; return in edx

_start:
        mov     esi, input
        jmp     sum_digits

section .data
input:
        db      "123",0
