# m06l01 · Define The Service And Database With Compose

Module 6: Compose And Local Development · lesson 6.1 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m06l01)

**Goal:** You can describe the task API and a Postgres database in one compose.yaml, check it with docker compose config, run it with up, ps, logs and exec, and take it down knowing which objects survive.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m06l01-02](m06l01-02/) | What the project directory holds | Read along |
| [m06l01-03](m06l01-03/) | The API service, key by key | Checker |
| [m06l01-04](m06l01-04/) | The database service and the named volumes | Checker |
| [m06l01-05](m06l01-05/) | Build, start and call the stack | Read along |
| [m06l01-06](m06l01-06/) | What Compose created for you | Read along |
| [m06l01-07](m06l01-07/) | Down, up again, then clean up | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: add a tool service

1. Delete the name key, run docker compose config, and find the project name it chose
2. Put the name back, then add a service called tools: image busybox:1.37, command sleep 600
3. Run docker compose up -d --wait, then from tools: wget -qO- http://api:8000/health
4. Finish with docker compose down -v and remove the image, so nothing from the lesson remains

> **Hint:** Inside the project network, services use container ports; published ports are for the host.

## Check yourself

- Which three objects does docker compose up create besides containers, and how are they named?
- Why does the API's connection string use the service name instead of localhost?
- What does docker compose down leave behind, and which flag removes it?
- Why run docker compose build before up when a service has both build and image keys?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
