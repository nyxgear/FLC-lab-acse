SOURCES = scope-exp.parser.c \
          scope-exp.parser.h \
          scope-exp.lexer.c \
          scope-exp.c
EXEC_NAME = scope-exp

OBJECTS = $(patsubst %.c, %.o, $(filter-out %.h, $(SOURCES)))

CFLAGS += -D_GNU_SOURCE -DYYDEBUG -std=c99
LDFLAGS += -lm

all : $(EXEC_NAME)

$(EXEC_NAME) : $(OBJECTS)
	gcc $(LDFLAGS) -o $@ $^

%.o : %.c
	gcc $(CFLAGS) -c -o $@ $<

%.parser.h : %.parser.c

%.parser.c : %.y
	bison -d -o $@ $<

%.lexer.c : %.l
	flex -o $@ $<

clean:
	rm -rf *.{parser,lexer}.c *.o *.parser.h $(EXEC_NAME)
