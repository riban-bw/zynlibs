#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

CLEAN=0
BUILD=1
for argval in "$@"
do
  if [ " $argval " == " clean " ]
  then
    CLEAN=1
    BUILD=0
  fi
  if [ " $argval " == " build " ]
  then
    BUILD=1
  fi
done

for lib in zynsmf zynseq
do
  if [ $CLEAN -eq 1 ]
  then
    rm -r $DIR/$lib/build
  fi
  if [ $BUILD -eq 1 ]
  then
    $DIR/$lib/build.sh
  fi
done

exit $success
