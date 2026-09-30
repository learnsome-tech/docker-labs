#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker run -d --name m07l02-reg -p 18702:5000 registry:3
reg=localhost:18702/taskapi
sha=4d7c1e9
docker build -q -t $reg:$sha .
docker push -q $reg:$sha
docker inspect -f '{{index .RepoDigests 0}}' $reg:$sha
