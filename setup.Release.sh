#!/bin/bash
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
BUILD_DIR=$DIR/build/Release
SOURCE_DIR=$DIR/source

mkdir -p $BUILD_DIR
pushd $BUILD_DIR
   conan install $DIR
   cmake \
      -DCMAKE_BUILD_TYPE=Release \
      $SOURCE_DIR 

   cmake --build .
   cpack .
popd

