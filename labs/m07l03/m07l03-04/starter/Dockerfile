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
STOPSIGNAL SIGTERM
CMD ["python", "app.py"]
