# m06l02-06 · What unhealthy looks like, then clean up

**Lesson:** [Health Checks, Dependencies And Reliable Startup](https://learnsome.tech/learn/docker-course/m06l02) (lesson 6.2, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can reproduce a startup race, fix it with a HEALTHCHECK, a Compose healthcheck and depends_on conditions, read health status from ps and inspect, and explain why the application must still retry.

In the lesson: To see the other outcome, keep some health flags in a shell variable and start a throwaway busybox container whose check is the false command, run every second. Wait five seconds, then list it. The status reads up, and unhealthy. Look at both words. The container is still running, because plain Docker only reports health. A restart policy reacts to a process exiting, not to a failing check. Something else has to act on that signal: Compose waiting at startup, you reading the status, or the orchestrator this course hands you to at the end. Remove it, then take the stack down with its volumes and remove the image.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/race.yaml`](starter/race.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/schema.sql`](starter/schema.sql)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   HC='--health-cmd false --health-interval 1s'
   docker run -d --name m06l02-sick $HC busybox:1.37 sleep 60
   sleep 5
   docker ps -f name=m06l02-sick --format '{{.Status}}'
   docker rm -f m06l02-sick
   docker compose down -v
   docker image rm taskapi:m06l02
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l02-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
