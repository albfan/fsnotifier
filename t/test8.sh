
trap 'kill $(jobs -p)' EXIT

### reset event

mkdir mnt
sudo mount -ttmpfs none mnt

../../fsnotifier64 --background --roots $PWD/mnt --log-level debug &

sleep 2

sudo fuser -k mnt &> /dev/null
sudo umount -f mnt

sleep 2

