# m05l05-02 · Override the image's defaults at run time

**Lesson:** [Environment, Secret Files And Runtime Restrictions](https://learnsome.tech/learn/docker-course/m05l05) (lesson 5.5, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can configure one image differently per run with -e and --env-file, deliver a secret as a read-only file instead of an environment variable, and run the task API with a read-only filesystem, no capabilities, no privilege escalation and resource limits.

In the lesson: Build the image and ask a container for two variables with no options at all: the defaults, version one point zero point zero and port eight thousand. Set the version with the environment flag and that container sees one point one point zero, while the image is untouched. Now write an environment file with two lines and load it: the port becomes nine thousand. One trap is worth seeing live. Append a line that sets the version in double quotes, the way you would in a shell script, and load the file again. The quotes arrive as part of the value. Docker's environment file is not a shell script: it takes everything after the equals sign literally, so a quoted password silently gains two extra characters and stops matching.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker build -q -t taskapi:m05l05 . >/dev/null
   img=taskapi:m05l05
   docker run --rm $img printenv APP_VERSION PORT
   docker run --rm -e APP_VERSION=1.1.0 $img printenv APP_VERSION
   printf 'APP_VERSION=2.0.0\nPORT=9000\n' > app.env
   docker run --rm --env-file app.env $img printenv PORT
   echo 'APP_VERSION="3.0.0"' >> app.env
   docker run --rm --env-file app.env $img printenv APP_VERSION
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l05-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
