# m07l04-02 · The image is a standard, not a Docker format

**Lesson:** [From Local Containers To Kubernetes](https://learnsome.tech/learn/docker-course/m07l04) (lesson 7.4, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can show that the service image is a standard OCI artifact that any conforming runtime can run, explain why removing dockershim from Kubernetes did not affect images, and translate each part of the Compose stack into the Kubernetes object that takes over its job.

In the lesson: Here is the proof that the image does not belong to Docker. Build the service, then save it to a file and list the archive, leaving out the individual blobs. What you find is an open container image layout: a directory of blobs named by their hashes, an index that points at the manifests, and the layout marker, which declares version one point zero point zero of the image layout format. Docker's older manifest file sits alongside for backwards compatibility. Any conforming tool can read this archive. Now look at how Docker itself runs containers: the default runtime is runc, and the engine talks to containerd through its socket, the same containerd that most Kubernetes nodes run. Finally, read the contract that travels inside the image: the user app, and port eight thousand. The next runtime reads exactly the same fields.

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
   docker build -q -t m07l04-api:1.0.0 . >/dev/null
   docker save -o api.tar m07l04-api:1.0.0
   tar -tf api.tar | grep -v '^blobs/sha256/.'
   tar -xOf api.tar oci-layout; echo
   docker info -f '{{.DefaultRuntime}} {{.Containerd.Address}}'
   f='{{.Config.User}} {{.Config.ExposedPorts}}'
   docker inspect -f "$f" m07l04-api:1.0.0
   rm api.tar
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l04-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
