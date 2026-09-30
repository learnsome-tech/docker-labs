#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker volume create m05l01-data
#   m05l01-data
run="docker run -d --name m05l01-api -p 18501:8000"
$run -v m05l01-data:/data taskapi:m05l01; sleep 1
#   2afac4ac56378cf429fea9899349be6d5d2a670ae99f96d428d6c36cd87209b7
curl -sd '{"title":"ship it"}' localhost:18501/tasks; echo
#   {"tasks": ["ship it"]}
docker rm -f m05l01-api
#   m05l01-api
$run -v m05l01-data:/data taskapi:m05l01; sleep 1
#   a6fba4328efdecaac365e88df508258051525d203bc212b44c1dbab433cc5261
curl -s localhost:18501/tasks; echo
#   {"tasks": ["ship it"]}
docker rm -f m05l01-api
#   m05l01-api
