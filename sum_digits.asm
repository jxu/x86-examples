; Calling sum_digits on null-term string with C calling convention
; assemble: nasm sum_digits.asm -f elf64 -o sum_digits.o
; link:     gcc -no-pie sum_digits.o -o sum_digits
section .text
global main

sum_digits:
        xor     eax, eax            ; sum = 0
L:
        movsx   edx, BYTE [rdi]     ; c = *str
        inc     rdi                 ; ++str
        lea     eax, [rax-48+rdx]   ; sum += c - '0'
        cmp     BYTE [rdi], 0
        jne     L                   ; while (*str)
        ret
main:
        mov     edi, input
        jmp     sum_digits

section .data
input:
        db      "123", 0
