.PHONY: all clean

all: libexample++.so example

clean:
	rm -vf *.o libexample++.so example
test.o: test.cpp test.hpp
	g++ -I. -c -fPIC -g3 test.cpp

libexample++.so: test.o
	g++ -I. -L. -fPIC -shared -g3 test.o -o libexample++.so

example: main.cpp libexample++.so
	g++ -I. -L. main.cpp -lexample++ -o example
