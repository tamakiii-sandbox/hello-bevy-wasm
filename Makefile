.PHONY: help build build-wasm serve clean install-deps

help:
	@cat $(firstword $(MAKEFILE_LIST))

install-deps:
	cargo install wasm-pack
	cargo install basic-http-server

build:
	cargo build

build-wasm:
	wasm-pack build --target web --out-dir pkg

serve: build-wasm
	basic-http-server .

clean:
	cargo clean
	rm -rf pkg

