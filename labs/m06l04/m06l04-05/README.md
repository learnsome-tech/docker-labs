# m06l04-05 · Shared state breaks a rerun

**Lesson:** [Integration Tests, Test Data And Compose Cleanup](https://learnsome.tech/learn/docker-course/m06l04) (lesson 6.4, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can run integration tests in a container against the real stack, seed and load test data, isolate each run with its own project name, turn the result into an exit code, and clean up every container, network and volume a run created.

In the lesson: Back in the same project, look at the data: the two seed rows. Now load one more row, the way you would prepare data for a particular test. Exec runs the database client inside the running container, the capital T flag turns off the terminal Compose would otherwise allocate, and the shell feeds the file in on standard input. One row inserted. Then run the suite again. The first two checks pass, the database check fails, and the exit code is one. Nothing is wrong with the code: the test met data a previous step left behind. That is the most common way integration suites become flaky, and the cure is not a cleverer test but a fresh project for every run.

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
   export COMPOSE_PROJECT_NAME=m06l04-run-a
   docker compose exec db psql -U tasks -tAc 'table tasks'
   docker compose exec -T db psql -U tasks < extra.sql
   docker compose run --rm test; echo $?
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l04-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
