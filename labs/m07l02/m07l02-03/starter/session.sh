#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

img=localhost:18702/taskapi:4d7c1e9
docker run -d --name m07l02-test $img
#   e3724a640688a49decc735eb4bcca44ddea073a290d5f1e9cbc83b9b846d7f1d
sleep 4
docker inspect -f '{{.State.Health.Status}}' m07l02-test
#   healthy
docker exec m07l02-test wget -qO- 127.0.0.1:8000/health; echo
#   {"status": "ok", "version": "1.0.0"}
docker exec m07l02-test wget -qO- 127.0.0.1:8000/tasks; echo
#   {"tasks": []}
docker rm -f m07l02-test
#   m07l02-test
