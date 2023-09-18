ARG DOCKER_VERSION=24.0.5
ARG ALPINE_VERSION=3.18

FROM docker:${DOCKER_VERSION}-dind-alpine${ALPINE_VERSION}

ARG VAULT_VERSION=1.14.3
ARG LEDO_VERSION=1.5.0

ENV VAULT_VERSION ${VAULT_VERSION}
ENV LEDO_VERSION ${LEDO_VERSION}


## Install some bases packages
RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache --upgrade python3 openssl-dev curl make git jq sudo py3-pip


## Install the Vault client
RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
  && unzip vault_${VAULT_VERSION}_linux_amd64.zip \
  && install vault /usr/bin/ \
  && rm vault_${VAULT_VERSION}_linux_amd64.zip vault


## Install LeadDocker
RUN curl -sL https://raw.githubusercontent.com/paramah/ledo/master/install.sh | sudo sh


## Install some extra packages
RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir awscli requests markupsafe~=2.0.0
