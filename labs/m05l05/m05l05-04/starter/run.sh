#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
img=taskapi:m05l05
docker run -d --name m05l05-env -e DB_PASSWORD=hunter2 $img
docker inspect m05l05-env | grep PASSWORD
mkdir secrets && printf hunter2 > secrets/db_password
sec="-v ./secrets:/run/secrets:ro"
docker run -d --name m05l05-file $sec $img
docker inspect m05l05-file | grep -c hunter2
docker exec m05l05-file cat /run/secrets/db_password; echo
docker rm -f m05l05-env m05l05-file
