# m06l02-02 · Reproduce the startup race

**Lesson:** [Health Checks, Dependencies And Reliable Startup](https://learnsome.tech/learn/docker-course/m06l02) (lesson 6.2, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can reproduce a startup race, fix it with a HEALTHCHECK, a Compose healthcheck and depends_on conditions, read health status from ps and inspect, and explain why the application must still retry.

In the lesson: This directory adds two files to the familiar pair: a schema file that creates a tasks table, and a deliberately naive stack called race. Its migrate service runs the Postgres client once, to apply the schema, and depends on the database in the plain form, which only means start it first. The f flag picks that file instead of the default one. The run command starts a one off container for a service, starting its dependencies first. The database container starts, the client connects straight away, and the connection is refused: Postgres is still initialising. The exit code is two, the client's code for a failed connection. Nothing is wrong except timing, which is why this failure shows up on one laptop and not another. Take the race stack down.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/race.yaml`](starter/race.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/schema.sql`](starter/schema.sql)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   ls
   docker compose -f race.yaml run --rm migrate; echo $?
   docker compose -f race.yaml down -v
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l02-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
