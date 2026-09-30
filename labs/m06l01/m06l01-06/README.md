# m06l01-06 · What Compose created for you

**Lesson:** [Define The Service And Database With Compose](https://learnsome.tech/learn/docker-course/m06l01) (lesson 6.1, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can describe the task API and a Postgres database in one compose.yaml, check it with docker compose config, run it with up, ps, logs and exec, and take it down knowing which objects survive.

In the lesson: Compose created more than two containers. The exec command runs a program inside a running service. Ask the API container to resolve the database service's name, and it answers with a private address: the project has its own network, with the same built in name resolution you set up by hand in module five. Run the Postgres client inside the database container, and it connects as the user the environment variables created. List networks filtered by the project name: one network, the project name plus underscore default, on the bridge driver. List volumes the same way: both named volumes, prefixed by the project. Each of those objects carries labels naming its project and service, which is how Compose finds them again on the next command.

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
   docker compose exec api getent hosts db
   docker compose exec db psql -U tasks -tAc 'select user'
   docker network ls --filter name=m06l01-stack
   docker volume ls --filter name=m06l01-stack
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l01-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
