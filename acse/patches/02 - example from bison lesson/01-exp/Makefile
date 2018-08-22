SOURCES = exp.parser.c exp.lexer.c exp.parser.h
EXEC_NAME = exp

OBJECTS = $(filter-out %.h, $(SOURCES))

all : $(EXEC_NAME)

$(EXEC_NAME) : $(OBJECTS)
	gcc -o $@ $^

%.parser.h : %.parser.c

%.parser.c : %.y
	bison -d -o $@ $<

%.lexer.c : %.l
	flex -o $@ $<

clean:
	rm -rf *.c *.o *.h $(EXEC_NAME)
