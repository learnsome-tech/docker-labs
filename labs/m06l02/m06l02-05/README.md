# m06l02-05 · Start in order and wait for healthy

**Lesson:** [Health Checks, Dependencies And Reliable Startup](https://learnsome.tech/learn/docker-course/m06l02) (lesson 6.2, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can reproduce a startup race, fix it with a HEALTHCHECK, a Compose healthcheck and depends_on conditions, read health status from ps and inspect, and explain why the application must still retry.

In the lesson: Build, then start with the wait flag. Compose starts the database, waits for it to report healthy, runs migrate, waits for it to exit, starts the API, and returns only when the API's own check passes. The all option on the listing includes stopped containers, which is how you see migrate: exited with code zero, job done. The Postgres client inside the database confirms the table it created is there. Health is part of each container's state, so inspect reads it directly, and the database reports healthy. The ordering is now a property of the file rather than of luck, and it holds on a slow laptop and a fast one alike.

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
   docker compose build --quiet
   docker compose up -d --wait
   docker compose ps -a --format '{{.Service}} {{.Status}}'
   docker compose exec db psql -U tasks -c '\dt'
   docker inspect -f '{{.State.Health.Status}}' m06l02-stack-db-1
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l02-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
