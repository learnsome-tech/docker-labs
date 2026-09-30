# m03l05-01 · Exec form and shell form

**Lesson:** [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) (lesson 3.5, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

In the lesson: Three instructions take a command: run, cmd and entrypoint, and each accepts it in two forms. Exec form is a list of strings, in square brackets with double quotes. Docker starts the first string as the program and hands it the rest as arguments, with no shell involved. Shell form is a plain line of text. Docker hands it to the shell with the dash c flag, so you get shell features such as variables, and operators, and pipes, but the process Docker starts is the shell, not your program. For the command a container runs for weeks that matters, because the first process in the container is the one that receives signals, and by the end of this lesson you will see it decide between a clean exit and a kill.

## Files

- [`starter/exec-form-and-shell-form.txt`](starter/exec-form-and-shell-form.txt): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/exec-form-and-shell-form.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m03l05-01` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
