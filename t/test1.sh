
trap 'kill $(jobs -p)' EXIT

### basic operations

../../fsnotifier64 --background --roots $PWD &

sleep 1

touch foo
echo foobar > foo
mv foo bar
rm bar

sleep 1
