# m05l03-02 · The default bridge knows addresses, not names

**Lesson:** [Bridge Networks, DNS And Container Communication](https://learnsome.tech/learn/docker-course/m05l03) (lesson 5.3, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can explain why containers on the default bridge only reach each other by address, put the task API on a user-defined bridge network where other containers find it by name or alias, and show that a network is an isolation boundary.

In the lesson: Build the image and start the API with no network option and no published port. Inspect which network it joined: bridge, the default. Now start a throwaway alpine container, also on the default bridge, and try to reach the API by its name. Bad address: nothing on the default bridge answers questions about names. So ask the container for its address instead, a private address that Docker handed out, and fetch the health endpoint by address. That works, on container port eight thousand, with nothing published. So the default bridge does connect containers, but only by addresses, which are assigned at start and can change every time a container is recreated. Hard coding one into a configuration file is a bug waiting for the next restart.

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
   docker build -q -t taskapi:m05l03 . >/dev/null
   docker run -d --name m05l03-api taskapi:m05l03
   docker inspect -f '{{.HostConfig.NetworkMode}}' m05l03-api
   docker run --rm alpine:3.20 ping -c1 -W1 m05l03-api
   ip=$(docker exec m05l03-api hostname -i); echo $ip
   docker run --rm alpine:3.20 wget -qO- $ip:8000/health; echo
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l03-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
