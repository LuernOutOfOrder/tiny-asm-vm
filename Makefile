PROGRAM_NAME = tinyvm
LINK= ld
# Simple assignment to get sdk path
SDK_PATH := $(shell xcrun --sdk macosx --show-sdk-path)
LINK_FLAGS= -lSystem -syslibroot $(SDK_PATH) -e _start -arch arm64 
ASM_COMPILER = as
ASM_FLAGS = -arch arm64
SRC = src/
OUT = build/

all: $(OUT)main.o
	$(LINK) -o $(OUT)$(PROGRAM_NAME) $(OUT)main.o $(LINK_FLAGS)

$(OUT)main.o: $(SRC)main.s | $(OUT)
	$(ASM_COMPILER) -o $(OUT)main.o $(SRC)main.s $(ASM_FLAGS)

clean:
	rm -f $(OUT)*.o $(PROGRAM_NAME)

build:
	mkdir $(OUT)
