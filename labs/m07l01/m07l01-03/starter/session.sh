#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name m07l01-api m07l01-api
#   9c58e3ad4af18738cb309a4a024788a8551ea0e7cc6d0e61c78662301782b717
docker run -d --name m07l01-idle alpine:3.22 sleep 300
#   3bb5b6b3eb294027a0ff7128de2477a894b57336529958474fe4267035fb92e0
docker run -d --init --name m07l01-init alpine:3.22 sleep 300
#   1ac4a3f9f7f0b249c51bfb4edc603006d3ac64a09aac89f08f56bab9fcd4e695
docker stop m07l01-api m07l01-init
#   m07l01-api
#   m07l01-init
docker stop -t 2 m07l01-idle
#   m07l01-idle
docker ps -a -f name=m07l01 --format '{{.Names}} {{.Status}}'
#   m07l01-init Exited (143) 2 seconds ago
#   m07l01-idle Exited (137) Less than a second ago
#   m07l01-api Exited (0) 2 seconds ago
docker logs m07l01-api
#   listening on port 8000
#   shutting down
docker rm m07l01-api m07l01-idle m07l01-init
#   m07l01-api
#   m07l01-idle
#   m07l01-init
