# m04l03-02 · Compare the bases on your machine

**Lesson:** [Minimal Bases, Non Root Users And Smaller Images](https://learnsome.tech/learn/docker-course/m04l03) (lesson 4.3, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can choose a base image deliberately, find and remove the layers that make an image fat, ship a compiled program on a distroless base, and prove the service runs as an unprivileged user.

In the lesson: Put numbers on those choices. Keep a format string in a shell variable that prints just the name and the size, then ask about each base. Debian is around two hundred megabytes once unpacked. The python on Alpine image, the base our service uses, is under ninety, and most of that is the Python runtime. Plain Alpine is about thirteen, BusyBox and the distroless static image about six each. These are disk sizes after unpacking; the download is smaller, because layers travel compressed. Then count the programs in one directory: two hundred and fifty seven on Debian against one hundred and forty three on Alpine, and most of Alpine's are links to a single BusyBox binary. Every one of them is a tool an attacker could use once inside.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   F='{{.Repository}}:{{.Tag}} {{.Size}}'
   docker images --format "$F" debian:13
   docker images --format "$F" python:3.12-alpine
   docker images --format "$F" alpine:3.22
   docker images --format "$F" busybox:1.37
   docker images --format "$F" gcr.io/distroless/static-debian12
   docker run --rm debian:13 sh -c 'ls /usr/bin | wc -l'
   docker run --rm alpine:3.22 sh -c 'ls /usr/bin | wc -l'
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l03-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
