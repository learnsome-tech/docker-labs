#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t taskapi:m05l02 . >/dev/null
mkdir data
run="docker run -d --name m05l02-api -p 18502:8000"
$run -v ./data:/data taskapi:m05l02; sleep 1
#   dd8b934add67dc9682b5adb3025f942f602866c6226eddd21902ea8f6c36b26c
curl -sd '{"title":"on disk"}' localhost:18502/tasks; echo
#   {"tasks": ["on disk"]}
cat data/tasks.json; echo
#   ["on disk"]
docker rm -f m05l02-api
#   m05l02-api
