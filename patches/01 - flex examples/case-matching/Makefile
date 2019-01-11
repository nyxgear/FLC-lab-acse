all : case-matching

case-matching : case-matching.c
	gcc -o $@ $<

case-matching.c : case-matching.l
	flex -o $@ $<

clean :
	rm -f case-matching case-matching.c
