# m01l04-02 · Asking the engine about itself

**Lesson:** [Docker, OCI, The Engine And The CLI](https://learnsome.tech/learn/docker-course/m01l04) (lesson 1.4, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can describe what happens between typing a docker command and a container running, name the three OCI specifications, and explain why removing Docker from Kubernetes did not break your images.

In the lesson: You can interrogate all of that from the same client. The first command asks which endpoint the client is talking to, and the answer is a context name, not a machine: contexts are how one command line tool drives several daemons. The second asks what the server is, and notice it says Linux even though this laptop runs something else, because the daemon lives inside a small Linux virtual machine. The third asks which runtime it hands work to, and gets runc. The fourth asks for the storage driver and the control group version. Those two answers explain a great deal of behaviour later: overlay filesystems are where layers come from, and control group version two is where the limits from the last lesson live.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker version -f '{{.Client.Context}}'
   docker version -f '{{.Server.Os}}/{{.Server.Arch}}'
   docker info -f '{{.DefaultRuntime}}'
   docker info -f '{{.Driver}} {{.CgroupVersion}}'
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l04-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
