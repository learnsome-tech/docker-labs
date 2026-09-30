# m01l02-02 · Every namespace the kernel offers, on one process

**Lesson:** [Namespaces And Cgroups: Isolation And Limits](https://learnsome.tech/learn/docker-course/m01l02) (lesson 1.2, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can name the kernel features that make a container, read a container's namespace identifiers and control group limits from a shell, and explain which of the two does isolation and which does resource control.

In the lesson: Every process on Linux is in a namespace of each kind, always, including the ones on your own machine right now. Ask a container to list its own namespaces and you get the full set: control group, inter process communication, mount, network, process ID, time, user and unix time sharing, which is the one that owns the host name. Then follow one of them, and the kernel gives you an identifier in square brackets. That number is the whole trick. Two processes with the same identifier share that namespace and can see each other through it. Two processes with different identifiers cannot. Isolation is not a wall. It is two processes holding different numbers.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker run --rm alpine:3.20 ls /proc/self/ns
   docker run --rm alpine:3.20 readlink /proc/self/ns/pid
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l02-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
