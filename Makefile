PROGRAM_NAME = tinyvm
COMPILER = gcc
ASM_COMPILER = nasm
ASM_FLAGS = -f elf -g -F stabs
SRC = src/
OUT = build/

all: $(OUT)main.o
	$(COMPILER) -o $(PROGRAM_NAME) $(OUT)main.o

$(OUT)main.o: $(SRC)main.asm | $(OUT)
	$(ASM_COMPILER) $(ASM_FLAGS) -o $(OUT)main.o $(SRC)main.asm

clean:
	rm -f $(OUT)*.o $(PROGRAM_NAME)

build:
	mkdir $(OUT)
