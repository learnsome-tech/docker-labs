#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t taskapi:m05l05 . >/dev/null
img=taskapi:m05l05
docker run --rm $img printenv APP_VERSION PORT
#   1.0.0
#   8000
docker run --rm -e APP_VERSION=1.1.0 $img printenv APP_VERSION
#   1.1.0
printf 'APP_VERSION=2.0.0\nPORT=9000\n' > app.env
docker run --rm --env-file app.env $img printenv PORT
#   9000
echo 'APP_VERSION="3.0.0"' >> app.env
docker run --rm --env-file app.env $img printenv APP_VERSION
#   "3.0.0"
