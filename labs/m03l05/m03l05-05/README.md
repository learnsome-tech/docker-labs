# m03l05-05 · Overriding each half from the command line

**Lesson:** [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) (lesson 3.5, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

In the lesson: Build it from its own file with the file flag, then try each override. Run it with no arguments and you get the default: task list. Add milk after the image name and the default arguments are replaced, giving task add milk. To swap the program itself you need the entrypoint flag. Here it runs the id command instead of echo, with the dash u n option after the image name, and it prints root, because this little image never set a user. Now keep a format string in a variable and read both settings straight from the configuration. The tool image has an entrypoint and a default argument. The task API has an empty entrypoint and a command, which is why a single argument earlier replaced the whole command.

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
   docker build -q -t m03l05-tool -f Dockerfile.tool .
   docker run --rm m03l05-tool
   docker run --rm m03l05-tool add milk
   docker run --rm --entrypoint id m03l05-tool -un
   f='{{.Config.Entrypoint}} {{.Config.Cmd}}'
   docker inspect -f "$f" m03l05-tool
   docker inspect -f "$f" m03l05-api
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l05-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
