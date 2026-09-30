# m04l01-01 · Reading an image reference

**Lesson:** [Tags, Digests And Reproducible Image References](https://learnsome.tech/learn/docker-course/m04l01) (lesson 4.1, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can read every part of an image reference, give one build several meaningful tags, and pin an image by digest so that every machine runs exactly the same bytes.

In the lesson: Every image so far has had a name, and in this module those names start to matter, because they are how a registry finds your image and how a server decides what to run. A full reference has up to five parts. First the registry host, with an optional port; leave it out and Docker assumes Docker Hub. Then a namespace, usually a user or an organisation; leave it out on Docker Hub and you get library, the namespace for official images. Then the repository, which is the image's own name. Then a tag after a colon, which defaults to latest. Finally an optional digest after an at sign. So plain alpine really means Docker Hub, library, alpine, tag latest. A tag is a label that people choose. A digest is computed from the content itself, and that difference is the whole lesson.

## Files

- [`starter/reading-an-image-reference.txt`](starter/reading-an-image-reference.txt): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/reading-an-image-reference.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m04l01-01` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
