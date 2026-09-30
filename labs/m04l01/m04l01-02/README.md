# m04l01-02 · One build, three tags

**Lesson:** [Tags, Digests And Reproducible Image References](https://learnsome.tech/learn/docker-course/m04l01) (lesson 4.1, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can read every part of an image reference, give one build several meaningful tags, and pin an image by digest so that every machine runs exactly the same bytes.

In the lesson: Build the service from its canonical Dockerfile and tag it with a full version number. Then add two more tags to the same image: one for the minor version and one for the major version. This is the usual semantic versioning scheme. The full version is never reused, while the shorter tags move forward with every compatible release, so a user can choose how much change they are willing to accept. List the repository and look at the identifier column: all three rows share it, because a tag is only a name pointing at an image. Tagging copied nothing and cost nothing. When you ask the image itself for its tags, it reports all three. Many teams add a fourth tag holding the source commit, so any running container can be traced back to the exact code that built it.

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
   docker build -q -t m04l01-taskapi:1.0.0 .
   docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1.0
   docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1
   docker image ls m04l01-taskapi
   docker image inspect -f '{{json .RepoTags}}' m04l01-taskapi:1
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l01-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
