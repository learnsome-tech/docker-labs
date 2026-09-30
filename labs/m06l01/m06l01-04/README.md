# m06l01-04 · The database service and the named volumes

**Lesson:** [Define The Service And Database With Compose](https://learnsome.tech/learn/docker-course/m06l01) (lesson 6.1, module 6: Compose And Local Development) · Pro  
**Check:** Checker

## Goal

You can describe the task API and a Postgres database in one compose.yaml, check it with docker compose config, run it with up, ps, logs and exec, and take it down knowing which objects survive.

In the lesson: The database service has no build key, only an image, so Compose runs the official Postgres image unchanged. Its three environment variables are read by that image's own startup script: on first start, with an empty data directory, it creates this user, this password and this database. That is a development password, sitting in plain text, which is fine on a laptop and nowhere else. Its files live in a named volume mounted where Postgres stores its data. The top level volumes key declares both named volumes; Compose creates them on first start and prefixes them with the project name. One honest detail: this version of the task API only carries the connection string, ready for a database backed release, and still keeps tasks in its own volume. The database is real, and we will talk to it directly.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m06l01/m06l01-04/starter`
2. Read `compose.yaml` the way the lesson builds it:
   - Lines 1–2: only an image
   - Lines 3–6: three environment variables
   - Lines 7–8: where Postgres stores its data
   - Lines 9–12: declares both named volumes
3. Notes from the lesson:
   - Line 5: fine for a laptop; module seven moves it into a secret
4. Edit `compose.yaml` and check it: `yamllint compose.yaml`.
5. Check it from the repository root: `./check m06l01-04`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m06l01-04 --command=<id>`:
   - `lint` (Lint): `yamllint -d relaxed compose.yaml`
   - `strict` (Lint strictly): `yamllint compose.yaml`

## How to check

`./check m06l01-04` copies `starter/` into a scratch directory and runs `yamllint compose.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
