#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

run="docker run -d --name m05l02-api -p 18502:8000"
$run -v m05l02-data:/data taskapi:m05l02; sleep 1
#   82e0f20d5b6eed12c177f5ecb0c79f952dd875bd8ec232373bf33a4634de4f10
curl -sd '{"title":"keep me"}' localhost:18502/tasks; echo
#   {"tasks": ["keep me"]}
docker rm -f m05l02-api && sh vol.sh backup m05l02-data
#   m05l02-api
#   ./
#   ./tasks.json
ls backup
#   m05l02-data.tar.gz
docker volume rm m05l02-data && sh vol.sh restore m05l02-data
#   m05l02-data
$run -v m05l02-data:/data taskapi:m05l02; sleep 1
#   3613a9a5f7a3eb8428f9a962f01e58fac93f22a4b8029c00b0e234e6792035a2
curl -sd '{"title":"again"}' localhost:18502/tasks; echo
#   {"tasks": ["keep me", "again"]}
docker rm -f m05l02-api && docker volume rm m05l02-data
#   m05l02-api
#   m05l02-data
