# m07l01-02 · A crash and an out of memory kill, side by side

**Lesson:** [Diagnose Crashes, Resource Limits And Unhealthy Containers](https://learnsome.tech/learn/docker-course/m07l01) (lesson 7.1, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can reproduce a crash, an out of memory kill, a slow stop, a crash loop and an unhealthy container, and name the cause of each from its exit code, its recorded state, its restart count, its events and its health log.

In the lesson: Start by building the service image, then break it in two different ways. First, a configuration mistake: set the port variable to the word eighty instead of a number. Python cannot turn that into an integer, so it prints a traceback and exits. Second, a resource problem. Give a container a memory limit of thirty two megabytes, and set the swap limit to the same value, because otherwise Docker lets it use that much swap again on top. Then run a command that reads zeros forever and keeps them all in memory. It prints nothing and returns within a couple of seconds. Now ask both containers for their exit code and their out of memory flag. The crash reports one and false. The other reports one hundred and thirty seven and true: the kernel's out of memory killer ended it the moment it crossed its limit. The same silence on the terminal, and two completely different causes.

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
   docker build -q -t m07l01-api . >/dev/null
   docker run --name m07l01-bad -e PORT=eighty m07l01-api
   lim="-m 32m --memory-swap 32m"
   docker run --name m07l01-oom $lim alpine:3.22 tail /dev/zero
   f='{{.State.ExitCode}} {{.State.OOMKilled}}'
   docker inspect -f "$f" m07l01-bad m07l01-oom
   docker rm m07l01-bad m07l01-oom
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l01-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
