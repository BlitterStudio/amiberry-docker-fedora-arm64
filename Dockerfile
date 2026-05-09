# Image with the requirements to cross-compile Amiberry for Fedora AARCH64 (ARM64)
# Author: Dimitris Panokostas
#
# Usage: docker run --rm -it -v <path-to-amiberry-sources>:/build amiberry-fedora-arm64:latest
#

# Match Amiberry release CI; override with --build-arg fedora_release=<version> when bumping.
ARG fedora_release=44
FROM fedora:${fedora_release} AS build

LABEL org.opencontainers.image.title="Amiberry build environment (Fedora arm64)"
LABEL org.opencontainers.image.description="Image with the requirements to compile Amiberry for Fedora AARCH64 (ARM64)"
LABEL org.opencontainers.image.authors="Dimitris Panokostas"
LABEL org.opencontainers.image.source="https://github.com/BlitterStudio/amiberry-docker-fedora-arm64"
LABEL org.opencontainers.image.licenses="GPL-3.0"

# Install development libraries
RUN dnf makecache --refresh \
    && dnf -y install rpm-build cmake ninja-build git gcc g++ \
    SDL2-devel SDL2_ttf-devel SDL2_image-devel SDL3-devel SDL3_image-devel flac-devel libmpg123-devel libpng-devel libmpeg2-devel libserialport-devel portmidi-devel enet-devel libpcap-devel libzstd-devel libcurl-devel nlohmann-json-devel dbus-devel wayland-devel \
    && dnf clean all \
    && rm -rf /var/cache/dnf

WORKDIR /build

CMD [ "bash" ]
