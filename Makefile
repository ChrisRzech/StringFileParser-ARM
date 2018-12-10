NAME = start
ASFLAGS = -g
SRC = $(wildcard *.s) $(wildcard string/*.s) $(wildcard string/helpers/*.s) $(wildcard list/*.s) $(wildcard list/node/*.s) $(wildcard list/helpers/*.s) $(wildcard files/*.s)
OBJ = $(SRC:.s=.o)

all: $(OBJ)
	ld $(OBJ) /usr/lib/arm-linux-gnueabihf/libc.so -dynamic-linker /lib/ld-linux-armhf.so.3 -o $(NAME)

%.o: $.s
	as $(ASFLAGS) -o $@ $<

clean:
	rm $(OBJ) $(NAME)
