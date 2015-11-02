#!/bin/bash

# compile with coverage support
.coverage.sh

# run test suite
cd t
./suite.sh
cd ..

# txt report
gcov -abcfu *.c
#cat *.gcov

# html report
lcov --directory . --capture --output-file app.info
genhtml --output-directory cov_html app.info
#xdg-open cov_html/index.html
