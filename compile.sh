#!/bin/sh
COMPILER=clang
#COMPILER=gcc
echo "compiling 32-bit version"
$COMPILER -m32 $CC_FLAGS -o fsnotifier main.c inotify.c util.c
if [ $? -eq 0 ] ; then
  echo "compiling 64-bit version"
  $COMPILER -m64 $CC_FLAGS -o fsnotifier64 main.c inotify.c util.c
  if [ $? -eq 0 ] ; then
    chmod 755 fsnotifier fsnotifier64
  fi
fi
