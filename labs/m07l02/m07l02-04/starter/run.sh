#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
reg=localhost:18702/taskapi
retag="docker buildx imagetools create --progress none"
$retag -t $reg:staging $reg:4d7c1e9
$retag -t $reg:prod $reg:staging
docker buildx imagetools inspect $reg:4d7c1e9 | sed -n 3p
docker buildx imagetools inspect $reg:prod | sed -n 3p
curl -s localhost:18702/v2/taskapi/tags/list
docker rm -f m07l02-reg
