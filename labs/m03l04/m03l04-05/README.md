# m03l04-05 · EXPOSE documents a port; publishing opens it

**Lesson:** [ARG, ENV, LABEL, EXPOSE And VOLUME](https://learnsome.tech/learn/docker-course/m03l04) (lesson 3.4, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can decide whether a setting belongs to build time or run time, parameterise a build with ARG, bake runtime defaults in with ENV, describe an image with OCI labels, and explain what EXPOSE and VOLUME really do when a container starts.

In the lesson: The expose line has a misleading name, because it does not expose anything. It is documentation from whoever built the image to whoever runs it: this program listens on port eight thousand. Nothing is reachable from the host until you publish it at run time. So run the image in the background and publish it, mapping host port eighteen thousand three hundred and four to the container's port eight thousand. Give the server a second to start, then ask for its health, and the answer carries the version our build argument set. The port command lists which ports are actually published, once for each address family. There is also a capital P flag that publishes every exposed port on random high ports, which is the one place expose changes behaviour. Then remove the container.

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
   docker run -d --name m03l04-web -p 18304:8000 m03l04-api
   sleep 1; curl -s localhost:18304/health; echo
   docker port m03l04-web
   docker rm -f m03l04-web
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l04-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
