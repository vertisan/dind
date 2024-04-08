ARG DOCKER_VERSION=26.0.0
ARG ALPINE_VERSION=3.19

FROM docker:${DOCKER_VERSION}-dind-alpine${ALPINE_VERSION}

ENV VAULT_VERSION=1.16.0


## Install Vault
RUN wget -O /tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
  && unzip /tmp/vault.zip -d /usr/local/bin \
  && rm /tmp/vault.zip

## Install some bases packages
RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache --upgrade \
  bash openssl curl make git jq sudo aws-cli nodejs npm openssh

## Install LeadDocker
RUN curl -sL https://raw.githubusercontent.com/paramah/ledo/master/install.sh | sudo sh
