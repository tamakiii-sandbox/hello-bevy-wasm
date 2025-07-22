.PHONY: help setup teardown serve serve-watch

export PATH+=:.cargo/bin

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	.cargo

teardown:
	rm -rf .cargo

serve:
	basic-http-server .

serve-watch:
	@echo "Starting development server with hot reload..."
	@echo "The server will rebuild WASM when Rust source files change"
	cargo-watch -i pkg/ -x 'build --target wasm32-unknown-unknown' -s 'make -C . -f wasm.mk build' -s 'basic-http-server .' --no-restart

.cargo:
	cargo install --root $@ wasm-pack
	cargo install --root $@ basic-http-server
	cargo install --root $@ cargo-watch
