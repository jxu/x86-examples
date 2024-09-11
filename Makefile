# Makefile that uses static pattern rules to avoid retyping compilation

code64 		= true print_dec write
code64crt 	= printf
code32 		= cat cat_golf yes add225 write32 write32_golf varint sum_digits \
			  sumdig2
codedos 	= doscat doschar
all         = $(code64) $(code64crt) $(code32) $(codedos)

AS          = nasm
ASFLAGS     = -g
LINK        = ld
LDFLAGS     = 

# Target-specific variables
$(code64) $(code64crt): ASARCH = -f elf64
$(code32):              ASARCH = -f elf32
$(codedos):             ASARCH = -f bin

$(code32): LDARCH = -m elf_i386 

$(code64crt): LINK = gcc  # with C runtime
$(codedos):   LINK = true  # no linking

$(code64crt): LDFLAGS = -no-pie


# assemble and link (one rule to rule them all)
$(all): %: %.asm
	$(AS) $(ASFLAGS) $(ASARCH) $<
	$(LINK) $(LDFLAGS) $(LDARCH) $@.o -o $@
	
.PHONY: clean
clean:
	rm *.o
	find . -type f -executable -delete
