# m06l04-07 · Clean up every run

**Lesson:** [Integration Tests, Test Data And Compose Cleanup](https://learnsome.tech/learn/docker-course/m06l04) (lesson 6.4, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can run integration tests in a container against the real stack, seed and load test data, isolate each run with its own project name, turn the result into an exit code, and clean up every container, network and volume a run created.

In the lesson: Compose can list its projects, including stopped ones, and both runs are still there. Take each down by name with the project flag, and always with the volumes flag. It removes the named task volume, which the output shows, and also the anonymous volume the Postgres image creates for its data, which the output does not show. Without the volumes flag, that anonymous volume survives every run, and a busy build machine slowly fills its disk with dead databases. List the projects again. Nothing is left. Finally, remove the image built for the lesson. In a pipeline, put the down step where it runs even when the tests fail, such as a trap in a shell script or an always step in the pipeline.

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
   docker compose ls -a -q --filter name=m06l04
   docker compose -p m06l04-run-a down -v
   docker compose -p m06l04-run-b down -v
   docker compose ls -a -q --filter name=m06l04
   docker image rm taskapi:m06l04
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l04-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
