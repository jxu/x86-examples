.data
intfmt:         .string "int: %d\n"
testint:        .int    20

.text
.globl main

main:
    push    %ebp        # 16 byte stack alignment
    push    testint     # Arg 2
    push    $intfmt     # Arg 1, fmt string 
    call    printf
    add     $8, %esp
    pop     %ebp
    mov     $0, %eax    # Return 0 
    ret
        
