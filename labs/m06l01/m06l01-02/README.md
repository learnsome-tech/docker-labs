# m06l01-02 · What the project directory holds

**Lesson:** [Define The Service And Database With Compose](https://learnsome.tech/learn/docker-course/m06l01) (lesson 6.1, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can describe the task API and a Postgres database in one compose.yaml, check it with docker compose config, run it with up, ps, logs and exec, and take it down knowing which objects survive.

In the lesson: The lesson's directory holds two files you know and one you have not seen yet. The build file and the program are exactly where module three left them. The new file is the compose file. Before starting anything, ask Compose what it understood. The config command parses the file, fills in defaults and validates it, so a typo shows up here rather than halfway through a start. With the services option it lists the two services in the order they will start: the database first, because the API depends on it. With the images option it lists what each one runs: the official Postgres sixteen image on Alpine, used exactly as published, and our own task API image, which Compose will build and tag with the lesson's name so it cannot collide with earlier builds.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   ls
   docker compose config --services
   docker compose config --images | sort
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l01-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
