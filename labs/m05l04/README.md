# m05l04 · Port Publishing, Localhost And Network Troubleshooting

Module 5: Data, Networks And Runtime Configuration · lesson 5.4 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m05l04)

**Goal:** You can publish a container port on all interfaces or on loopback only, recognise and fix a server that listens on 127.0.0.1 inside its container, use EXPOSE, -P and docker port correctly, and work through a cannot-connect problem step by step.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m05l04-02](m05l04-02/) | Publish a port, then ask Docker what it published | Read along |
| [m05l04-04](m05l04-04/) | The classic bug: a server that listens on loopback | Read along |
| [m05l04-06](m05l04-06/) | Let Docker pick the host port, then ask | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: break it, then climb the ladder

1. Run the task API with -p 127.0.0.1:18504:8000 and confirm docker port shows one line.
2. Start the loopback-bound http.server again and diagnose it with every rung of the ladder.
3. Run two copies of the task API with -P and call /health on each using docker port.
4. Try to publish host port 18504 twice and read the error Docker gives you.

> **Hint:** Write down which rung failed first; that rung names the layer with the fault.

## Check yourself

- What is the difference between -p 18504:8000 and -p 127.0.0.1:18504:8000, and how does docker port show it?
- Why does a server bound to 127.0.0.1 inside a container fail through a published port while docker exec works?
- What does EXPOSE change about a running container, and what does it change for -P?
- In what order would you check a service that nobody can connect to, and what does each step rule out?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
