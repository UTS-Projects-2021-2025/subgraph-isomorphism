#!/bin/sh

# Watch for changes in the current directory and run make if anything changes.
watchexec -e tex make
