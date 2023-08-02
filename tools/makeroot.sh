#!/bin/bash
# this script ready the system for chroot
# Usage: ./makeroot.sh [program that you want to use]...
# ishay320 version 0.0.1

mkdir -p bin lib64 lib

for var in "$@"
do
	cp --parents /bin/$var .
	ldd /bin/$var | cut -d " " -f 3 | xargs -I {} cp -v --parents {} .
done

find . -name ld-linux* | xargs -I {} cp {} ./lib64/

# TODO: add print for help and version
# TODO: add check for env path
