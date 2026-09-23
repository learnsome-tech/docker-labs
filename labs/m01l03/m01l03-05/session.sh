#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l03 — Union Filesystems, Images And Writable Layers
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l03
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --name note-one layers:demo
#   layers are cheap
docker run --name note-two layers:demo rm /app/note.txt
docker diff note-two
#   C /app
#   D /app/note.txt
docker start -a note-one
#   layers are cheap
docker rm -f note-one note-two
#   note-one
#   note-two
