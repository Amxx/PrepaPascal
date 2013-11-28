#!/bin/bash

SOURCE_DIR="$PWD/src/tp03"
BINARY_DIR="$PWD/build"


mkdir -p build

for file in `find $SOURCE_DIR -name *.pas`
do
	fpc -FE$BINARY_DIR $file
done




