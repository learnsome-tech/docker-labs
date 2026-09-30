# m06l01-07 · Down, up again, then clean up

**Lesson:** [Define The Service And Database With Compose](https://learnsome.tech/learn/docker-course/m06l01) (lesson 6.1, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can describe the task API and a Postgres database in one compose.yaml, check it with docker compose config, run it with up, ps, logs and exec, and take it down knowing which objects survive.

In the lesson: Take the stack down. Compose stops and removes the containers in reverse dependency order, the API first and the database second, then removes the network. Now list volumes again: both are still there. That is deliberate. A volume is where data lives, and down only removes what can be recreated from the file. Bring the stack back and list tasks: the one we posted survived the round trip. For a real cleanup, add the volumes flag to down, which removes the named volumes as well, then remove the image we built. Lesson four comes back to cleanup, because a test run that forgets it leaves a surprise for the next one.

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
   docker compose down
   docker volume ls -q --filter name=m06l01-stack
   docker compose up -d --wait
   curl -s localhost:18601/tasks -w '\n'
   docker compose down -v
   docker image rm taskapi:m06l01
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l01-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
