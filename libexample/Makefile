.PHONY: all clean

all: libexample.so example

clean:
	rm -fv *.o libexample.so example

test.o: test.cpp test.h
	g++ -g3 -I. -I../libexample++ -fPIC -c test.cpp

libexample.so: test.o
	g++ -fPIC -shared -g3 -I. -L. -L../libexample++ \
	test.o -lexample++ -o libexample.so

example: main.c libexample.so
	gcc -I. -L. -L../libexample++ -g3 main.c -lexample -lexample++ -o example

