ARG PYTHON_TAG=3.12-alpine
FROM python:${PYTHON_TAG}
RUN adduser -D -u 10001 app
WORKDIR /app
COPY app.py .
RUN mkdir -p /data && chown app /data
ARG APP_VERSION=1.0.0
LABEL org.opencontainers.image.title="taskapi" \
      org.opencontainers.image.version="${APP_VERSION}"
ENV PORT=8000 DATA_DIR=/data APP_VERSION=${APP_VERSION}
EXPOSE 8000
CMD ["python", "app.py"]
