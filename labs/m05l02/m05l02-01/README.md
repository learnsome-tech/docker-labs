# m05l02-01 · Bind mounts: a host path you choose

**Lesson:** [Bind Mounts, Permissions And Backups](https://learnsome.tech/learn/docker-course/m05l02) (lesson 5.2, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can bind-mount a host directory read-write or read-only, explain and fix a numeric user ID mismatch between a container and its mount, and back up and restore a named volume with a throwaway container and tar.

In the lesson: A volume lives wherever Docker decides. A bind mount is the opposite: you name an existing file or directory on the host, and Docker makes it appear at a path inside the container. Nothing is copied. The container and the host look at the same bytes, so an edit on either side is visible on the other at once. That makes bind mounts the tool for development, where you want your editor's changes inside a running container, and for handing a container one configuration file. With the volume flag, a source that starts with a dot or a slash means a host path; the mount flag says type bind explicitly. Docker never manages or cleans up a bind mount: the directory stays yours.

## Files

- [`starter/bind-mounts-a-host-path-you-choose.txt`](starter/bind-mounts-a-host-path-you-choose.txt): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/bind-mounts-a-host-path-you-choose.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m05l02-01` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
