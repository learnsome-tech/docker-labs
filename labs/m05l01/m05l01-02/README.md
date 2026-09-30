# m05l01-02 · Data that dies with its container

**Lesson:** [Ephemeral Filesystems And Named Volumes](https://learnsome.tech/learn/docker-course/m05l01) (lesson 5.1, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can show that a container's writable layer is deleted with the container, keep the task API's data in a named volume that survives removal, and find, inspect and safely remove volumes.

In the lesson: Let's prove it with the real service. First build the image from the shipped build context, tagged with the lesson's name so it cannot collide with anything else on the machine. The run command is long and we will type it twice, so keep the fixed part in a shell variable called run: detached, named, and publishing host port eighteen thousand five hundred and one. Start the service, give it a second to listen, then post a task. The reply shows one task stored. Now remove the container, exactly as you would to upgrade it, and start a fresh container from the same image. Ask for the tasks again, and the list is empty. Nothing crashed and nothing was corrupted: the file lived in the old container's writable layer, and that layer went away with it.

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
   docker build -q -t taskapi:m05l01 . >/dev/null
   run="docker run -d --name m05l01-api -p 18501:8000"
   $run taskapi:m05l01; sleep 1
   curl -sd '{"title":"ship it"}' localhost:18501/tasks; echo
   docker rm -f m05l01-api
   $run taskapi:m05l01; sleep 1
   curl -s localhost:18501/tasks; echo
   docker rm -f m05l01-api
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l01-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
