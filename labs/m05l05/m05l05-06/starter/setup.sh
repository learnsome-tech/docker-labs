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
img=taskapi:m05l05
docker run -d --name m05l05-env -e DB_PASSWORD=hunter2 $img
docker inspect m05l05-env | grep PASSWORD
mkdir secrets && printf hunter2 > secrets/db_password
sec="-v ./secrets:/run/secrets:ro"
docker run -d --name m05l05-file $sec $img
docker inspect m05l05-file | grep -c hunter2
docker exec m05l05-file cat /run/secrets/db_password; echo
docker rm -f m05l05-env m05l05-file
