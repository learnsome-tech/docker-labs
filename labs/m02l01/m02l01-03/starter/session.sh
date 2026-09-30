#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image inspect alpine:3.20 --format '{{.Os}}'
#   linux arm64
docker image inspect alpine:3.20 --format '{{.Config.Cmd}}'
#   ["/bin/sh"]
docker image history alpine:3.20
#   IMAGE        CREATED       CREATED BY   SIZE      COMMENT
#   ...
