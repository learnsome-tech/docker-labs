# m07l01-05 · Running, but unhealthy

**Lesson:** [Diagnose Crashes, Resource Limits And Unhealthy Containers](https://learnsome.tech/learn/docker-course/m07l01) (lesson 7.1, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can reproduce a crash, an out of memory kill, a slow stop, a crash loop and an unhealthy container, and name the cause of each from its exit code, its recorded state, its restart count, its events and its health log.

In the lesson: The hardest failure to spot is the one that keeps running. Start the service with the port variable set to nine thousand, a memory limit of sixty four megabytes, and a health check that probes every second and gives up after two failures, so we do not wait half a minute. The health check baked into the image still asks port eight thousand. After a few seconds the process list shows the container up, and unhealthy. Ask for the most recent probe and you get the reason in plain words: connection refused. The log confirms the mismatch, listening on port nine thousand. Stats show the memory in use against the limit you set. Now notice what did not happen: nothing restarted it. The engine reports health, and restart policies react only to exits. Acting on an unhealthy container is the job of Compose dependencies or an orchestrator.

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
   opts="-m 64m --health-interval 1s --health-retries 2"
   docker run -d --name m07l01-sick -e PORT=9000 $opts m07l01-api
   sleep 4
   docker ps -f name=m07l01-sick --format '{{.Status}}'
   f='{{(index .State.Health.Log 0).Output}}'
   docker inspect -f "$f" m07l01-sick
   docker logs m07l01-sick
   docker stats --no-stream --format '{{.MemUsage}}' m07l01-sick
   docker rm -f m07l01-sick
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l01-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
