# Makefile that uses static pattern rules to avoid retyping compilation
# NASM also generates debug info and code listing

code64 		= true print_dec write
code64crt 	= printf
code32 		= cat cat_golf yes add225 write32 write32_golf varint sum_digits
codedos 	= doscat.com doschar.com


# assemble and link into 64-bit ELF
$(code64): %: %.asm 
	nasm -g -f elf64 $< -l $@.lst
	ld $@.o -o $@

# assemble and link with C runtime into 64-bit ELF
$(code64crt): %: %.asm
	nasm -g -f elf64 $< -l $@.lst
	gcc -no-pie $@.o -o $@ 

# assemble and link into 32-bit ELF
$(code32): %: %.asm
	nasm -g -f elf32 $< -l $@.lst
	ld -m elf_i386 $@.o -o $@

# assemble into 16-bit DOS raw binary
$(codedos): %.com: %.asm
	nasm -g -f bin $< -o $@ -l $@.lst

.PHONY: clean
clean:
	rm *.o
	find . -type f -executable -delete
