# m06l01-03 · The API service, key by key

**Lesson:** [Define The Service And Database With Compose](https://learnsome.tech/learn/docker-course/m06l01) (lesson 6.1, module 6: Compose And Local Development) · Pro  
**Check:** Checker

## Goal

You can describe the task API and a Postgres database in one compose.yaml, check it with docker compose config, run it with up, ps, logs and exec, and take it down knowing which objects survive.

In the lesson: Read the file from the top. The name key sets the project name, and every container, network and volume Compose creates is prefixed with it. Under services, each key is a service name, and that name also becomes a host name on the project network. The API has a build key, meaning build the Dockerfile in this directory, and an image key, meaning tag the result with this name. Ports publishes host port eighteen thousand six hundred and one to container port eight thousand. Environment sets variables, and they win over the defaults baked in by the build file, so the version will read one point one. The connection string reaches the database by its service name, never localhost. Volumes mounts a named volume at slash data, and depends on says start the database first.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m06l01/m06l01-03/starter`
2. Read `compose.yaml` the way the lesson builds it:
   - Lines 1: sets the project name
   - Lines 2–4: each key is a service name
   - Lines 5–6: has a build key
   - Lines 7–8: publishes host port
   - Lines 9–11: sets variables
   - Lines 12–13: mounts a named volume
   - Lines 14–15: start the database first
3. Notes from the lesson:
   - Line 1: prefix for every container, network and volume
   - Line 11: db is the service name, resolved on the project network
4. Edit `compose.yaml` and check it: `yamllint compose.yaml`.
5. Check it from the repository root: `./check m06l01-03`.

## How to check

`./check m06l01-03` copies `starter/` into a scratch directory and runs `yamllint compose.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
