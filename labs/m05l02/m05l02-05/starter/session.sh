#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

img=taskapi:m05l02
docker run --rm $img id
#   uid=10001(app) gid=10001(app) groups=10001(app)
docker run --rm -v m05l02-seed:/data $img stat -c %u /data
#   10001
docker run --rm -v m05l02-new:/out $img touch /out/x
#   touch: /out/x: Permission denied
docker run --rm -v m05l02-new:/out $img stat -c %u /out
#   0
docker run --rm -u 0 -v m05l02-new:/out $img chown 10001 /out
docker run --rm -v m05l02-new:/out $img touch /out/x
docker volume rm m05l02-seed m05l02-new
#   m05l02-seed
#   m05l02-new
