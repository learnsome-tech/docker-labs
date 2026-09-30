FROM alpine:3.22
RUN false | echo one
SHELL ["/bin/sh", "-o", "pipefail", "-c"]
RUN false | echo two
