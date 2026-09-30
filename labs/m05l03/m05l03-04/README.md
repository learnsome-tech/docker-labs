# m05l03-04 · How Docker's embedded DNS answers

**Lesson:** [Bridge Networks, DNS And Container Communication](https://learnsome.tech/learn/docker-course/m05l03) (lesson 5.3, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can explain why containers on the default bridge only reach each other by address, put the task API on a user-defined bridge network where other containers find it by name or alias, and show that a network is an isolation boundary.

In the lesson: Here is what that resolver does. Every container on a user-defined network gets the embedded DNS server as its resolver. It is served by the Docker engine itself, and it answers for container names and aliases, but only for containers on a network the asking container shares. Any other name, a registry or a public website, is forwarded to the DNS servers the host uses. Aliases are more useful than they look. Several containers can carry the same alias on one network, and a lookup returns all of their addresses, which gives you crude load spreading and lets you replace one container with another without changing any client. In practice you set the alias when you start the container, with the network alias flag, as the screen shows, rather than connecting afterwards.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/how-docker-s-embedded-dns-answers.txt`](starter/how-docker-s-embedded-dns-answers.txt): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/how-docker-s-embedded-dns-answers.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m05l03-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
