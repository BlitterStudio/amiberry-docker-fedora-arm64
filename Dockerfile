# Image with the requirements to cross-compile Amiberry for Fedora AARCH64 (ARM64)
# Author: Dimitris Panokostas
#
# Usage: docker run --rm -it -v <path-to-amiberry-sources>:/build amiberry-fedora-arm64:latest
#

# If no arg is provided, default to latest
ARG fedora_release=latest
FROM fedora:${fedora_release} AS build

LABEL maintainer="Dimitris Panokostas"
LABEL description="Image with the requirements to cross-compile Amiberry for Fedora AARCH64 (ARM64)"

# Install cross-compiler and ARM64 development libraries
RUN dnf makecache --refresh \
    && dnf -y install rpm-build cmake ninja-build git gcc g++ \
    gcc-aarch64-linux-gnu cross-aarch64-linux-gnu-binutils cross-aarch64-linux-gnu-gcc \
    SDL2-devel SDL2_ttf-devel SDL2_image-devel flac-devel libmpg123-devel libpng-devel libmpeg2-devel libserialport-devel portmidi-devel enet-devel libpcap-devel libzstd-devel \
    SDL2-devel.aarch64 SDL2_ttf-devel.aarch64 SDL2_image-devel.aarch64 flac-devel.aarch64 libmpg123-devel.aarch64 libpng-devel.aarch64 libmpeg2-devel.aarch64 libserialport-devel.aarch64 portmidi-devel.aarch64 enet-devel.aarch64 libpcap-devel.aarch64 libzstd-devel.aarch64 \
    && dnf clean all \
    && rm -rf /var/cache/dnf

WORKDIR /build

ENV ARCH=aarch64-linux-gnu
ENV AS=${ARCH}-as
ENV CC=${ARCH}-gcc
ENV CXX=${ARCH}-g++
ENV STRIP=${ARCH}-strip
ENV CROSS_COMPILE=${ARCH}-

CMD [ "bash" ]