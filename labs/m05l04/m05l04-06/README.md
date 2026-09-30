# m05l04-06 · Let Docker pick the host port, then ask

**Lesson:** [Port Publishing, Localhost And Network Troubleshooting](https://learnsome.tech/learn/docker-course/m05l04) (lesson 5.4, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can publish a container port on all interfaces or on loopback only, recognise and fix a server that listens on 127.0.0.1 inside its container, use EXPOSE, -P and docker port correctly, and work through a cannot-connect problem step by step.

In the lesson: Read the exposed ports straight from the image configuration: one entry, port eight thousand, written as a map because an image can expose several. Now run the image with publish all and no port numbers at all. Docker picks a free high port on the host. Rather than reading it off the screen, capture the answer: ask the port command for container port eight thousand, keep the first line, which is the host address and port, and store it in a shell variable. Then use it to call the health endpoint. The number is deliberately not on screen, because it will be different on your machine and on the next run, and nothing in the workflow depends on it.

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
   docker inspect -f '{{.Config.ExposedPorts}}' taskapi:m05l04
   docker run -d --name m05l04-auto -P taskapi:m05l04
   hp=$(docker port m05l04-auto 8000/tcp | sed -n 1p)
   sleep 1; curl -s $hp/health; echo
   docker rm -f m05l04-auto
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l04-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
