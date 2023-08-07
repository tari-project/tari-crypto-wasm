# Copyright 2019. The Tari Project
# SPDX-License-Identifier: BSD-3-Clause

ifeq ($(shell uname),Darwin)
    LDFLAGS := -Ltarget/release/
else
    LDFLAGS := -Ltarget/release/
endif

SRC = libtari
BIN = bin
PWD = $(shell pwd)

CC=cc

CFLAGS   =

clean:
	rm $(SRC)/tari_crypto.h
	rm $(BIN)/demo


wasm:
	wasm-pack build .

wasm-node:
	wasm-pack build --target nodejs -d tari_js .

wasm-test:
	wasm-pack test --node
