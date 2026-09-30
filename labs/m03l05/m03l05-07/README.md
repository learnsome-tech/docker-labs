# m03l05-07 · A tiny init process for programs without handlers

**Lesson:** [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) (lesson 3.5, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

In the lesson: The kernel treats process one specially: a signal it has no handler for is ignored. The sleep command has no signal handler, so as process one it shrugs off the sigterm. Start one like that, and a second with the init flag, which puts a tiny init program from Docker in front of it. Stop both with a three second grace. The first sat out the grace period and was killed: one hundred and thirty seven. The second exited at once with one hundred and forty three, meaning it died from the sigterm itself, because the init program passed the signal on to a process that is not process one. Ask a container with the flag who is process one, and it is Docker's init, which also reaps finished child processes.

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
   docker run -d --name m03l05-bare alpine:3.20 sleep 300
   docker run -d --init --name m03l05-init alpine:3.20 sleep 300
   docker stop -t 3 m03l05-bare m03l05-init
   docker wait m03l05-bare m03l05-init
   docker run --rm --init alpine:3.20 ps -o pid,comm
   docker rm m03l05-bare m03l05-init
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l05-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
