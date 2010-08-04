.PHONY: all clean run

all:
	make -C libexample++ all
	make -C libexample all
	cabal configure
	cabal build

clean:
	make -C libexample++ clean
	make -C libexample clean
	cabal clean
