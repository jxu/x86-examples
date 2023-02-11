; simple cat program
; nasm doscat.asm -fbin -o doscat.com
section .text
start:
        mov ah, 01h ; read char from stdin with echo
        int 21h     ; call DOS services
        jmp start
