#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l03 — Union Filesystems, Images And Writable Layers
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l03
# © LearnSome.tech
set -u
bash setup.sh >/dev/null 2>&1
docker run --name note-one layers:demo
docker run --name note-two layers:demo rm /app/note.txt
docker diff note-two
docker start -a note-one
docker rm -f note-one note-two
