# m03l05-03 · Ownership decides what a non-root user can write

**Lesson:** [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) (lesson 3.5, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

In the lesson: A non-root user can only write where it has been given permission, which is exactly what you want. Ask who owns the two directories. The code directory belongs to root, since it was created before the user line. The data directory belongs to app, since the file handed it over. So an attempt to write into the code directory is refused, and if the service is ever compromised, it cannot rewrite its own program. The same write into the data directory succeeds silently. The image's user is only a default, though: the user flag on docker run overrides it, and a user of root is honoured. That is handy for debugging, and it is why platforms such as Kubernetes can refuse root containers outright.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
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
   docker run --rm m03l05-api stat -c '%U %n' /app /data
   docker run --rm m03l05-api touch /app/x
   docker run --rm m03l05-api touch /data/x
   docker run --rm -u root m03l05-api id -un
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l05-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
