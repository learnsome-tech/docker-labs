# m06l02-03 · HEALTHCHECK in the build file

**Lesson:** [Health Checks, Dependencies And Reliable Startup](https://learnsome.tech/learn/docker-course/m06l02) (lesson 6.2, module 6: Compose And Local Development) · Pro  
**Check:** Checker

## Goal

You can reproduce a startup race, fix it with a HEALTHCHECK, a Compose healthcheck and depends_on conditions, read health status from ps and inspect, and explain why the application must still retry.

In the lesson: The build file has carried a health check since it was added in module three: the HEALTHCHECK instruction. Every three seconds, with a three second timeout, Docker runs this command inside the container. It fetches the health endpoint with the small web client that busybox provides in the Alpine image, so no extra package is needed. The double bar and exit one make sure a failure reports exactly one, because Docker reads zero as healthy, one as unhealthy, and reserves two. After ten failures in a row the container is marked unhealthy. The check runs as the image's user, inside the container's own network namespace, so the address is the container's loopback, not the host's. Everything a check needs must be inside the image.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/race.yaml`](starter/race.yaml)
- [`starter/schema.sql`](starter/schema.sql)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m06l02/m06l02-03/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–8: added in module three
   - Lines 9: the HEALTHCHECK instruction
   - Lines 10: runs this command
   - Lines 11: Everything a check needs
3. Notes from the lesson:
   - Line 10: exit 0 healthy, 1 unhealthy; 2 is reserved
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m06l02-03`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m06l02-03 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m06l02-03` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
