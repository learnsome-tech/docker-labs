# m01l01-04 · One kernel underneath, different userlands on top

**Lesson:** [Why Containers: Bare Metal, Machines And Processes](https://learnsome.tech/learn/docker-course/m01l01) (lesson 1.1, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can explain what a container actually is, how it differs from a virtual machine, and why packaging the environment with the program removes a whole class of deployment failure.

In the lesson: This is the part that surprises people. The first command asks the kernel what it is, and the answer is Linux, because that is the host kernel and the container is borrowing it. The next two commands ask each container what distribution it thinks it is running. The first container calls itself Alpine Linux. The second calls itself Debian. Same kernel, two different userlands, running side by side, neither of them booting anything. A distribution is mostly a package manager, a library set and a pile of files in expected places, and that is exactly what an image gives you. Which also tells you the one hard limit: the kernel is shared, so a Linux container needs a Linux kernel underneath, wherever it is running.

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
   docker run --rm alpine:3.20 uname -o
   docker run --rm alpine:3.20 grep ^NAME= /etc/os-release
   docker run --rm debian:13 grep ^NAME= /etc/os-release
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l01-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
