# m05l02-07 · Back up, lose and restore a volume

**Lesson:** [Bind Mounts, Permissions And Backups](https://learnsome.tech/learn/docker-course/m05l02) (lesson 5.2, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can bind-mount a host directory read-write or read-only, explain and fix a numeric user ID mismatch between a container and its mount, and back up and restore a named volume with a throwaway container and tar.

In the lesson: Let's use it for real. Run the service on a named volume and post a task. Then stop writing before you copy: remove the container, and only then run the backup. The verbose tar output lists what went in, the directory and the tasks file, and the archive sits in the backup folder on the host. Now simulate the disaster: delete the volume, then restore it. Docker creates a fresh volume with the same name for the restore container, and tar unpacks into it. Start the service on it and post one more task. The reply shows the old task plus the new one, which proves two things at once: the data came back, and so did the ownership, because tar recorded and restored the numeric owner, ten thousand and one.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/vol.sh`](starter/vol.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   run="docker run -d --name m05l02-api -p 18502:8000"
   $run -v m05l02-data:/data taskapi:m05l02; sleep 1
   curl -sd '{"title":"keep me"}' localhost:18502/tasks; echo
   docker rm -f m05l02-api && sh vol.sh backup m05l02-data
   ls backup
   docker volume rm m05l02-data && sh vol.sh restore m05l02-data
   $run -v m05l02-data:/data taskapi:m05l02; sleep 1
   curl -sd '{"title":"again"}' localhost:18502/tasks; echo
   docker rm -f m05l02-api && docker volume rm m05l02-data
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l02-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
