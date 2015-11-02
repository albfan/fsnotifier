
### self test

../../fsnotifier64 --selftest |& \
   sed 's/^fsnotifier\[[0-9]\+\] //' | \
   sed 's+'$PWD'++' | \
   sed 's+\(debug: unwatching : 1 (\).*)+\1)+' | \
   sed '/mtab/d' | \
   sed '/inotify watch descriptors/d'

