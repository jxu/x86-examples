code64 = true printf
code32 = cat 
codedos = doscat.com doschar.com

all: $(code64) $(code32) $(codedos)

# assemble and link into 64-bit ELF
$(code64): %: %.asm 
	nasm -f elf64 $< 
	ld $@.o -o $@

# assemble and link into 32-bit ELF
$(code32): %: %.asm
	nasm -f elf32 $<
	ld -m elf_i386 $@.o -o $@

# assemble into 16-bit DOS raw binary
$(codedos): %.com: %.asm
	nasm -f bin $< -o $@

