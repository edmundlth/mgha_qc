FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget \
                       unzip \
                       openjdk-11-jre-headless \
                       libxml2-dev \
                       libcurl4-openssl-dev \
                       r-base-core && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Qualimap
RUN cd /usr/local/bin && \
    wget https://bitbucket.org/kokonech/qualimap/downloads/qualimap_v2.2.1.zip && \
    unzip qualimap_v2.2.1.zip && \
    rm qualimap_v2.2.1.zip && \
    chmod +x qualimap_v2.2.1/qualimap
ENV PATH "$PATH:/usr/local/bin/qualimap_v2.2.1/"

