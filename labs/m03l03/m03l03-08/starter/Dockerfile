FROM python:3.12-alpine
RUN adduser -D -u 10001 app
WORKDIR /app
COPY app.py .
RUN mkdir -p /data && chown app /data
CMD ["python", "app.py"]
