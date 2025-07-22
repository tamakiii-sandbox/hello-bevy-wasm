.PHONY: help build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	wasm/pkg

clean:
	rm -rf wasm/pkg

wasm/pkg: src
	wasm-pack build --target web --out-dir $@
