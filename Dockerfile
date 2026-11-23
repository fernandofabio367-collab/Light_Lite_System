# ==============================================================================
# Dockerfile para compilar a ISO do Light Lite System
# Uso:
#   docker build -t lightlite-builder .
#   docker run --privileged --rm -v $(pwd)/out:/out lightlite-builder
# ==============================================================================

FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm archiso git bash

WORKDIR /build
COPY . /build

ENTRYPOINT ["bash", "-c", "mkarchiso -v -w /tmp/archiso-work -o /out /build"]
