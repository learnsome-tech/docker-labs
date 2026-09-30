# m01l03-03 · Filesystem layers, counted

**Lesson:** [Union Filesystems, Images And Writable Layers](https://learnsome.tech/learn/docker-course/m01l03) (lesson 1.3, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can explain what an image is made of, read the layer history of an image you built, and predict what happens to a file a container writes when that container is removed.

In the lesson: History showed five entries, but count the filesystem layers and the answer is three. The difference is metadata: a command instruction adds a history entry and no layer, because it changes nothing on disk. That is worth knowing before the caching lesson, where the difference between an instruction that writes files and one that writes only metadata decides how much of a build gets reused. The second command asks an image for the type of the root filesystem it declares, and every image you will ever meet answers the same way: layers. That word comes from the image specification, not from a Docker implementation detail.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/note.txt`](starter/note.txt)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker image inspect layers:demo -f '{{len .RootFS.Layers}}'
   docker image inspect alpine:3.20 -f '{{.RootFS.Type}}'
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l03-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
