# m07l04-05 · The service as a Deployment

**Lesson:** [From Local Containers To Kubernetes](https://learnsome.tech/learn/docker-course/m07l04) (lesson 7.4, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Checker

## Goal

You can show that the service image is a standard OCI artifact that any conforming runtime can run, explain why removing dockershim from Kubernetes did not affect images, and translate each part of the Compose stack into the Kubernetes object that takes over its job.

In the lesson: Here is the task service as a Deployment. It asks for one copy, and deliberately only one, because this service keeps its tasks in a single file and two copies would each keep their own. The Pod template refuses to run as root and pins user ten thousand and one, the same user the image declares. The container runs the image the pipeline promoted, by its commit tag; in production you would pin the digest as well. Its settings come from a config map, and the readiness probe calls the same health endpoint. Kubernetes ignores the health check written in the image, so this line is not optional. Resources carry requests and limits, the limit being the one hundred and twenty eight megabytes you proved in lesson three. And the data directory is backed by a persistent volume claim, the Kubernetes version of a named volume.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/deployment.yaml`](starter/deployment.yaml): the listing from the lesson
- [`starter/k8s/deployment.yaml`](starter/k8s/deployment.yaml)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m07l04/m07l04-05/starter`
2. Read `deployment.yaml` the way the lesson builds it:
   - Lines 1–6: one copy
   - Lines 7–10: user ten thousand and one
   - Lines 11–13: the image the pipeline promoted
   - Lines 14–16: the readiness probe
   - Lines 17–18: requests and limits
   - Lines 19–22: persistent volume claim
3. Notes from the lesson:
   - Line 5: one copy: the service keeps its tasks in a file
   - Line 13: the promoted tag; pin the digest in production
   - Line 16: Kubernetes ignores the image's HEALTHCHECK
4. Edit `deployment.yaml` and check it: `kubeconform -strict -summary deployment.yaml`.
5. Check it from the repository root: `./check m07l04-05`.

## How to check

`./check m07l04-05` copies `starter/` into a scratch directory and runs `kubeconform -strict -summary deployment.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it validates the manifest against the Kubernetes JSON schemas the site uses, in strict mode (unknown fields are errors). Kinds without a schema there, such as custom resources, are reported as skipped. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
