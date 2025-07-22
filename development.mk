.PHONY: help setup teardown serve serve-watch

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	cargo install wasm-pack
	cargo install basic-http-server
	cargo install cargo-watch

teardown:
	# uninstall wasm-pack
	# uninstall basic-http-server
	# uninstall cargo-watch

serve:
	basic-http-server .

serve-watch:
	@echo "Starting development server with hot reload..."
	@echo "The server will rebuild WASM when Rust source files change"
	cargo watch -i pkg/ -x 'build --target wasm32-unknown-unknown' -s 'make -C . -f wasm.mk build' -s 'basic-http-server .' --no-restart
