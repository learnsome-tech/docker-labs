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
reg=localhost:18702/taskapi
retag="docker buildx imagetools create --progress none"
$retag -t $reg:staging $reg:4d7c1e9
$retag -t $reg:prod $reg:staging
docker buildx imagetools inspect $reg:4d7c1e9 | sed -n 3p
docker buildx imagetools inspect $reg:prod | sed -n 3p
curl -s localhost:18702/v2/taskapi/tags/list
docker rm -f m07l02-reg
