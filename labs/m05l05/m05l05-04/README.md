# m05l05-04 · The same password, as a variable and as a file

**Lesson:** [Environment, Secret Files And Runtime Restrictions](https://learnsome.tech/learn/docker-course/m05l05) (lesson 5.5, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can configure one image differently per run with -e and --env-file, deliver a secret as a read-only file instead of an environment variable, and run the task API with a read-only filesystem, no capabilities, no privilege escalation and resource limits.

In the lesson: Here is the difference, side by side. Start one container with a database password passed as a variable, then inspect it and search for the word password: there it is, in plain text, for anyone with access to the Docker socket. Now put the same password in a file inside a secrets directory, and keep a read only mount of that directory in a shell variable. Start a second container with the mount. Inspect it and count the matches for the password: zero. The container's configuration records only where the directory is mounted, never what is inside. The application reads the file when it needs the value, and because the mount is read only, nothing in the container can change it. Remove both containers.

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
   img=taskapi:m05l05
   docker run -d --name m05l05-env -e DB_PASSWORD=hunter2 $img
   docker inspect m05l05-env | grep PASSWORD
   mkdir secrets && printf hunter2 > secrets/db_password
   sec="-v ./secrets:/run/secrets:ro"
   docker run -d --name m05l05-file $sec $img
   docker inspect m05l05-file | grep -c hunter2
   docker exec m05l05-file cat /run/secrets/db_password; echo
   docker rm -f m05l05-env m05l05-file
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l05-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
