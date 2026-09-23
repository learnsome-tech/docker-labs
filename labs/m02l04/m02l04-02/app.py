# Docker Architecture & Production Containers — lesson m02l04 — Run The Spine Service And Publish Its Port
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l04
# © LearnSome.tech
import json
import os
import signal
import sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

PORT = int(os.environ.get("PORT", "8000"))
DATA = Path(os.environ.get("DATA_DIR", "/data"))
VERSION = os.environ.get("APP_VERSION", "1.0.0")


def load():
    path = DATA / "tasks.json"
    return json.loads(path.read_text()) if path.exists() else []


def save(items):
    DATA.mkdir(parents=True, exist_ok=True)
    (DATA / "tasks.json").write_text(json.dumps(items))


class Handler(BaseHTTPRequestHandler):
    def reply(self, code, body):
        raw = json.dumps(body).encode()
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(raw)))
        self.end_headers()
        self.wfile.write(raw)

    def do_GET(self):
        if self.path == "/health":
            self.reply(200, {"status": "ok", "version": VERSION})
        elif self.path == "/tasks":
            self.reply(200, {"tasks": load()})
        else:
            self.reply(404, {"error": "not found"})

    def do_POST(self):
        size = int(self.headers.get("Content-Length", "0"))
        body = json.loads(self.rfile.read(size) or b"{}")
        items = load() + [body.get("title", "untitled")]
        save(items)
        self.reply(201, {"tasks": items})

    def log_message(self, fmt, *args):
        print(f"{self.command} {self.path}", flush=True)


def stop(signum, frame):
    print("shutting down", flush=True)
    sys.exit(0)


signal.signal(signal.SIGTERM, stop)
print(f"listening on port {PORT}", flush=True)
ThreadingHTTPServer(("", PORT), Handler).serve_forever()
