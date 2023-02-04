; Calling printf from C standard library to print decimal int
; assemble: nasm printf.asm -f elf64 -o printf.o
; link:     gcc -no-pie printf.o -o printf
section .text
    global main
    extern printf


main:
    push    rbp         ; 16 byte stack alignment
    
    mov     rdi, fmt    ; Arg 1
    mov     rsi, 1234   ; Arg 2
    xor     rax, rax    ; 0 vector registers used 
    
    call    printf
    
    pop     rbp
    mov     rax, 0      ; Return 0 
    ret
       
section .data
    fmt:    db "int: %d", 10, 0
