; simple cat program
section .text
start:
        mov ah, 01h ; read char from stdin with echo
        int 21h     ; call DOS services
        jmp start
