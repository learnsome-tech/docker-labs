#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
img=localhost:18702/taskapi:4d7c1e9
docker run -d --name m07l02-test $img
sleep 4
docker inspect -f '{{.State.Health.Status}}' m07l02-test
docker exec m07l02-test wget -qO- 127.0.0.1:8000/health; echo
docker exec m07l02-test wget -qO- 127.0.0.1:8000/tasks; echo
docker rm -f m07l02-test
