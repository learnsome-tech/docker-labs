#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

img=taskapi:m05l05
docker run -d --name m05l05-env -e DB_PASSWORD=hunter2 $img
#   591d32dc7f8b8787b87ccb163b6752fffdb4530e0026fb51f7afdab7da1dcb81
docker inspect m05l05-env | grep PASSWORD
#                   "DB_PASSWORD=hunter2",
mkdir secrets && printf hunter2 > secrets/db_password
sec="-v ./secrets:/run/secrets:ro"
docker run -d --name m05l05-file $sec $img
#   6852af7db7172ca8662fe58ac88749992131e86277daff0c91204c5c6acd2d7f
docker inspect m05l05-file | grep -c hunter2
#   0
docker exec m05l05-file cat /run/secrets/db_password; echo
#   hunter2
docker rm -f m05l05-env m05l05-file
#   m05l05-env
#   m05l05-file
