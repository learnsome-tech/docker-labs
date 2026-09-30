#!/usr/bin/env bash
set -u
docker build -q -t taskapi:m05l02 . >/dev/null
mkdir data
run="docker run -d --name m05l02-api -p 18502:8000"
$run -v ./data:/data taskapi:m05l02; sleep 1
curl -sd '{"title":"on disk"}' localhost:18502/tasks; echo
cat data/tasks.json; echo
docker rm -f m05l02-api
