global _start

section .text

; print non-negative decimal integer in rdi
print_dec:              
    push    rbp         ; callee-saved 
    mov     rbp, rsp    ; save sp

    mov     rcx, 10     ; divisor base
    mov     rax, rdi    ; dividend from arg0
    
L1:
    xor     rdx, rdx    ; zero upper dividend
    div     rcx         ; unsigned divide rdx:rax by rcx
                        ; rax := quotient, rdx := remainder
    add     rdx, '0'    ; convert digit to ASCII
    push    rdx         ; push remainder digit
    cmp     rax, 0       
    jne     L1          ; do while (rax != 0)

L2:
    mov     rax, 1      ; call number for write
    mov     rdi, 1      ; write to stdout (fd=1)
    mov     rsi, rsp    ; use char on stack
    mov     rdx, 1      ; write 1 char
    syscall
    
    add     rsp, 8      ; "pop" stack 
    cmp     rbp, rsp    ; do while (stack still has digits)
    jne     L2 

    pop     rbp
    ret

_start:
    mov     rdi, 1234   ; int to print
    call    print_dec

    mov     eax, 60     ; exit call number
    xor     rdi, rdi    ; exit code 0
    syscall             

