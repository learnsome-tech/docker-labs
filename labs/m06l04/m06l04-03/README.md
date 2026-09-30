# m06l04-03 · Seed data and a test service

**Lesson:** [Integration Tests, Test Data And Compose Cleanup](https://learnsome.tech/learn/docker-course/m06l04) (lesson 6.4, module 6: Compose And Local Development) · Pro  
**Check:** Checker

## Goal

You can run integration tests in a container against the real stack, seed and load test data, isolate each run with its own project name, turn the result into an exit code, and clean up every container, network and volume a run created.

In the lesson: Two parts of the file make that work. The database mounts the seed file into the image's init directory. The Postgres image runs every script there, but only on a first start with an empty data directory, which is exactly when a test run begins. And because those scripts run while the temporary socket only server is up, the network health check from the last lesson turns healthy only after the seed has loaded. The test service reuses the Postgres image, because it already has a shell, the database client and a small web client. It sits in a profile called test, so a normal up never starts it. It reaches the API and the database by their service names, mounts the tests read only, and starts once the API is healthy.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml): the listing from the lesson
- [`starter/extra.sql`](starter/extra.sql)
- [`starter/seed.sql`](starter/seed.sql)
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/tests/smoke.sh`](starter/tests/smoke.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m06l04/m06l04-03/starter`
2. Read `compose.yaml` the way the lesson builds it:
   - Lines 1–2: the seed file
   - Lines 3–7: only after the seed
   - Lines 8–11: a profile called test
   - Lines 12–15: service names
   - Lines 16–17: read only
   - Lines 18–20: the API is healthy
3. Notes from the lesson:
   - Line 2: runs once, only when the data directory is empty
4. Edit `compose.yaml` and check it: `yamllint compose.yaml`.
5. Check it from the repository root: `./check m06l04-03`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m06l04-03 --command=<id>`:
   - `lint` (Lint): `yamllint -d relaxed compose.yaml`
   - `strict` (Lint strictly): `yamllint compose.yaml`

## How to check

`./check m06l04-03` copies `starter/` into a scratch directory and runs `yamllint compose.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
