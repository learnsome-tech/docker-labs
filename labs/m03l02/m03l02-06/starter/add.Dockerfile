FROM alpine:3.22
WORKDIR /etc/site
COPY sitecfg.tar.gz copied/
ADD sitecfg.tar.gz extracted/
