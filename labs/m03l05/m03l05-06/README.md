# m03l05-06 · Who receives SIGTERM when the container stops

**Lesson:** [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) (lesson 3.5, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

In the lesson: Docker stop sends a sigterm to process one, waits a grace period of ten seconds by default, then sends a sigkill, which cannot be caught. Start one container with our exec form command, then save a shell command line in a variable and start a second one through the shell, as a two step shell form command would. Look inside the second and process one is the shell, with Python as its child. Stop both, with the time flag cutting the grace to three seconds. The exit codes tell the story: zero for the first, and one hundred and thirty seven for the second, which means killed. The first log ends with shutting down: Python ran its handler. The second never heard it: the shell as process one ignored it, and Python was killed mid flight.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/Dockerfile.tool`](starter/Dockerfile.tool)
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker run -d --name m03l05-exec m03l05-api
   w='python app.py; echo stopped'
   docker run -d --name m03l05-wrap m03l05-api sh -c "$w"
   sleep 1; docker exec m03l05-wrap ps -o pid,args
   docker stop -t 3 m03l05-exec m03l05-wrap
   docker wait m03l05-exec m03l05-wrap
   docker logs m03l05-exec
   docker logs m03l05-wrap
   docker rm m03l05-exec m03l05-wrap
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l05-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
