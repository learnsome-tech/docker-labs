# m02l04 · Run The Spine Service And Publish Its Port

Module 2: Images And The Container Lifecycle · lesson 2.4 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m02l04)

**Goal:** You can run the course service from its image, publish its listening port, test it from the host, and cleanly stop the service when the test is done.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m02l04-02](m02l04-02/) | The spine service image | Checker |
| [m02l04-03](m02l04-03/) | Run and publish the service | Read along |
| [m02l04-04](m02l04-04/) | Stop the service and check the record | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Trace one request

1. Build the task API image from the supplied context.
2. Run it with a host port of your choice mapped to container port eight thousand.
3. Call the health endpoint, then use logs to find the request and remove the container.

> **Hint:** If curl cannot connect, check the published port and the address the app binds to.

## Check yourself

- Why can a healthy process be unreachable from the host?
- What does the left and right side of a published port mapping mean?
- Why does changing the host port not require rebuilding the image?
- Which evidence proves that a request reached the service?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
