CC = gcc -m32
AR = ar

INCLUDE  = -I./
CFLAGS   = -Wall -g -O3 -Wno-unused-result -Wno-unused-but-set-variable -Wno-unused-variable -Wno-implicit-function-declaration
LDFLAGS  = -lm -lrt

APP		= FFT
SRC   	= $(wildcard *.c)
OBJ   	= $(addsuffix .o, $(basename $(SRC)))
ASM   	= $(addsuffix .s, $(basename $(SRC)))
BIN   	= $(APP)

BW       = 12
SIZE     = 2
# Generate multiple FFT
point = 64
SIZE_MUL = $(point)

all: 	
	clear
	make clean && make comp && make run 

option:
	clear
	make clean && make comp2 && make run_accel

test: 
	clear
	make clean && make comp
	./FFT 5 2 $(BW)

run:
	#./FFT 100 2 	$(BW)
	./FFT 100 4   	$(BW)
	./FFT 100 8   	$(BW)
	./FFT 100 16   	$(BW)
	./FFT 100 32  	$(BW)
	./FFT 100 64  	$(BW)
	./FFT 100 128 	$(BW)
	./FFT 100 256 	$(BW)
	./FFT 100 512 	$(BW)

run_accel:
	./fft2 100 $(SIZE_MUL) $(BW)
	
comp:
	gcc fft.c -o FFT -lm
	@./FFT
comp2:
	gcc fft2.c -o fft2 -lm
	@./fft2

%.o: %.c
	@$(CC) -m32 -c $(CFLAGS) $(INCLUDE) $<

clean:
	rm -rf *.txt *.log *.o *.s *.dis *.out *.mat *mmap exit.addr $(APP) fft2

define LINE_SEP
@echo "========================================================================"
endef
