.PHONY: help setup teardown build build-wasm serve clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	cargo install wasm-pack
	cargo install basic-http-server

teardown:
	# uninstall wasm-pack
	# uninstall basic-http-server

build:
	cargo build

build-wasm:
	wasm-pack build --target web --out-dir pkg

serve: build-wasm
	basic-http-server .

clean:
	cargo clean
	rm -rf pkg

