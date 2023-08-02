; Calling printf through main, linking C runtime 
; https://stackoverflow.com/questions/3577922/how-to-link-a-gas-assembly
; assemble: nasm printf.asm -f elf64
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
    xor     rax, rax    ; Return 0 
    ret
       
section .data
fmt:    
    db      `%d\n\0`    ; NASM string escapes
