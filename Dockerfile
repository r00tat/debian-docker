FROM debian:jessie
MAINTAINER github@frig.at

RUN apt-get update

# RUN apt-get -y install \
#     linux-image-extra-$(uname -r) \
#     linux-image-extra-virtual

RUN apt-get -y install apt-transport-https \
    ca-certificates \
    software-properties-common \
    curl

RUN curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
RUN add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       debian-$(lsb_release -cs) \
       main"


RUN apt-get update
RUN apt-get -y install docker-engine=1.13.0-0~debian-jessie

