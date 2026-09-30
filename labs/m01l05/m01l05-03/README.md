# m01l05-03 · Both halves have to answer

**Lesson:** [Install Docker And Verify Your Environment](https://learnsome.tech/learn/docker-course/m01l05) (lesson 1.5, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can install the right Docker for your operating system, prove the daemon is reachable from your shell, and know which post-install steps decide whether you type sudo for the rest of your career.

In the lesson: Now the check that actually matters. Ask for the version, and read the shape of the answer rather than the numbers. There is a client section and a server section. If you only get the client section, with a message about the daemon not responding, then the tool is installed and the service is not running, or your user is not allowed to reach the socket. That one distinction will save you an hour. Notice the server reports Linux, whatever the machine on your desk is. The second command checks the compose plugin, which ships with Desktop and is a separate package on Linux, and which module six is built on. Both answers here are trimmed on screen, and the dots mean lines were cut.

## Files

- [`starter/install-docker.sh`](starter/install-docker.sh)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker version
   docker compose version
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l05-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
