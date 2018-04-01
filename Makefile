all: build

build:
	cabal new-build

repl:
	cabal new-repl --ghc-options='-fobject-code -O0'

clean:
	rm -rf dist dist-newstyle

.PHONY: all build clean
