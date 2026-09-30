# m05l02-02 · The service writes straight into your folder

**Lesson:** [Bind Mounts, Permissions And Backups](https://learnsome.tech/learn/docker-course/m05l02) (lesson 5.2, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can bind-mount a host directory read-write or read-only, explain and fix a numeric user ID mismatch between a container and its mount, and back up and restore a named volume with a throwaway container and tar.

In the lesson: Here is the service writing straight into your project folder. Build the image, make a data directory next to it, and set the same run variable as last time, now on port eighteen thousand five hundred and two. Then mount the directory over slash data: the volume flag, dot slash data, a colon, slash data. Post a task. Now read the file on the host with an ordinary cat command. The task is already there, because the container wrote into your directory, not into its writable layer. Remove the container and the file stays, since it was never the container's. One honest note: this worked on Docker Desktop with no permission step at all. On a Linux host the same command can fail, and you will see why shortly.

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
   docker build -q -t taskapi:m05l02 . >/dev/null
   mkdir data
   run="docker run -d --name m05l02-api -p 18502:8000"
   $run -v ./data:/data taskapi:m05l02; sleep 1
   curl -sd '{"title":"on disk"}' localhost:18502/tasks; echo
   cat data/tasks.json; echo
   docker rm -f m05l02-api
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l02-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
