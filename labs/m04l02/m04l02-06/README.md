# m04l02-06 · Log in, push, and find where the secret went

**Lesson:** [Authenticate, Tag, Push And Pull From A Registry](https://learnsome.tech/learn/docker-course/m04l02) (lesson 4.2, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can run a private registry, push the service to it, pull it back by tag and by digest, and log in without leaving a reusable password lying around.

In the lesson: Point the client at a throwaway client configuration directory, so this demonstration cannot disturb your real one. Log in, reading the token from a file on standard input rather than typing it into the command. Then look at the file the client wrote. The host is listed, but its entry is empty, and a credential store setting appeared: on this Mac the client found the keychain helper and handed the secret to it. On a Linux server without a helper, that empty entry would instead hold the secret in base sixty four, and login would warn you about it. With credentials in place the push succeeds. Log out, which erases the secret from the store, then clean up: remove the registry, the local tag and the throwaway directory.

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
   export DOCKER_CONFIG=/tmp/m04l02-client
   docker login localhost:18402 -u ci-bot --password-stdin <token
   jq . $DOCKER_CONFIG/config.json
   docker push -q localhost:18402/taskapi:1.0.0
   docker logout localhost:18402
   docker rm -f m04l02-registry
   docker rmi localhost:18402/taskapi:1.0.0
   rm -rf $DOCKER_CONFIG
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l02-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
