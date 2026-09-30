# m04l02-07 · Signing in to Docker Hub from a terminal

**Lesson:** [Authenticate, Tag, Push And Pull From A Registry](https://learnsome.tech/learn/docker-course/m04l02) (lesson 4.2, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can run a private registry, push the service to it, pull it back by tag and by digest, and log in without leaving a reusable password lying around.

In the lesson: This transcript is a real Docker Hub sign in started on the course machine, which has no Hub account, so it stops at the waiting line and the verifier cannot replay it. With no arguments, the login command targets Docker Hub and uses a device code flow: it prints a one time code, you confirm that code in a browser where you are already signed in, and the client receives a token. Your password never passes through the terminal. For automation there is no browser, so a pipeline logs in with a user name and an access token read from standard input, exactly as you did against the local registry. Signing in also lifts you out of the tighter rate limits Docker Hub applies to anonymous pulls.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/auth/htpasswd`](starter/auth/htpasswd)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/registry.env`](starter/registry.env)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/token`](starter/token)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker login
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m04l02-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
