
trap 'kill $(jobs -p)' EXIT

### remove and restore root

mkdir -p temp/temp

../../fsnotifier64 --background --roots $PWD/temp/temp --log-level debug &

sleep 2

rmdir temp/temp
mkdir temp/temp

sleep 2

