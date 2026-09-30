#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker run --rm alpine:3.20 ls /proc/self/ns
docker run --rm alpine:3.20 readlink /proc/self/ns/pid
