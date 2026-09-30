# m04l02-02 · Run a registry and push to it

**Lesson:** [Authenticate, Tag, Push And Pull From A Registry](https://learnsome.tech/learn/docker-course/m04l02) (lesson 4.2, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can run a private registry, push the service to it, pull it back by tag and by digest, and log in without leaving a reusable password lying around.

In the lesson: Build the service, then start a registry in a container, publishing its internal port five thousand on this lesson's port. A push needs a name that includes the registry, because the host part of the reference is exactly how Docker decides where to send it. So we add a tag with the local registry host and port in front of the repository. Push it. Docker uploads each layer the registry does not already have, then the manifest, and prints the digest the registry now stores. That digest is the one to record and deploy. Because the protocol is plain HTTP, you can ask the registry directly with curl: the catalog lists one repository, and the tags list shows the one version we pushed.

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
   docker build -q -t m04l02-taskapi:1.0.0 .
   docker run -d --name m04l02-registry -p 18402:5000 registry:3
   docker tag m04l02-taskapi:1.0.0 localhost:18402/taskapi:1.0.0
   docker push localhost:18402/taskapi:1.0.0
   curl -s localhost:18402/v2/_catalog
   curl -s localhost:18402/v2/taskapi/tags/list
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l02-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
