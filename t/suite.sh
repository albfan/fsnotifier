#!/bin/bash

./test1.sh | sed 's+'$PWD'/++' > test1.out

diff test1.ok test1.out
