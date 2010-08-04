.PHONY: all clean haskell perl

all:
	$(MAKE) -C libexample++ all
	$(MAKE) -C libexample all
	$(MAKE) haskell
	$(MAKE) perl

clean: example-perl/Makefile
	$(MAKE) -C libexample++ clean
	$(MAKE) -C libexample clean
	cabal clean
	$(MAKE) -C example-perl clean

dist/setup-config: example.cabal
	cabal configure

haskell: dist/setup-config
	cabal build

example-perl/Makefile: example-perl/Makefile.PL
	cd example-perl; perl Makefile.PL

perl: example-perl/Makefile
	$(MAKE) -C example-perl all
