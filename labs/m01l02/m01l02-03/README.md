# m01l02-03 · Sharing a namespace with the host, on purpose

**Lesson:** [Namespaces And Cgroups: Isolation And Limits](https://learnsome.tech/learn/docker-course/m01l02) (lesson 1.2, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can name the kernel features that make a container, read a container's namespace identifiers and control group limits from a shell, and explain which of the two does isolation and which does resource control.

In the lesson: Because the isolation is a flag and not a wall, you can turn it off one namespace at a time, which is the clearest way to see what each one does. The first container gets its own process namespace, so it sees one process, itself. The second gets the same image and the same command, but we hand it the host process namespace, and suddenly it can see the machine: process one is the host's init, then the kernel threads. Nothing about the image changed. Only one number did. The third borrows the host name namespace, so instead of a random identifier it reports the real host name of the machine underneath. Monitoring agents are run exactly like this, on purpose.

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
   docker run --rm alpine:3.20 ps -o comm
   docker run --rm --pid=host alpine:3.20 ps -o comm|sed -n 2,4p
   docker run --rm --uts=host alpine:3.20 hostname
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l02-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
