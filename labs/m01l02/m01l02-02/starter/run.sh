#!/usr/bin/env bash
set -u
docker run --rm alpine:3.20 ls /proc/self/ns
docker run --rm alpine:3.20 readlink /proc/self/ns/pid
