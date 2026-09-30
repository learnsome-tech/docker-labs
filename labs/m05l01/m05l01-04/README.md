# m05l01-04 · The same tasks, stored on a named volume

**Lesson:** [Ephemeral Filesystems And Named Volumes](https://learnsome.tech/learn/docker-course/m05l01) (lesson 5.1, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can show that a container's writable layer is deleted with the container, keep the task API's data in a named volume that survives removal, and find, inspect and safely remove volumes.

In the lesson: Same experiment, one change. Create the volume by name, which prints the name back, and set the same run variable as before. This time, mount the volume at slash data, the directory the service writes to. Post the same task, then remove the container. The volume does not notice: it was never part of the container. Start a brand new container from the same image with the same volume mounted, ask for the tasks, and the task is still there. This is the pattern for every stateful container you will ever run, from this little service to a production database. The image is disposable, the container is disposable, and the data lives in a volume with a name you chose, so that you can always find it again.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker volume create m05l01-data
   run="docker run -d --name m05l01-api -p 18501:8000"
   $run -v m05l01-data:/data taskapi:m05l01; sleep 1
   curl -sd '{"title":"ship it"}' localhost:18501/tasks; echo
   docker rm -f m05l01-api
   $run -v m05l01-data:/data taskapi:m05l01; sleep 1
   curl -s localhost:18501/tasks; echo
   docker rm -f m05l01-api
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l01-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
