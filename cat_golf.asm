; x86 32-bit linux golfed cat program
global _start

section .text
_start:
        inc     edx         ; set edx = 1
        mov     ecx, esp    ; read/write to sp
loop:
        mov     al, 3       ; read call number 3    
                            ; ebx: read from stdin (fd=0)
                            ; edx: read 1 char
        int     0x80        ; syscall

        test    eax, eax    ; check if byte read
        jz      exit 

        mov     al, 4       ; write call number 
        inc     ebx         ; write to stdout (fd=1)
                            ; ecx: use char in buf
                            ; edx: write 1 char
        int     0x80        ; syscall

        dec     ebx         ; ebx = 0
        jmp     loop

exit:
                            ; segfault instead of exiting
