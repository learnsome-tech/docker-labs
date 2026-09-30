#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t taskapi:m05l01 . >/dev/null
run="docker run -d --name m05l01-api -p 18501:8000"
$run taskapi:m05l01; sleep 1
#   ccb269596e76577792f18862d6bd319a8462622d6e66e99bb2fb83b800fdc393
curl -sd '{"title":"ship it"}' localhost:18501/tasks; echo
#   {"tasks": ["ship it"]}
docker rm -f m05l01-api
#   m05l01-api
$run taskapi:m05l01; sleep 1
#   490bed9a305d6736f6b5ae57209d7e13cfc0ec2f5bf7334ba6388a5bc4d3a7e3
curl -s localhost:18501/tasks; echo
#   {"tasks": []}
docker rm -f m05l01-api
#   m05l01-api
