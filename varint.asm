; x86 32-bit (golfed) varint program

global _start

section .text

parse:                          ; esi input pointer
        xor     ebx, ebx        ; ebx result = 0
        xor     ecx, ecx        ; ecx shift = 0

.loop:  
        lodsb                   ; al byte = [esi++]
        mov     dl, al          ; save byte for test later
        and     eax, 0x7F       ; t &= 0x7F, clear upper bits
        sal     eax, cl         ; t <<= shift
        or      ebx, eax        ; result |= t
        add     cl, 7           ; shift += 7
        test    dl, dl    
        js      .loop           ; loop if byte's sign bit is set
        ret                     ; return in ebx
            
_start:
        mov     eax, 0x12345678
        mov     esi, var1    
        call    parse
        mov     esi, var2
        call    parse
        mov     esi, var3
        call    parse
        mov     esi, var4
        call    parse
        mov     esi, var5
        call    parse
        mov     esi, var6
        call    parse
        
exit:
        mov     eax, 1      ; exit call number
        xor     ebx, ebx    ; exit code 0
        int     0x80        ; syscall

section .data

var1:   db      0x00                            ; 0
var2:   db      0x81, 0x00                      ; 1
var3:   db      0x7f, 0x00, 0x34                ; 127
var4:   db      0xdd, 0xc7, 0x01                ; 25565
var5:   db      0xff, 0xff, 0x7f                ; 2097151
var6:   db      0xff, 0xff, 0xff, 0xff, 0x07    ; 2147483647
var7:   db      0xff, 0xff, 0xff, 0xff, 0x0f    ; -1
var8:   db      0x80, 0x80, 0x80, 0x80, 0x08    ; -2147483648
var9:   db      0xff, 0xfe, 0xf3, 0xff, 0x02    ; 1113983
