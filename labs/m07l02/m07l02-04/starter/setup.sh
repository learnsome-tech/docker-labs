#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker run -d --name m07l02-reg -p 18702:5000 registry:3
reg=localhost:18702/taskapi
sha=4d7c1e9
docker build -q -t $reg:$sha .
docker push -q $reg:$sha
docker inspect -f '{{index .RepoDigests 0}}' $reg:$sha
img=localhost:18702/taskapi:4d7c1e9
docker run -d --name m07l02-test $img
sleep 4
docker inspect -f '{{.State.Health.Status}}' m07l02-test
docker exec m07l02-test wget -qO- 127.0.0.1:8000/health; echo
docker exec m07l02-test wget -qO- 127.0.0.1:8000/tasks; echo
docker rm -f m07l02-test
