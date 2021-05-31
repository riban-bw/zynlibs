#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd $DIR
	mkdir -p build
	pushd build
		cmake -D CMAKE_CXX_FLAGS="-Wno-psabi" ..
		make
		success=$?
		cpack
	popd
popd
exit $success
