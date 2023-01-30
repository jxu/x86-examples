.text
.globl main

main:
    push    $0x21       # '!'
    mov     $4, %eax    # sys_write call number 
    mov     $1, %ebx    # write to stdout (fd=1)
    mov     %esp, %ecx  # use char on stack
    mov     $1, %edx    # write 1 char
    int     $0x80   
    add     $4, %esp    # restore sp 
