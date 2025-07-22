.PHONY: help setup teardown serve

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	cargo install wasm-pack
	cargo install basic-http-server

teardown:
	# uninstall wasm-pack
	# uninstall basic-http-server

serve:
	basic-http-server .
