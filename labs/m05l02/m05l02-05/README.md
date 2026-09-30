# m05l02-05 · A permission mismatch you can reproduce anywhere

**Lesson:** [Bind Mounts, Permissions And Backups](https://learnsome.tech/learn/docker-course/m05l02) (lesson 5.2, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can bind-mount a host directory read-write or read-only, explain and fix a numeric user ID mismatch between a container and its mount, and back up and restore a named volume with a throwaway container and tar.

In the lesson: You can see the same mismatch on any machine with volumes, because a volume starts with whatever owner the image gives its mount point. Ask the image who the service runs as: user and group ten thousand and one, named app. Mount a fresh volume at slash data and check the owner's number: ten thousand and one, seeded from the image, which prepared that directory. Now mount another fresh volume at slash out, a path the image never prepared, so Docker creates it for root. The touch fails with permission denied, and the owner is zero, which is root. The fix is to run one container as root, once, with the user flag set to zero, and hand the directory to ten thousand and one. After that, the same touch works as the app user. Clean up both volumes.

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
   img=taskapi:m05l02
   docker run --rm $img id
   docker run --rm -v m05l02-seed:/data $img stat -c %u /data
   docker run --rm -v m05l02-new:/out $img touch /out/x
   docker run --rm -v m05l02-new:/out $img stat -c %u /out
   docker run --rm -u 0 -v m05l02-new:/out $img chown 10001 /out
   docker run --rm -v m05l02-new:/out $img touch /out/x
   docker volume rm m05l02-seed m05l02-new
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l02-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
