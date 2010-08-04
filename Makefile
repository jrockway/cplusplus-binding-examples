.PHONY: all clean

all:
	make -C libexample++ all
	make -C libexample all

clean:
	make -C libexample++ clean
	make -C libexample clean
