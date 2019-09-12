FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget \
                       r-base \
                       openjdk-11-jre-headless && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Picard
RUN mkdir -p /jarfiles && \
    wget https://github.com/broadinstitute/picard/releases/download/2.20.3/picard.jar -P /jarfiles/
ENV PICARD "/jarfiles/picard.jar"