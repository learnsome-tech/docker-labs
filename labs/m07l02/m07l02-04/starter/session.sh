#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

reg=localhost:18702/taskapi
retag="docker buildx imagetools create --progress none"
$retag -t $reg:staging $reg:4d7c1e9
$retag -t $reg:prod $reg:staging
docker buildx imagetools inspect $reg:4d7c1e9 | sed -n 3p
#   Digest:    sha256:e30ef7a9e6474813d3a0b77c0c290a585df4e10f4ab8144590c225332d91721b
docker buildx imagetools inspect $reg:prod | sed -n 3p
#   Digest:    sha256:e30ef7a9e6474813d3a0b77c0c290a585df4e10f4ab8144590c225332d91721b
curl -s localhost:18702/v2/taskapi/tags/list
#   {"name":"taskapi","tags":["4d7c1e9","prod","staging"]}
docker rm -f m07l02-reg
#   m07l02-reg
