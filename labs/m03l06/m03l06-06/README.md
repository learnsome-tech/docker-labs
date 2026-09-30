# m03l06-06 · Proving where the token went

**Lesson:** [Multi Stage Builds, Targets And Build Secrets](https://learnsome.tech/learn/docker-course/m03l06) (lesson 3.6, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can split a build into stages so the toolchain never ships, build a single stage on purpose with a target, pass a secret to one build step without it reaching the image, history or logs, and read the task API's finished Dockerfile line by line.

In the lesson: Now prove it. The status file shows the step saw the token during the build. Search the untruncated history of the build argument image and count the lines that mention the token: two, the argument itself and the run step that used it. Anyone who can pull that image can read them. Do the same for the secret mount image and the count is zero. Finally, look for the secrets directory inside a container from that image, and it does not exist at all: the mount lived for one run step and left nothing behind. Deleting a secret file in a later instruction does not help, because the layer that added it still carries it, as you learned in the first module.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/leak/Dockerfile`](starter/leak/Dockerfile)
- [`starter/main.go`](starter/main.go)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/safe/Dockerfile`](starter/safe/Dockerfile)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker run --rm m03l06-safe cat /status.txt
   docker history --no-trunc m03l06-leak | grep -c s3cret
   docker history --no-trunc m03l06-safe | grep -c s3cret
   docker run --rm m03l06-safe ls /run/secrets
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l06-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l06) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
