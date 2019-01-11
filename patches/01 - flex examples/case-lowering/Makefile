all : case-lowering

case-lowering : case-lowering.c
	gcc -o $@ $<

case-lowering.c : case-lowering.l
	flex -o $@ $<

clean :
	rm -f case-lowering case-lowering.c
