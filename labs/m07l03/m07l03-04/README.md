# m07l03-04 · The database, its secret and its volumes

**Lesson:** [Harden And Deliver The Complete Service Stack](https://learnsome.tech/learn/docker-course/m07l03) (lesson 7.3, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Checker

## Goal

You can deliver the service and its database as one Compose stack that runs as a non root user on a read only filesystem, with no capabilities, no privilege escalation, resource limits, health checks, a restart policy, a graceful stop and a secret file, and prove every one of those controls from a shell.

In the lesson: The database gets the same treatment where it can take it. Instead of a password in plain text, the official Postgres image reads its password from a file: the password file variable names the path, and the secrets line mounts the secret there. It gets no new privileges and a memory limit. It does not get every capability dropped, because its entry point starts as root and then switches to the postgres user, and that switch needs a few capabilities. The health check is the one from module six. The secrets section at the bottom points at a local file. That file sits inside the build context, so this lesson's docker ignore file excludes the secrets directory, and the password never reaches an image layer. Finally, two named volumes, one for the task data and one for the database.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml): the listing from the lesson
- [`starter/secrets/db_password.txt`](starter/secrets/db_password.txt)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m07l03/m07l03-04/starter`
2. Read `compose.yaml` the way the lesson builds it:
   - Lines 1–7: reads its password from a file
   - Lines 8–10: no new privileges and a memory limit
   - Lines 11–15: the health check
   - Lines 16–18: The secrets section
   - Lines 19–21: two named volumes
3. Notes from the lesson:
   - Line 6: the official image reads the password from this file
   - Line 18: kept out of the image by .dockerignore
4. Edit `compose.yaml` and check it: `yamllint compose.yaml`.
5. Check it from the repository root: `./check m07l03-04`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m07l03-04 --command=<id>`:
   - `lint` (Lint): `yamllint -d relaxed compose.yaml`
   - `strict` (Lint strictly): `yamllint compose.yaml`

## How to check

`./check m07l03-04` copies `starter/` into a scratch directory and runs `yamllint compose.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
