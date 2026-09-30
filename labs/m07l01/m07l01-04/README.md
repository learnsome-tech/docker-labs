# m07l01-04 · A crash loop under a restart policy

**Lesson:** [Diagnose Crashes, Resource Limits And Unhealthy Containers](https://learnsome.tech/learn/docker-course/m07l01) (lesson 7.1, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can reproduce a crash, an out of memory kill, a slow stop, a crash loop and an unhealthy container, and name the cause of each from its exit code, its recorded state, its restart count, its events and its health log.

In the lesson: A restart policy is the engine's answer to a crash, and it can also hide one. Run the misconfigured service again with the on failure policy and at most three retries, then wait a few seconds. The restart count says three: the engine tried again, with a delay that doubles each time from a tenth of a second, and then gave up. The log holds four tracebacks, the first run plus three restarts, because a restart reuses the same container and appends to the same log. Now ask the event stream for the last twenty seconds of this container's life. It tells the story in order: create, then start and die with exit code one, four times over. With the always policy this container would never give up, and a quick look at the list would show it up for a second at a time. So when a service seems flaky, read the restart count first.

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
   pol="--restart on-failure:3"
   docker run -d --name m07l01-loop $pol -e PORT=x m07l01-api
   sleep 5
   docker inspect -f '{{.RestartCount}}' m07l01-loop
   docker logs m07l01-loop 2>&1 | grep -c Traceback
   e='--format={{.Action}} {{.Actor.Attributes.exitCode}}'
   w="--since 20s --until 0s"
   docker events $w -f container=m07l01-loop "$e"
   docker rm m07l01-loop
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l01-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
