; x86-32 linux write syscall
; nasm -felf write32.asm && ld -m elf_i386 write32.o -o write32
global _start

section .text
_start:
    push    0x21        ; '!'
    mov     eax, 4      ; write call number 
    mov     ebx, 1      ; write to stdout (fd=1)
    mov     ecx, esp    ; use char on stack
    mov     edx, 1      ; write 1 char
    int     0x80        ; syscall
    add     esp, 4      ; restore sp 

    mov     eax, 1      ; exit call number
    xor     ebx, ebx    ; exit code 0
    int     0x80        ; syscall
