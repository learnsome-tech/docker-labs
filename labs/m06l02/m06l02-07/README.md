# m06l02-07 · Readiness is also the application's job

**Lesson:** [Health Checks, Dependencies And Reliable Startup](https://learnsome.tech/learn/docker-course/m06l02) (lesson 6.2, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can reproduce a startup race, fix it with a HEALTHCHECK, a Compose healthcheck and depends_on conditions, read health status from ps and inspect, and explain why the application must still retry.

In the lesson: Health checks and conditions fix the start. They do nothing when the database restarts an hour later, or when the service runs somewhere without Compose. So a service that talks to a database should also retry on its own. The sketch on screen tries a network connection, waits a little longer after each failure, never more than ten seconds, and gives up after eight attempts with a clear message and a non zero exit. Giving up matters as much as retrying: a process that exits can be restarted by a policy or rescheduled by an orchestrator, while a process that hangs forever only looks alive. Use both layers: health checks for ordering, retries for everything after.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/race.yaml`](starter/race.yaml)
- [`starter/readiness-is-also-the-application-s-job.txt`](starter/readiness-is-also-the-application-s-job.txt): the listing from the lesson
- [`starter/schema.sql`](starter/schema.sql)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/readiness-is-also-the-application-s-job.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m06l02-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
