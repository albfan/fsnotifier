#!/bin/bash

function colorecho() {
   echo -e "\x1b[$1m$2\x1b[m"
}

for test in $(ls test*.sh | sort --version-sort)
do
  basename_test=$(basename ${test} .sh)
  title=$(grep "^\s*###[^#]" $test | sed 's/^###\s*//')
  expect=$(grep "^\s*####" $test | sed 's/^####\s*//')
  for skp in $SKIP_TESTS
  do
    if [ "$basename_test" == "$skp" ]
    then
      expect="skip"
      break
    fi
  done
  if [ "$expect" == "skip" ]
  then
    echo $(colorecho 34 ${basename_test}) "${title}" $(colorecho 33 skip)
    continue
  fi
  tmpdir=$(mktemp -d "${basename_test}.XXX")
  cd ${tmpdir}
  ../${test} | sed 's+'$PWD'/++' > ../${basename_test}.out
  cd ..
  rm -rf ${tmpdir}
  diff ${basename_test}.ok ${basename_test}.out
  if [ "$?" == 0 ]
  then
    if [ "$expect" == "failed" ]
    then
      echo $(colorecho 34 ${basename_test}) "${title}" $(colorecho 31 "not failed")
    else
      echo $(colorecho 34 ${basename_test}) "${title}" $(colorecho 32 ok)
    fi
  else
    if [ "$expect" == "failed" ]
    then
      echo $(colorecho 34 ${basename_test}) "${title}" $(colorecho 32 "failed correctly")
    else
      echo $(colorecho 34 ${basename_test}) "${title}" $(colorecho 31 ko)
    fi
  fi
done
