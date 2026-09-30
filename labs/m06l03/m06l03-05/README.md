# m06l03-05 · A database shell behind a profile

**Lesson:** [Development Overrides, Hot Reloading And Debuggers](https://learnsome.tech/learn/docker-course/m06l03) (lesson 6.3, module 6: Compose And Local Development) · Pro  
**Check:** Checker

## Goal

You can keep development-only settings in compose.override.yaml, predict how Compose merges files, see code changes land in a running container with compose watch, keep tools behind a profile, and expose a debugger safely.

In the lesson: Further down, the override adds a second service: a database shell built from the same Postgres image, which already contains the client. The profiles key puts it in a profile called tools. A service with a profile is left out of an ordinary up, so it costs nothing day to day, and it starts only when you enable the profile or name the service in a command. The entrypoint is the Postgres client, already pointed at the database service and the tasks user, so any arguments you add on the command line become client options. And like the API, it waits for the database to be healthy before it starts.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.override.yaml`](starter/compose.override.yaml): the listing from the lesson
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m06l03/m06l03-05/starter`
2. Read `compose.override.yaml` the way the lesson builds it:
   - Lines 1–2: a second service
   - Lines 3: the profiles key
   - Lines 4: the entrypoint
   - Lines 5–9: waits for the database
3. Edit `compose.override.yaml` and check it: `yamllint compose.override.yaml`.
4. Check it from the repository root: `./check m06l03-05`.
5. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m06l03-05 --command=<id>`:
   - `lint` (Lint): `yamllint -d relaxed compose.override.yaml`
   - `strict` (Lint strictly): `yamllint compose.override.yaml`

## How to check

`./check m06l03-05` copies `starter/` into a scratch directory and runs `yamllint compose.override.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
