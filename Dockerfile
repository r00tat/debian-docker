FROM debian:stretch

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gettext \
    gnupg2 \
    software-properties-common \
    && \
    (curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -) && \
    (add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable") && \
    apt-get update && \
    apt-get -y install \
    docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
