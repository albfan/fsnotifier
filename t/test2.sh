
trap 'kill $(jobs -p)' EXIT

### log level configuration

../../fsnotifier64 --background --roots $PWD --log-level debug &
sleep 1
../../fsnotifier64 --background --roots $PWD --log-level info &
sleep 1
../../fsnotifier64 --background --roots $PWD --log-level warning &
sleep 1
../../fsnotifier64 --background --roots $PWD --log-level error &
sleep 1
../../fsnotifier64 --background --roots $PWD --log-level off &
sleep 1
