FROM alpine:3.20
RUN --mount=type=secret,id=API_TOKEN \
    test -s /run/secrets/API_TOKEN && echo "token received" > /status.txt
