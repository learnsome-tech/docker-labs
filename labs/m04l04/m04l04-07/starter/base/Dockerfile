ARG TAG=3.20
FROM alpine:${TAG}
CMD ["sh", "-c", "cat /etc/alpine-release; apk info -v 2>/dev/null | grep -E '^(libssl3|musl)-[0-9]'"]
