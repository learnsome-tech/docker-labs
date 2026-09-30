# m05l03-03 · A user-defined network adds names and a boundary

**Lesson:** [Bridge Networks, DNS And Container Communication](https://learnsome.tech/learn/docker-course/m05l03) (lesson 5.3, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can explain why containers on the default bridge only reach each other by address, put the task API on a user-defined bridge network where other containers find it by name or alias, and show that a network is an isolation boundary.

In the lesson: Create a network by name; the bridge driver is the default. Then take the API off the default bridge, so the new network is its only way in, and connect it to the new network with an extra name, tasks, called a network alias. Next, a client container: an alpine shell, detached, with a terminal attached so it stays up. It starts on the default bridge, and it cannot resolve the API, because it is not on that network. Connect the client, while it runs, and ask again: the container name now answers, and so does the alias. Both come from the same place. Look at which resolver the client uses: one hundred and twenty seven point zero point zero point eleven, the address of Docker's embedded name server, which appeared the moment the client joined a user-defined network.

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
   docker network create m05l03-net
   docker network disconnect bridge m05l03-api
   docker network connect --alias tasks m05l03-net m05l03-api
   docker run -dit --name m05l03-cli alpine:3.20
   docker exec m05l03-cli ping -c1 -W1 m05l03-api
   docker network connect m05l03-net m05l03-cli
   docker exec m05l03-cli wget -qO- m05l03-api:8000/health; echo
   docker exec m05l03-cli wget -qO- tasks:8000/health; echo
   docker exec m05l03-cli grep nameserver /etc/resolv.conf
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l03-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
