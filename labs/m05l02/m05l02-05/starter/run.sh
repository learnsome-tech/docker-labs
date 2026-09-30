#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
img=taskapi:m05l02
docker run --rm $img id
docker run --rm -v m05l02-seed:/data $img stat -c %u /data
docker run --rm -v m05l02-new:/out $img touch /out/x
docker run --rm -v m05l02-new:/out $img stat -c %u /out
docker run --rm -u 0 -v m05l02-new:/out $img chown 10001 /out
docker run --rm -v m05l02-new:/out $img touch /out/x
docker volume rm m05l02-seed m05l02-new
