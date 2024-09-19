# Compiler and linker
NASM = nasm
LD = ld

# Output file extension
OUTPUT_EXT = 

# Find all .asm files
ASM_FILES := $(shell find . -name '*.asm')
# Create output file names by removing .asm extension
OUTPUT_FILES := $(patsubst %.asm,%,$(ASM_FILES))

# NASM and LD flags
NASM_FLAGS = -f elf64
LD_FLAGS = -m elf_i386

# Default target
all: $(OUTPUT_FILES)

# Rule to build each output file
%: %.asm
	$(NASM) $(NASM_FLAGS) $< -o $<.o
	$(LD) $(LD_FLAGS) -o $@ $<.o
	rm $<.o  # Clean up the intermediate object file

# Clean up generated files
clean:
	rm -f $(OUTPUT_FILES)

.PHONY: all clean
