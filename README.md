# fsnotifier

File watcher

## Intro

Based on intellij [fsnotifier](https://confluence.jetbrains.com/display/IDEADEV/FileWatcher+implementation+contract) this is a fork more command line and script friendly

## Usage

Launch it as

    $ fsnotifier --roots $PWD --background

and see output.

See an example:

    $ mkdir example
    $ cd example
    $ ../res/example.sh &
    $ touch foo
    $ mv foo bar
    $ echo "foobar" > bar

You can use `example.sh` as template and define what to do on function `process()`. Indeed, sourcing example.sh and redefine `process()` should be enough to use it.

## Alternatives

Although fsnotifier is fully operative, if you want serious file watcher, see https://github.com/rvoicilas/inotify-tools/wiki.
