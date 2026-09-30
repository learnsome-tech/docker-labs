# m01l03-05 · Two containers, one image, separate writes

**Lesson:** [Union Filesystems, Images And Writable Layers](https://learnsome.tech/learn/docker-course/m01l03) (lesson 1.3, module 1: Containers From The Ground Up) · Free  
**Check:** Read along

## Goal

You can explain what an image is made of, read the layer history of an image you built, and predict what happens to a file a container writes when that container is removed.

In the lesson: Watch the two containers stay out of each other's way. The first runs the default command and prints the file it shipped with. The second is from the same image, but its command is to delete that file. Now ask what changed inside the second container, and Docker reports two entries: the directory was changed, and the file was deleted. That listing is the writable layer and nothing else, and the delete is a marker, not a removal. Start the first one again and it prints the original line, because the image underneath it never moved. Then throw both away. The deletion the second container made goes with it, and the image is exactly as it was. Data that matters cannot live there, which is why volumes get a module of their own.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/note.txt`](starter/note.txt)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker run --name note-one layers:demo
   docker run --name note-two layers:demo rm /app/note.txt
   docker diff note-two
   docker start -a note-one
   docker rm -f note-one note-two
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m01l03-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
