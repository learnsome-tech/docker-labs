# m05l03 · Bridge Networks, DNS And Container Communication

Module 5: Data, Networks And Runtime Configuration · lesson 5.3 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m05l03)

**Goal:** You can explain why containers on the default bridge only reach each other by address, put the task API on a user-defined bridge network where other containers find it by name or alias, and show that a network is an isolation boundary.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m05l03-02](m05l03-02/) | The default bridge knows addresses, not names | Read along |
| [m05l03-03](m05l03-03/) | A user-defined network adds names and a boundary | Read along |
| [m05l03-04](m05l03-04/) | How Docker's embedded DNS answers | Read along |
| [m05l03-05](m05l03-05/) | Inspect a network, then clean up in order | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: two networks, one bridge between them

1. Create networks m05l03-front and m05l03-back, and run the API on the back network only.
2. Run a client on the front network and show that it cannot resolve the API.
3. Connect the client to the back network as well and fetch /health by the API's name.
4. Give a second API container the same alias and look the alias up with nslookup.

> **Hint:** busybox:1.37 includes nslookup; run it on the back network to see every address.

## Check yourself

- Why could the throwaway container reach the API by address but not by name on the default bridge?
- What changed in the client's resolver configuration when it joined m05l03-net?
- Which port should one container use to reach another on the same network, and why not the published one?
- Why did docker network rm fail at first, and what order of cleanup avoids that?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
