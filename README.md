# amiberry-docker-fedora-arm64

A Dockerfile which creates an image, with the requirements to build Amiberry for a Fedora `arm64` platform.

The image is based on Fedora:latest and includes all Amiberry dependencies (e.g. SDL2, SDL2-image, etc)

The full image is available on DockerHub: <https://hub.docker.com/repository/docker/midwan/amiberry-fedora-arm64>

## Usage

`docker run --rm -it --platform linux/arm64 -v <dir-you-cloned-amiberry-into>:/build midwan/amiberry-fedora-arm64:latest`

Then you can proceed to compile Amiberry as usual, e.g. `cmake -B build && cmake --build build`
