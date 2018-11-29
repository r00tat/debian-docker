FROM docker:latest as static-docker-source

FROM debian:stretch
COPY --from=static-docker-source /usr/local/bin/docker /usr/bin/docker

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gettext \
    gnupg2 \
    software-properties-common \
    && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]