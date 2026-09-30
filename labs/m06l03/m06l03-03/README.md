# m06l03-03 · The override for the API

**Lesson:** [Development Overrides, Hot Reloading And Debuggers](https://learnsome.tech/learn/docker-course/m06l03) (lesson 6.3, module 6: Compose And Local Development) · Pro  
**Check:** Checker

## Goal

You can keep development-only settings in compose.override.yaml, predict how Compose merges files, see code changes land in a running container with compose watch, keep tools behind a profile, and expose a debugger safely.

In the lesson: The override is a fragment, not a complete service: it names the API again with no image and no build, and adds only what differs. The port is published on the loopback address, so the service is reachable on your machine only. The environment block replaces one variable and leaves the connection string from the base file alone. The develop section is for compose watch, the hot reloading feature. Each rule watches a path. The first rule is sync plus restart: when the program file changes, copy it into the container at the target path and restart the container, because this small server does not reload code by itself. A framework with its own reloader would use plain sync. The second rule rebuilds the image whenever the build file changes, because that cannot be patched in place.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.override.yaml`](starter/compose.override.yaml): the listing from the lesson
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m06l03/m06l03-03/starter`
2. Read `compose.override.yaml` the way the lesson builds it:
   - Lines 1–2: no image and no build
   - Lines 3–4: on your machine only
   - Lines 5–6: replaces one variable
   - Lines 7–11: sync plus restart
   - Lines 12–13: the build file
3. Notes from the lesson:
   - Line 9: copy the file in, then restart the container
4. Edit `compose.override.yaml` and check it: `yamllint compose.override.yaml`.
5. Check it from the repository root: `./check m06l03-03`.

## How to check

`./check m06l03-03` copies `starter/` into a scratch directory and runs `yamllint compose.override.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
