; 64-bit x86 on linux test 
; (NASM defaults to intel syntax)
; assemble:     nasm -f elf64 -o test.o test.asm
; link:         gcc -o test test.o    
        section .text 
        global main 
main:      
        mov     rax,1
        ret
