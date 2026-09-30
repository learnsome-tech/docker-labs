# m02l04-04 · Stop the service and check the record

**Lesson:** [Run The Spine Service And Publish Its Port](https://learnsome.tech/learn/docker-course/m02l04) (lesson 2.4, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can run the course service from its image, publish its listening port, test it from the host, and cleanly stop the service when the test is done.

In the lesson: Read the service log and you should see the health request recorded with a successful response. Stop the container, then list all containers and read its exited status. Stopping is a clean application event, not a deletion. The image is still tagged, the container record still exists, and the log is still available for diagnosis. This is the useful middle state during development: the service is not consuming resources, but its last run remains inspectable. When you are done with the experiment, remove the container and leave the image ready for the next lesson.

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
   docker logs taskapi-demo
   docker stop taskapi-demo
   docker ps -a --filter name=taskapi-demo
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l04-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
