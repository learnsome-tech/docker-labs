# m07l02-03 · Test the exact image you pushed

**Lesson:** [Build, Test And Promote The Same Image In CI](https://learnsome.tech/learn/docker-course/m07l02) (lesson 7.2, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can build one image per commit, test that exact image, push it, and promote it to staging and production by pointing tags at the same digest, both by hand against a local registry and as a CI workflow with a build cache.

In the lesson: Now the test job. It runs the image by the exact reference that was pushed, not by a name that might resolve to something newer. Give the container a few seconds, then ask Docker for its health status: healthy, which means the health check written into the image in module three has passed. Then call the service from inside the container, where its port is reachable without publishing anything. The health endpoint answers with status ok and the version, and the task list is empty, as it should be in a fresh container. In a real pipeline these checks live in a script, and any non zero exit code fails the job before a single environment tag moves. For a stronger guarantee, the test job runs the image by digest rather than by tag, so nothing pushed between the build and the test can slip in.

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
   img=localhost:18702/taskapi:4d7c1e9
   docker run -d --name m07l02-test $img
   sleep 4
   docker inspect -f '{{.State.Health.Status}}' m07l02-test
   docker exec m07l02-test wget -qO- 127.0.0.1:8000/health; echo
   docker exec m07l02-test wget -qO- 127.0.0.1:8000/tasks; echo
   docker rm -f m07l02-test
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l02-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
