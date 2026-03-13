# Image with the requirements to cross-compile Amiberry for Fedora AARCH64 (ARM64)
# Author: Dimitris Panokostas
#
# Usage: docker run --rm -it -v <path-to-amiberry-sources>:/build amiberry-fedora-arm64:latest
#

# If no arg is provided, default to latest
ARG fedora_release=latest
FROM fedora:${fedora_release} AS build

LABEL maintainer="Dimitris Panokostas"
LABEL description="Image with the requirements to compile Amiberry for Fedora AARCH64 (ARM64)"

# Install development libraries
RUN dnf makecache --refresh \
    && dnf -y install rpm-build cmake ninja-build git gcc g++ \
    SDL2-devel SDL2_ttf-devel SDL2_image-devel SDL3-devel SDL3_image-devel flac-devel libmpg123-devel libpng-devel libmpeg2-devel libserialport-devel portmidi-devel enet-devel libpcap-devel libzstd-devel libcurl-devel nlohmann-json-devel \
    && dnf clean all \
    && rm -rf /var/cache/dnf

WORKDIR /build

CMD [ "bash" ]
