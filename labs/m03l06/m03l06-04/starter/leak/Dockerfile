FROM alpine:3.20
ARG API_TOKEN
RUN test -n "$API_TOKEN" && echo "token received" > /status.txt
