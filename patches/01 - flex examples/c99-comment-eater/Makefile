all : c99-comment-eater

c99-comment-eater : c99-comment-eater.c
	gcc -o $@ $<

c99-comment-eater.c : c99-comment-eater.l
	flex -o $@ $<

clean :
	rm -f c99-comment-eater c99-comment-eater.c
