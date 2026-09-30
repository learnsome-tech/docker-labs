# m05l03-05 · Inspect a network, then clean up in order

**Lesson:** [Bridge Networks, DNS And Container Communication](https://learnsome.tech/learn/docker-course/m05l03) (lesson 5.3, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can explain why containers on the default bridge only reach each other by address, put the task API on a user-defined bridge network where other containers find it by name or alias, and show that a network is an isolation boundary.

In the lesson: Networks are objects too. List networks with a name filter and ours appears with the bridge driver and local scope, which means it exists on this one Docker host only. Inspect it and count how many containers are attached: two, the API and the client. Try to remove the network now and Docker refuses, because it still has active endpoints, meaning attached containers; the cut on screen only trims the list of those endpoints off the message. Remove the containers first, then the network goes. That order, containers before networks and volumes, is the same order Compose uses when it tears a project down, which you will see in module six.

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
   docker network ls --filter name=m05l03
   docker network inspect -f '{{len .Containers}}' m05l03-net
   docker network rm m05l03-net 2>&1 | cut -d'(' -f1
   docker rm -f m05l03-api m05l03-cli
   docker network rm m05l03-net
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l03-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
