# m06l04-02 · Run the suite once

**Lesson:** [Integration Tests, Test Data And Compose Cleanup](https://learnsome.tech/learn/docker-course/m06l04) (lesson 6.4, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can run integration tests in a container against the real stack, seed and load test data, isolate each run with its own project name, turn the result into an exit code, and clean up every container, network and volume a run created.

In the lesson: This compose file has no name key on purpose. Instead, the project name variable, exported in the shell, names this run: run a. The f flag and the project flag work too, but a variable set once covers every command in the session. Build, and start the stack with the wait flag, so the API and the database are healthy before anything tests them. Now run the test service with the run command. It starts a one off container, prints each check as it goes, and the remove flag deletes it afterwards. All four lines pass, and the exit code, echoed straight after, is zero. That single number is the whole interface between this suite and any pipeline that runs it.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/extra.sql`](starter/extra.sql)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/seed.sql`](starter/seed.sql)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/tests/smoke.sh`](starter/tests/smoke.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   export COMPOSE_PROJECT_NAME=m06l04-run-a
   docker compose build --quiet
   docker compose up -d --wait
   docker compose run --rm test; echo $?
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l04-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
