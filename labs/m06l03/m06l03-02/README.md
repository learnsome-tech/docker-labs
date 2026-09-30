# m06l03-02 · Two files, one merged project

**Lesson:** [Development Overrides, Hot Reloading And Debuggers](https://learnsome.tech/learn/docker-course/m06l03) (lesson 6.3, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can keep development-only settings in compose.override.yaml, predict how Compose merges files, see code changes land in a running container with compose watch, keep tools behind a profile, and expose a debugger safely.

In the lesson: Here are both files side by side. The config command prints the merged result, which makes it the tool for every question about overrides. Ask for only the base file, with the f flag, and filter for the version variable: one point one, and no ports at all, because the base file publishes nothing. In production a proxy or an orchestrator decides how traffic arrives. Now run config without the f flag, so Compose picks up the override on its own. The version variable has been replaced by dev, and a published port has appeared: host port eighteen thousand six hundred and three, bound to the loopback address only. When a merge does something you did not expect, this is the first command to run.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.override.yaml`](starter/compose.override.yaml)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   ls
   docker compose -f compose.yaml config | grep APP_VERSION
   docker compose config | grep -E 'VERSION|host_ip|published'
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m06l03-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
