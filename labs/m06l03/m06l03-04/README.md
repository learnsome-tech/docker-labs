# m06l03-04 · Start the dev stack and edit code live

**Lesson:** [Development Overrides, Hot Reloading And Debuggers](https://learnsome.tech/learn/docker-course/m06l03) (lesson 6.3, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can keep development-only settings in compose.override.yaml, predict how Compose merges files, see code changes land in a running container with compose watch, keep tools behind a profile, and expose a debugger safely.

In the lesson: Build and start with the override. Normally you would now run compose watch in a second terminal and leave it there. In a single shell we run it in the background, with the no up option because the stack is already running, and keep its output in a log file. Give it a moment to start. Now edit the program: the stream editor changes the status text, keeping a backup copy. Give it a few seconds, then call the health endpoint. The new text is being served, and the version still says dev. You rebuilt nothing and ran no Docker command. The watch log tells the story: one change detected, the file synced, the container restarted. Finally, stop the watcher.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.override.yaml`](starter/compose.override.yaml)
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
   docker compose build --quiet
   docker compose up -d --wait
   docker compose watch --no-up </dev/null >watch.log 2>&1 &
   sleep 3
   sed -i.bak 's/"ok"/"ok, live"/' app.py
   sleep 6
   curl -s localhost:18603/health -w '\n'
   cat watch.log
   kill $!
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l03-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
