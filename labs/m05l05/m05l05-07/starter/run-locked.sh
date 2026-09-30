#!/bin/sh
# Start the task API with everything it does not need taken away.
docker run -d --name m05l05-api \
  --read-only --tmpfs /tmp \
  --cap-drop ALL \
  --security-opt no-new-privileges \
  --user 10001:10001 \
  --memory 128m --cpus 0.5 --pids-limit 64 \
  -v m05l05-data:/data \
  -p 18505:8000 \
  taskapi:m05l05
