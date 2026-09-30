# m06l04-06 · A fresh project and one exit code

**Lesson:** [Integration Tests, Test Data And Compose Cleanup](https://learnsome.tech/learn/docker-course/m06l04) (lesson 6.4, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can run integration tests in a container against the real stack, seed and load test data, isolate each run with its own project name, turn the result into an exit code, and clean up every container, network and volume a run created.

In the lesson: A new project name gives a brand new database, seeded from scratch, next to the old one and without touching it. This time, one command does everything a pipeline needs. Up with the test service named starts it together with its dependencies, and the exit code from option returns the test container's exit code as the command's own. It implies abort on container exit, so the command ends as soon as the test finishes rather than waiting forever on a server. The suite passes and the command returns zero. But list the project: the API and the database are still running. Stopping the attached test container is all the abort does, so a pipeline must always follow with down.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/extra.sql`](starter/extra.sql)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/seed.sql`](starter/seed.sql)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/tests/smoke.sh`](starter/tests/smoke.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   export COMPOSE_PROJECT_NAME=m06l04-run-b
   docker compose up --exit-code-from test test; echo $?
   docker compose ps -a --format '{{.Service}} {{.Status}}'
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l04-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
