# m07l04-04 · From Compose keys to Kubernetes objects

**Lesson:** [From Local Containers To Kubernetes](https://learnsome.tech/learn/docker-course/m07l04) (lesson 7.4, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can show that the service image is a standard OCI artifact that any conforming runtime can run, explain why removing dockershim from Kubernetes did not affect images, and translate each part of the Compose stack into the Kubernetes object that takes over its job.

In the lesson: Almost every key in the Compose file has a Kubernetes object that takes over its job. The service's image, user and security settings become a Deployment, which keeps a chosen number of copies of a Pod running. Ports become a Service, a stable name and address in front of those Pods, with an Ingress when traffic comes from outside. The environment becomes a config map, and secrets become a Secret, again mounted as files. The health check becomes two probes: readiness decides whether a Pod gets traffic, liveness decides whether it gets restarted. Resource limits keep their meaning, and gain requests, which tell the scheduler how much to reserve. Named volumes become persistent volume claims. Restart policies and startup order mostly disappear: controllers restart failed Pods, and readiness keeps traffic away until a Pod is ready.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/from-compose-keys-to-kubernetes-objects.txt`](starter/from-compose-keys-to-kubernetes-objects.txt): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/from-compose-keys-to-kubernetes-objects.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m07l04-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
