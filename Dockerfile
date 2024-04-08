ARG DOCKER_VERSION=26.0.0
ARG ALPINE_VERSION=3.19

FROM docker:${DOCKER_VERSION}-dind-alpine${ALPINE_VERSION}


## Install some bases packages
RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache --upgrade \
  bash openssl curl make git jq sudo aws-cli vault nodejs npm openssh


## Install LeadDocker
RUN curl -sL https://raw.githubusercontent.com/paramah/ledo/master/install.sh | sudo sh

