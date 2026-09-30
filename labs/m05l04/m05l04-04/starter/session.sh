#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

srv="python:3.12-alpine python -m http.server 8000 -b"
docker run -d --name m05l04-bad -p 18504:8000 $srv 127.0.0.1
#   37df07cb9012c1dd54dd607e82719fe3b77098b59661cd7703fdbc79cdd57238
sleep 1; curl -sS localhost:18504/; echo "exit $?"
#   curl: (56) Recv failure: Connection reset by peer
#   exit 56
docker exec m05l04-bad netstat -tln
#   Active Internet connections (only servers)
#   Proto Recv-Q Send-Q Local Address           Foreign Address         State       
#   tcp        0      0 127.0.0.1:8000          0.0.0.0:*               LISTEN      
docker exec m05l04-bad wget -qO- 127.0.0.1:8000 | sed -n 1p
#   <!DOCTYPE HTML>
docker rm -f m05l04-bad
#   m05l04-bad
docker run -d --name m05l04-good -p 18504:8000 $srv 0.0.0.0
#   cbd1eea6b2e39d92918b336385ba8d57071867e4a43f84752414cb90e0d59e4c
sleep 1; curl -s localhost:18504/ | sed -n 1p
#   <!DOCTYPE HTML>
docker rm -f m05l04-good
#   m05l04-good
