FROM alpine:3.22
RUN dd if=/dev/zero of=/tmp/toolchain.bin bs=1M count=40 \
 && rm /tmp/toolchain.bin
CMD ["echo", "lean"]
