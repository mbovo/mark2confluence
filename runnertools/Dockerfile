FROM ubuntu:latest

ENV MARK="5.7"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    git \
    curl \
    wget \
    jq \
    yamllint


RUN curl -LO https://github.com/kovetskiy/mark/releases/download/${MARK}}/mark_${MARK}_Linux_x86_64.tar.gz && \
    tar -xvzf mark_5.7_Linux_x86_64.tar.gz && \
    mv mark /usr/local/bin/mark

RUN mkdir -p /workspace

WORKDIR /workspace
