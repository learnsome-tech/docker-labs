# m03l04-03 · Reading the settings back out of the image

**Lesson:** [ARG, ENV, LABEL, EXPOSE And VOLUME](https://learnsome.tech/learn/docker-course/m03l04) (lesson 3.4, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can decide whether a setting belongs to build time or run time, parameterise a build with ARG, bake runtime defaults in with ENV, describe an image with OCI labels, and explain what EXPOSE and VOLUME really do when a container starts.

In the lesson: Everything you just declared lives in the image configuration, and inspect reads it back. The labels come out as a small object in curly braces, with the version the build argument supplied. The exposed port is recorded as eight thousand over the transmission control protocol, the default. Now search the history for arg lines, and notice what it kept: the version value you passed on the command line, in plain text, with zero bytes of layer. Remember that for the pitfalls. Next, ask a container for the python tag argument and it prints nothing, because an argument never reaches run time. Finally, the environment flag on docker run overrides an env default without rebuilding: set the port to nine thousand and the container sees nine thousand. That is the division of labour: env sets a sensible default, and whoever runs the container gets the last word.

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
   docker image inspect -f '{{json .Config.Labels}}' m03l04-api
   docker image inspect -f '{{.Config.ExposedPorts}}' m03l04-api
   docker history m03l04-api | grep ARG
   docker run --rm m03l04-api printenv PYTHON_TAG
   docker run --rm -e PORT=9000 m03l04-api printenv PORT
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l04-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
