#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t taskapi:m05l05 . >/dev/null
img=taskapi:m05l05
docker run --rm $img printenv APP_VERSION PORT
docker run --rm -e APP_VERSION=1.1.0 $img printenv APP_VERSION
printf 'APP_VERSION=2.0.0\nPORT=9000\n' > app.env
docker run --rm --env-file app.env $img printenv PORT
echo 'APP_VERSION="3.0.0"' >> app.env
docker run --rm --env-file app.env $img printenv APP_VERSION
