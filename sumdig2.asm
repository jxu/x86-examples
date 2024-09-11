        section .text
        global  _start

sumdig2:                    ; input n in eax
        xor     ecx, ecx    ; i = 0
        push    10     
        pop     edi         ; load divisor 10
        
.pushes:
        cdq                 ; zero edx, assuming eax sign bit is 0
        div     edi         ; eax = n / 10, edx = n % 10 
        push    edx         ; push digit
        inc     ecx         ; ++i
        test    eax, eax    ; do while (n != 0) 
        jnz     .pushes 
                            ; eax sum = 0 
.pops:
        pop     edx         ; pop and discard digit
        dec     ecx         ; --i
        jz      .done       ; break if i == 0
        pop     edx         
        add     eax, edx    ; sum += popped digit
        loop    .pops       ; --i; loop if i != 0

.done:
        ret                 ; output in eax

_start: 
        mov     eax, 1234 
        call    sumdig2
        
        mov     ebx, eax    ; custom return value
        mov     eax, 1
        int     0x80
