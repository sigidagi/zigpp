#!/bin/bash

DIR="$(ls -d ./build*)"

if [[ -n ${DIR} ]]; then
    echo "Cleaning all build directories."
    rm -rf ./build* 
    rm -rf ./bin
else 
    echo "Nothing to clean."
fi
