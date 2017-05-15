FROM debian:jessie
MAINTAINER github@frig.at

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install apt-transport-https \
    ca-certificates \
    software-properties-common \
    curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
RUN add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       debian-$(lsb_release -cs) \
       main"


ENV DOCKER_VERSION 1.13.1-0
RUN apt-get update && \
	apt-get -y install docker-engine=$DOCKER_VERSION~debian-jessie && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
