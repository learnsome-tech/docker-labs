# m01l04-04 · An image declares what it is built for

**Lesson:** [Docker, OCI, The Engine And The CLI](https://learnsome.tech/learn/docker-course/m01l04) (lesson 1.4, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can describe what happens between typing a docker command and a container running, name the three OCI specifications, and explain why removing Docker from Kubernetes did not break your images.

In the lesson: The configuration the specification talks about is readable. Ask any image which operating system and which processor family it was built for, and it tells you: Linux, and in this case the sixty four bit arm architecture, because that is the machine I am recording on. An image built for one architecture will not run on another, which is what image lists and multi platform builds exist to solve, and we will come back to that when we push images to a registry. Ask the same image for the default command and it reports a shell. That field is what runs when you give docker run no command of your own, and it is set by the build file instruction we will meet in module three.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker inspect alpine:3.20 -f '{{.Os}} {{.Architecture}}'
   docker inspect alpine:3.20 -f '{{.Config.Cmd}}'
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l04-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
