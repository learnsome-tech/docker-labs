# m02l04-03 · Run and publish the service

**Lesson:** [Run The Spine Service And Publish Its Port](https://learnsome.tech/learn/docker-course/m02l04) (lesson 2.4, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can run the course service from its image, publish its listening port, test it from the host, and cleanly stop the service when the test is done.

In the lesson: Run the image in detached mode and publish host port eighteen thousand and eighty to container port eight thousand. The first command returns an identifier, which is elided here. Curl then calls the health endpoint through the host, proving the entire route works: host socket, Docker forwarding, container interface and Python process. The final command asks Docker to describe the mapping in plain text. Read the arrow as traffic moving from the host port on the left to the container port on the right. Publishing is a runtime choice, so the image did not need to change when we chose a different host port.

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
   docker run -d --name taskapi-demo -p 18080:8000 taskapi:0.1
   curl -s http://localhost:18080/health
   docker ps --filter name=taskapi-demo
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l04-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
