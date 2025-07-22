.PHONY: help build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	pkg

clean:
	rm -rf pkg

pkg: src/lib.rs
	wasm-pack build --target web --out-dir pkg
