# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        openjdk:11-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN apt-get update -y \
 && mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1 \
 && apt-get install -y openjdk-11-jre-headless \
 && apt-get install -y curl ca-certificates openssl git tar nc sqlite webp fontconfig tzdata iproute2 openjdk-11-dbg \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
