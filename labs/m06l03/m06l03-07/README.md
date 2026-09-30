# m06l03-07 · Debuggers: a port only your machine can reach

**Lesson:** [Development Overrides, Hot Reloading And Debuggers](https://learnsome.tech/learn/docker-course/m06l03) (lesson 6.3, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can keep development-only settings in compose.override.yaml, predict how Compose merges files, see code changes land in a running container with compose watch, keep tools behind a profile, and expose a debugger safely.

In the lesson: Debuggers are the clearest case for a file that only exists on your machine. A remote debugger for Python runs your program under a listener on a port, and your editor attaches to that port to set breakpoints and step through requests. The sketch on screen is a third file, used only when you name it with the f flag after the base file. Two addresses matter. Inside the container the listener must accept connections on all interfaces, or the published port cannot reach it. On the host, publish it on the loopback address only, because whoever reaches a debugger port can run code in your process. The debugger package belongs in a development image, never the release image, and our course builds install nothing from the network, so here we stop at the file.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.override.yaml`](starter/compose.override.yaml)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/debuggers-a-port-only-your-machine-can-reach.txt`](starter/debuggers-a-port-only-your-machine-can-reach.txt): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/debuggers-a-port-only-your-machine-can-reach.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m06l03-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
