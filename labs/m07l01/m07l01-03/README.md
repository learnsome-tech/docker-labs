# m07l01-03 · Stopped, killed or obeyed: the signal is in the code

**Lesson:** [Diagnose Crashes, Resource Limits And Unhealthy Containers](https://learnsome.tech/learn/docker-course/m07l01) (lesson 7.1, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can reproduce a crash, an out of memory kill, a slow stop, a crash loop and an unhealthy container, and name the cause of each from its exit code, its recorded state, its restart count, its events and its health log.

In the lesson: Stopping is also a signal, and the exit code tells you whether the process listened. Start three containers: the service, a bare sleep command, and the same sleep with the init flag, which puts a tiny init program in front of it as process one. Stop the service and the init container normally. Stop the bare sleep with a two second grace period. The stop command sends the termination signal, waits, then sends the kill signal. Now list them. The service exited with zero, because the task service catches the termination signal, prints shutting down and exits cleanly: its log proves it. The init container exited with one hundred and forty three, signal fifteen, delivered and obeyed. The bare sleep exited with one hundred and thirty seven. Process one in a container ignores any signal it has no handler for, so it sat out the grace period and was killed.

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
   docker run -d --name m07l01-api m07l01-api
   docker run -d --name m07l01-idle alpine:3.22 sleep 300
   docker run -d --init --name m07l01-init alpine:3.22 sleep 300
   docker stop m07l01-api m07l01-init
   docker stop -t 2 m07l01-idle
   docker ps -a -f name=m07l01 --format '{{.Names}} {{.Status}}'
   docker logs m07l01-api
   docker rm m07l01-api m07l01-idle m07l01-init
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l01-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
