# m07l02-02 · Build and push one image for one commit

**Lesson:** [Build, Test And Promote The Same Image In CI](https://learnsome.tech/learn/docker-course/m07l02) (lesson 7.2, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can build one image per commit, test that exact image, push it, and promote it to staging and production by pointing tags at the same digest, both by hand against a local registry and as a CI workflow with a build cache.

In the lesson: Here is the pipeline's first job, done by hand. Start a registry on this lesson's port, eighteen thousand seven hundred and two, to stand in for the one your team uses. Keep the repository name in a variable. A real pipeline hands you the commit hash; here we set a short one ourselves. Build with the quiet flag, and the only output is the image identifier. The tag is the commit, never latest, so the tag means exactly one build. Push it, and the quiet flag prints just the reference. Then ask for the repository digest. That long hash after the at sign is the image's content address in the registry. Everything from here on can refer to it, because a tag can be moved to other content and a digest cannot.

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
   docker run -d --name m07l02-reg -p 18702:5000 registry:3
   reg=localhost:18702/taskapi
   sha=4d7c1e9
   docker build -q -t $reg:$sha .
   docker push -q $reg:$sha
   docker inspect -f '{{index .RepoDigests 0}}' $reg:$sha
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l02-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
