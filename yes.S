.text
.globl main

main:
    push    $0x0A79     # "y\n"
    mov     $1, %ebx    # write to stdout (fd=1)
    mov     %esp, %ecx  # use chars on stack
    mov     $2, %edx    # write 2 chars

loop:
    mov     $4, %eax    # sys_write call number 
    int     $0x80
    jmp     loop
