ARG DOCKER_VERSION=24.0.5
ARG ALPINE_VERSION=3.18

FROM docker:${DOCKER_VERSION}-dind-alpine${ALPINE_VERSION}

ARG VAULT_VERSION=1.14.3
ARG LEDO_VERSION=1.4.7

ENV VAULT_VERSION ${VAULT_VERSION}
ENV LEDO_VERSION ${LEDO_VERSION}


## Install some bases packages
RUN apk add gcc python3 python3-dev py3-pip libffi-dev musl-dev openssl-dev curl make rust cargo git jq sudo --no-cache


## Install the Vault client
RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
  && unzip vault_${VAULT_VERSION}_linux_amd64.zip \
  && install vault /usr/bin/ \
  && rm vault_${VAULT_VERSION}_linux_amd64.zip vault


## Install LeadDocker
# RUN curl -sL https://raw.githubusercontent.com/paramah/ledo/master/install.sh | sudo sh
RUN wget https://github.com/paramah/ledo/releases/download/v${LEDO_VERSION}/ledo_${LEDO_VERSION}_linux_amd64.tar.gz \
  && tar -zxvf ledo_${LEDO_VERSION}_linux_amd64.tar.gz \
  && chmod a+x ledo \
  && mv ledo /usr/local/bin


## Install some extra packages
RUN pip3 install --upgrade pip \
  && pip3 install awscli requests markupsafe~=2.0.0
