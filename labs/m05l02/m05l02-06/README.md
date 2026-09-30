# m05l02-06 · A backup script that works for any volume

**Lesson:** [Bind Mounts, Permissions And Backups](https://learnsome.tech/learn/docker-course/m05l02) (lesson 5.2, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can bind-mount a host directory read-write or read-only, explain and fix a numeric user ID mismatch between a container and its mount, and back up and restore a named volume with a throwaway container and tar.

In the lesson: Now backups. A volume has no export button, and on Docker Desktop you cannot even reach its directory from your laptop, so the portable method is a throwaway container that mounts two things: the volume, and a host folder to hold the archive. This small script does exactly that. It takes two arguments, a mode and a volume name, and makes a backup folder. The backup branch mounts the volume read only, because a backup must never change what it copies, mounts the backup folder, and runs tar inside a stock alpine container to compress everything under slash data. Restore runs the same container the other way round, unpacking the archive into the volume.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/vol.sh`](starter/vol.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/vol.sh` alongside the lesson.
2. Follow it the way the lesson builds it:
   - Lines 1–6: two arguments
   - Lines 7–9: The backup branch
   - Lines 10–13: Restore runs the same container
3. Notes from the lesson:
   - Line 8: volume read-only, host folder read-write
   - Line 9: c creates, z compresses, v lists each file, -C /data . archives from there
   - Line 12: x extracts into the volume; run as root, tar restores numeric owners

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m05l02-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
