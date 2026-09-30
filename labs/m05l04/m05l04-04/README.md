# m05l04-04 · The classic bug: a server that listens on loopback

**Lesson:** [Port Publishing, Localhost And Network Troubleshooting](https://learnsome.tech/learn/docker-course/m05l04) (lesson 5.4, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can publish a container port on all interfaces or on loopback only, recognise and fix a server that listens on 127.0.0.1 inside its container, use EXPOSE, -P and docker port correctly, and work through a cannot-connect problem step by step.

In the lesson: Here is the bug that costs people an afternoon. To show it with nothing hidden, use Python's built in web server, which takes a bind option, and keep the image and the command in a shell variable. Start it bound to loopback inside the container, and publish the port as usual. From the host, the request fails: connection reset by peer, exit code fifty six. Docker accepted the connection and passed it to the container's network interface, where nothing listens. Look inside with the network status tool: the only listener is on loopback. Inside, the same request works perfectly, which is why the developer insists the service is fine. Remove it, start the same server bound to all interfaces, written as four zeros, and the host gets the page.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   srv="python:3.12-alpine python -m http.server 8000 -b"
   docker run -d --name m05l04-bad -p 18504:8000 $srv 127.0.0.1
   sleep 1; curl -sS localhost:18504/; echo "exit $?"
   docker exec m05l04-bad netstat -tln
   docker exec m05l04-bad wget -qO- 127.0.0.1:8000 | sed -n 1p
   docker rm -f m05l04-bad
   docker run -d --name m05l04-good -p 18504:8000 $srv 0.0.0.0
   sleep 1; curl -s localhost:18504/ | sed -n 1p
   docker rm -f m05l04-good
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l04-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
