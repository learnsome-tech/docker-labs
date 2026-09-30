#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker run --rm alpine:3.20 ls /proc/self/ns
docker run --rm alpine:3.20 readlink /proc/self/ns/pid
docker run --rm alpine:3.20 ps -o comm
docker run --rm --pid=host alpine:3.20 ps -o comm|sed -n 2,4p
docker run --rm --uts=host alpine:3.20 hostname
