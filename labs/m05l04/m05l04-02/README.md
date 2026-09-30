# m05l04-02 · Publish a port, then ask Docker what it published

**Lesson:** [Port Publishing, Localhost And Network Troubleshooting](https://learnsome.tech/learn/docker-course/m05l04) (lesson 5.4, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can publish a container port on all interfaces or on loopback only, recognise and fix a server that listens on 127.0.0.1 inside its container, use EXPOSE, -P and docker port correctly, and work through a cannot-connect problem step by step.

In the lesson: Build the image, keep its name in a variable, and publish port eighteen thousand five hundred and four to container port eight thousand. Then ask Docker what it actually did, with the port command. Two lines: one for every version four address on the host, written as four zeros, and one for every version six address, written as two colons in square brackets. So this service is reachable from anything that can reach this machine. Curl the health endpoint to confirm it answers. Now remove it and publish again with the loopback address in front of the host port. The port command shows a single line, bound to one hundred and twenty seven point zero point zero point one only. On a laptop or a shared server, that is the setting you want for anything that is not meant for the network.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker build -q -t taskapi:m05l04 . >/dev/null
   img=taskapi:m05l04
   docker run -d --name m05l04-api -p 18504:8000 $img
   docker port m05l04-api
   sleep 1; curl -s localhost:18504/health; echo
   docker rm -f m05l04-api
   docker run -d --name m05l04-api -p 127.0.0.1:18504:8000 $img
   docker port m05l04-api
   docker rm -f m05l04-api
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l04-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
