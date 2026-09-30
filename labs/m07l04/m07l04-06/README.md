# m07l04-06 · A stable name and the configuration

**Lesson:** [From Local Containers To Kubernetes](https://learnsome.tech/learn/docker-course/m07l04) (lesson 7.4, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Checker

## Goal

You can show that the service image is a standard OCI artifact that any conforming runtime can run, explain why removing dockershim from Kubernetes did not affect images, and translate each part of the Compose stack into the Kubernetes object that takes over its job.

In the lesson: Three small objects complete the picture, in one file separated by three dashes. The Service gives the Pods a stable name inside the cluster. It finds them by label, not by container name, and forwards port eighty to the container's port eight thousand, so other workloads can reach the service by the name taskapi, the way Compose services reached each other by service name. The config map holds the same environment values the image already sets, now changeable without a rebuild. The claim asks the cluster for one gigabyte of storage that a single node can mount for writing. Notice what is missing: no password. A Secret should be created from a secret store or by an operator's command, never committed next to these files, for the same reason the secrets directory is in the docker ignore file.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/k8s/deployment.yaml`](starter/k8s/deployment.yaml)
- [`starter/k8s/service.yaml`](starter/k8s/service.yaml)
- [`starter/service.yaml`](starter/service.yaml): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m07l04/m07l04-06/starter`
2. Read `service.yaml` the way the lesson builds it:
   - Lines 1–6: The Service
   - Lines 7–13: The config map
   - Lines 14–20: The claim
3. Notes from the lesson:
   - Line 5: matches the Pod labels from the Deployment
   - Line 6: port 80 inside the cluster, forwarded to 8000
4. Edit `service.yaml` and check it: `kubeconform -strict -summary service.yaml`.
5. Check it from the repository root: `./check m07l04-06`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m07l04-06 --command=<id>`:
   - `validate` (Validate): `kubeconform -strict -summary service.yaml`
   - `verbose` (Validate each resource): `kubeconform -strict -verbose -summary service.yaml`

## How to check

`./check m07l04-06` copies `starter/` into a scratch directory and runs `kubeconform -strict -summary service.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it validates the manifest against the Kubernetes JSON schemas the site uses, in strict mode (unknown fields are errors). Kinds without a schema there, such as custom resources, are reported as skipped. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
