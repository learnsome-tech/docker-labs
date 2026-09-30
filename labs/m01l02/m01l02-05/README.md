# m01l02-05 · Control groups: the limit is a file

**Lesson:** [Namespaces And Cgroups: Isolation And Limits](https://learnsome.tech/learn/docker-course/m01l02) (lesson 1.2, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can name the kernel features that make a container, read a container's namespace identifiers and control group limits from a shell, and explain which of the two does isolation and which does resource control.

In the lesson: Control groups are just as concrete, and they live in one directory, so give that directory a short name first. Now run a container with no limits and read the memory file: it says max, meaning no limit at all, and a runaway process will happily eat the machine. Run the same image with the memory flag set to sixty four megabytes and the same file holds that number in bytes. Ask for half a processor and the processor file holds two numbers, a quota and a period: fifty thousand microseconds of processor time in every hundred thousand, which is one half. Limit the process count to twenty and the process file says twenty. Every limit you set on the command line becomes a number in a file that the kernel enforces, and you can read all of it from inside the container.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   cg=/sys/fs/cgroup
   docker run --rm alpine:3.20 cat $cg/memory.max
   docker run --rm -m 64m alpine:3.20 cat $cg/memory.max
   docker run --rm --cpus=0.5 alpine:3.20 cat $cg/cpu.max
   docker run --rm --pids-limit=20 alpine:3.20 cat $cg/pids.max
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l02-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
