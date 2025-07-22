.PHONY: help setup teardown build build-wasm clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	target

clean:
	cargo clean

target: src/lib.rs
	cargo build
