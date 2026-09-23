# Docker Architecture & Production Containers — lesson m02l04 — Run The Spine Service And Publish Its Port
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l04
# © LearnSome.tech
FROM python:3.12-alpine
RUN adduser -D -u 10001 app
WORKDIR /app
COPY app.py .
RUN mkdir -p /data && chown app /data
ENV PORT=8000 DATA_DIR=/data APP_VERSION=1.0.0
USER app
EXPOSE 8000
HEALTHCHECK --interval=3s --timeout=3s --retries=10 \
  CMD wget -qO- http://127.0.0.1:8000/health || exit 1
CMD ["python", "app.py"]
