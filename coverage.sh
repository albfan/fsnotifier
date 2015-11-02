#!/bin/sh
export CC_FLAGS="-O3 -Wall --coverage -std=c99 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=500"
./compile.sh
