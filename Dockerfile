FROM alpine:3.3
# This Dockerfile assumes that a boot binary has already been built. Run 'make build' before building an image from this file
ENV VERSION 0.0.1
ADD rootfs/bin/boot /bin/boot
CMD ["/bin/boot"]
