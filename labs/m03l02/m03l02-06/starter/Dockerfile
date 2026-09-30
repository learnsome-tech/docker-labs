FROM python:3.12-alpine
WORKDIR /opt
WORKDIR tasks
COPY app.py .
COPY app.py backup
COPY app.py releases/
COPY --chown=10001:10001 --chmod=600 app.py private.py
CMD ["python", "app.py"]
