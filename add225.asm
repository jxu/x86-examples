; Add two integers, but make 2+2=5 
; assemble: nasm add225.asm -f elf32
; link:     ld -m elf_i386 -no-pie add225.o -o add225
section .text
global _start

add225:
        cmp     eax, 2  
        jne     add
        cmp     ebx, 2
        jne     add
        inc     eax

add:
        add     eax, ebx
        ret

_start:
        mov     eax, 2  ; custom calling convention 
        mov     ebx, 2
        
        call    add225

        mov     eax, 1  ; exit nicely
        mov     ebx, 0
        int     0x80

