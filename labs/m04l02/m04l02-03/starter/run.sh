#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
REF=localhost:18402/taskapi
docker rmi $REF:1.0.0 m04l02-taskapi:1.0.0
docker pull $REF:1.0.0
D=$(docker inspect -f '{{index .RepoDigests 0}}' $REF:1.0.0)
echo $D
docker rmi $REF:1.0.0
docker pull $D
docker tag $D $REF:1.0.0
docker run --rm $REF:1.0.0 printenv APP_VERSION
