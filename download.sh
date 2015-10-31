#!/bin/sh

set -e

for f in fsnotifier.h \
         inotify.c \
         main.c \
         make.sh \
         util.c
do
     curl \
            "http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/$f;hb=131" \
                -o $f
done

sh make.sh

strip fsnotifier fsnotifier64

# Should check against truncation
truncate -s 29155 fsnotifier64
truncate -s 22791 fsnotifier

#cp fsnotifier fsnotifier64 $1
