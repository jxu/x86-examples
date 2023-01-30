; 16-bit DOS COM example
; nasm write16.asm -fbin -o write16.com
section .text
start:
        mov dl, 21h ; char '!'
        mov ah, 02h ; char output service
        int 21h     ; call DOS services

        int 20h     ; terminate program
