FROM alpine:3.22
WORKDIR /forms
RUN touch shell-$(whoami)
RUN ["touch", "exec-$(whoami)"]
