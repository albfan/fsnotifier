
trap 'kill $(jobs -p)' EXIT

mkdir test1

../fsnotifier64 --background --roots $PWD/test1 &

sleep 1

cd test1
touch foo
echo foobar > foo
mv foo bar
rm bar

sleep 1

cd ..
rm -rf test1
