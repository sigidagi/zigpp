#!/bin/bash

# TODO provide interactive cli

ARCH=$1
MACHINE=$2
CLIB=$3

if [ $# -eq 1 ] || [ $# -eq 2 ] ; then
    echo "Not enough arguments: provide triple, run 'zig targets' for available triples"
    exit 
fi

if [ $# -eq 0 ]; then
    echo "No arguments supplied. Using default triple: 'x86_64-linux-gnu'"
    ARCH="x86_64"
    MACHINE="linux"
    CLIB="gnu"
fi

echo "---------------------------"
echo "Using triple: '${ARCH}-${MACHINE}-${CLIB}'"
echo "---------------------------"

cmake -B build-${ARCH} -DCPU_ARCH:STRING=${ARCH} -DMACHINE:STRING=${MACHINE} -DCLIB:STRING=${CLIB} -G Ninja -DCMAKE_TOOLCHAIN_FILE=cmake/zig-toolchain.cmake
cmake --build build-${ARCH}