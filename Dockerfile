ARG DOCKER_VERSION=24.0.5
ARG ALPINE_VERSION=3.18

FROM docker:${DOCKER_VERSION}-dind-alpine${ALPINE_VERSION}

ARG LEDO_VERSION=1.5.0
ENV LEDO_VERSION ${LEDO_VERSION}


## Install some bases packages
RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache --upgrade bash openssl curl make git jq sudo aws-cli vault


## Install LeadDocker
RUN curl -sL https://raw.githubusercontent.com/paramah/ledo/master/install.sh | sudo sh
