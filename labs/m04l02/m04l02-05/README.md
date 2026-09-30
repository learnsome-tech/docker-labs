# m04l02-05 · Lock the registry

**Lesson:** [Authenticate, Tag, Push And Pull From A Registry](https://learnsome.tech/learn/docker-course/m04l02) (lesson 4.2, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can run a private registry, push the service to it, pull it back by tag and by digest, and log in without leaving a reusable password lying around.

In the lesson: Remove the open registry and start a locked one. The files for this step ship with the lesson: a password file holding one user, ci bot, with its secret stored as a bcrypt hash, and an environment file with three settings that switch the registry's authentication on and point it at that file. The long run options go into a shell variable only so the line fits the screen. Once it is running, the registry answers an anonymous request with four hundred and one, which is HTTP for unauthorised. Now try to push the same image. The registry refuses, and Docker says why: it has no credentials for this host. The message is long, so it is folded to fit. Nothing about the image changed; only the registry's rules did.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/auth/htpasswd`](starter/auth/htpasswd)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/registry.env`](starter/registry.env)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/token`](starter/token)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker rm -f m04l02-registry
   cat registry.env
   R="-p 18402:5000 --env-file registry.env -v ./auth:/auth"
   docker run -d --name m04l02-registry $R registry:3
   curl -s -o /dev/null -w '%{http_code}\n' localhost:18402/v2/
   docker push -q localhost:18402/taskapi:1.0.0 2>&1 | fold -sw80
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l02-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
