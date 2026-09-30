# m05l01-03 · Named volumes: storage that Docker manages

**Lesson:** [Ephemeral Filesystems And Named Volumes](https://learnsome.tech/learn/docker-course/m05l01) (lesson 5.1, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can show that a container's writable layer is deleted with the container, keep the task API's data in a named volume that survives removal, and find, inspect and safely remove volumes.

In the lesson: The fix is a volume. A volume is storage that Docker creates and manages itself, in its own area on the host, with a lifecycle of its own. No container owns it, so removing a container leaves it untouched. You attach it with the volume flag, giving the volume name, a colon, and the path inside the container, or with the longer mount flag, which spells out the type, the source and the destination and reads better in scripts. One detail matters for our service. When an empty volume is mounted over a directory that already exists in the image, Docker first copies that directory's contents into the volume, ownership included. Our image created slash data and gave it to the app user, so a fresh volume arrives already writable by that user, with no extra step.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/named-volumes-storage-that-docker-manages.txt`](starter/named-volumes-storage-that-docker-manages.txt): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/named-volumes-storage-that-docker-manages.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m05l01-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
