# m07l03-06 · Prove the secret, the restart policy and the stop

**Lesson:** [Harden And Deliver The Complete Service Stack](https://learnsome.tech/learn/docker-course/m07l03) (lesson 7.3, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can deliver the service and its database as one Compose stack that runs as a non root user on a read only filesystem, with no capabilities, no privilege escalation, resource limits, health checks, a restart policy, a graceful stop and a secret file, and prove every one of those controls from a shell.

In the lesson: Now the database side. Its environment holds the user, the database name and the password file path, and only its path, never the password. Search the container's full inspect output for the password itself and you get zero matches, which is what an environment variable could never give you. The database is accepting connections, so reading the password from a file worked. Stop the service and it is gone in a fraction of a second, well inside its grace period: the last log line says shutting down, and the listing shows exit code zero. The restart policy left it stopped, because unless stopped respects a deliberate stop, while a crash would have brought it straight back. Finally, take it all down with the volumes flag, which removes the containers, the network and both volumes. Leave that flag off whenever the data should survive.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/secrets/db_password.txt`](starter/secrets/db_password.txt)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker compose exec db env | grep POSTGRES | sort
   docker inspect m07l03-stack-db-1 | grep -c change-me
   docker compose exec db pg_isready -U tasks -d tasks
   docker compose stop api
   docker compose logs api | tail -n 1
   docker compose ps -a --format '{{.Service}} {{.Status}}'
   docker compose --progress quiet down -v
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l03-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
