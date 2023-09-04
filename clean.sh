#!/bin/bash

DIR="$(ls -d ./build-*)"

if [[ -n ${DIR} ]]; then
    echo "Cleaning all build directories."
    rm -rf ./build-* 
else 
    echo "Nothing to clean."
fi
