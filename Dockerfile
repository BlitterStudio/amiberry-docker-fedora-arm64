# Image with the requirements to build Amiberry for Fedora AARCH64 (ARM64)
# Author: Dimitris Panokostas
#
# Usage: docker run --rm -it --platform linux/arm64 -v <path-to-amiberry-sources>:/build amiberry-fedora-arm64:latest
#

# If no arg is provided, default to latest
ARG fedora_release=latest
FROM --platform=linux/arm64 fedora:${fedora_release}

RUN sudo dnf makecache --refresh && sudo dnf -y install rpm-build cmake ninja-build git gcc g++ SDL2-devel SDL2_ttf-devel SDL2_image-devel flac-devel libmpg123-devel libpng-devel libmpeg2-devel libserialport-devel portmidi-devel enet-devel libpcap-devel libzstd-devel

WORKDIR /build

CMD [ "bash" ]