#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name m03l04-web -p 18304:8000 m03l04-api
#   47c2bbdced8a2008efe120335834bcda4f2d678ef86adb22041f6eaec04398bf
sleep 1; curl -s localhost:18304/health; echo
#   {"status": "ok", "version": "1.1.0"}
docker port m03l04-web
#   8000/tcp -> 0.0.0.0:18304
#   8000/tcp -> [::]:18304
docker rm -f m03l04-web
#   m03l04-web
