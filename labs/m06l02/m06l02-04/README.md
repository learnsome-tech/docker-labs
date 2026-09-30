# m06l02-04 · A database check and depends_on conditions

**Lesson:** [Health Checks, Dependencies And Reliable Startup](https://learnsome.tech/learn/docker-course/m06l02) (lesson 6.2, module 6: Compose And Local Development) · Pro  
**Check:** Checker

## Goal

You can reproduce a startup race, fix it with a HEALTHCHECK, a Compose healthcheck and depends_on conditions, read health status from ps and inspect, and explain why the application must still retry.

In the lesson: The API's dependencies now use the long form. It waits for the database to be service healthy, and for migrate to be service completed successfully, which means that one shot container exited with code zero. Migrate, further down, waits for the database the same way. The database's check is defined here, because we don't build that image. The readiness tool that ships with Postgres asks whether the server accepts connections, and the h option points it at the loopback address on purpose: during first time setup the temporary server listens only on a local socket, so a socket check can pass too early. Interval and timeout set the rhythm, the retry count sets how many failures mean unhealthy, and the start period is a grace window, checked every second, where failures do not count.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml): the listing from the lesson
- [`starter/race.yaml`](starter/race.yaml)
- [`starter/schema.sql`](starter/schema.sql)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m06l02/m06l02-04/starter`
2. Read `compose.yaml` the way the lesson builds it:
   - Lines 1–3: service healthy
   - Lines 4–5: completed successfully
   - Lines 6–14: The database's check
   - Lines 15–17: Interval and timeout
   - Lines 18–19: start period
3. Notes from the lesson:
   - Line 14: over the network, the way clients connect
4. Edit `compose.yaml` and check it: `yamllint compose.yaml`.
5. Check it from the repository root: `./check m06l02-04`.

## How to check

`./check m06l02-04` copies `starter/` into a scratch directory and runs `yamllint compose.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
