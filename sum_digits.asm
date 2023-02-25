; Calling printf from C standard library to print decimal int
; assemble: nasm sum_digits.asm -f elf64 -o sum_digits.o
; link:     gcc -no-pie sum_digits.o -o sum_digits
section .text
global main

sum_digits:
        xor     eax, eax            ; sum = 0
L:
        movsx   edx, BYTE [rdi]     ; c = str[i]
        inc     rdi                 ; ++i
        lea     eax, [rax-48+rdx]   ; sum += c - '0'
        cmp     BYTE [rdi], 0
        jne     L                   ; while (str[i])
        ret
main:
        mov     edi, .LC0
        jmp     sum_digits

section .data
.LC0:
        db      "123", 0
