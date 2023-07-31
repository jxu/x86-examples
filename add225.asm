; Add two integers, but make 2+2=5 
; assemble: nasm add225.asm -f elf32 -o add225.o
; link:     gcc -m32 -no-pie add225.o -o add225
section .text
global main

add225:
        cmp     eax, 0x02 
        jne     add
        cmp     ebx, 2
        jne     add
        inc     eax

add:
        add     eax, ebx
        ret

main:
        mov     eax, 2
        mov     ebx, 2
        jmp     add225

