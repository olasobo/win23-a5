objfiles = main.o addition.o subtraction.o multiplication.o division.o

calculator: $(objfiles)
	gcc -o calculator $(objfiles)

$(objfiles): %.o:%.c
	gcc -c -o $@ $<

clean:
	rm *.o calculator

.PHONY: clean

