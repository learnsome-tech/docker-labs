# m03l01-03 · A real project directory is never this tidy

**Lesson:** [Build Context, Dockerignore And Your First Dockerfile](https://learnsome.tech/learn/docker-course/m03l01) (lesson 3.1, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can write a four line Dockerfile for the task API, say exactly which files a build can read, keep secrets and junk out of the build context with a .dockerignore file, and choose the Dockerfile and the context independently.

In the lesson: Real projects are rarely this tidy. Add a virtual environment folder, a dot env file holding a secret, and a scratch folder with thirty megabytes of random data. None of it belongs in an image. Now switch the build to plain progress output, rebuild, and keep only the lines about transferring context. The first is the ignore file, which does not exist yet. The second is the build context, and it is tiny. That is BuildKit being lazy in a good way: it works out which files the instructions ask for and requests only those, so the scratch data never moved. The older builder packed up the whole directory before the first instruction ran, which is where the warnings about huge contexts come from.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   mkdir -p .venv tmp && touch .venv/pyvenv.cfg
   echo 'API_TOKEN=s3cr3t' > .env
   head -c 30000000 /dev/urandom > tmp/cache.bin
   export BUILDKIT_PROGRESS=plain
   docker build -t m03l01-api:0.1 . 2>&1 | grep -o 'context: .*'
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l01-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
