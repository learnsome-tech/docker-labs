# m06l01-05 · Build, start and call the stack

**Lesson:** [Define The Service And Database With Compose](https://learnsome.tech/learn/docker-course/m06l01) (lesson 6.1, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can describe the task API and a Postgres database in one compose.yaml, check it with docker compose config, run it with up, ps, logs and exec, and take it down knowing which objects survive.

In the lesson: Build first, with the build command and the quiet flag, so Compose builds from source instead of looking for the image in a registry. Then up, with the detach flag to hand the prompt back, and the wait flag, which returns only once every service is running and the API's health check, inherited from the build file, passes. The next lesson is about exactly that. The next command lists the project's containers and their status. Now call the service: the health endpoint answers with version one point one, the value from the compose file. Post a task, and it comes back in the list. Finally, logs shows the API's output, each line prefixed with the container it came from. Compose gathers logs from every service, so name the one you want.

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
   docker compose build --quiet
   docker compose up -d --wait
   docker compose ps --format '{{.Service}} {{.Status}}'
   curl -s localhost:18601/health -w '\n'
   curl -s -d '{"title":"ship it"}' localhost:18601/tasks -w '\n'
   docker compose logs api
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l01-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
