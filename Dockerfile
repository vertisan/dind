FROM docker:23.0.6-dind-alpine3.18

ENV VAULT_VERSION 1.14.0


## Install some bases packages
RUN apk add gcc python3 python3-dev py3-pip libffi-dev musl-dev openssl-dev curl make rust cargo git jq sudo --no-cache


## Install the Vault client
RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
  && unzip vault_${VAULT_VERSION}_linux_amd64.zip \
  && install vault /usr/bin/ \
  && rm vault_${VAULT_VERSION}_linux_amd64.zip vault


## Install LeadDocker
RUN curl -sL https://raw.githubusercontent.com/paramah/ledo/master/install.sh | sudo sh


## Install some extra packages
RUN pip3 install --upgrade pip \
  && pip3 install awscli requests markupsafe~=2.0.0
