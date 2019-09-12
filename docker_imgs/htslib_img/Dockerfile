FROM ubuntu:18.04

RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget \
                       build-essential \
                       libbz2-dev \
                       zlib1g-dev \
                       liblzma-dev \
                       libncurses5-dev \
                       unzip \
                       openjdk-11-jre-headless \
                       make && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# HTSLIB
RUN cd /usr/local/bin/ && \
    wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 && \
    tar -xvf htslib-1.9.tar.bz2 && \
    rm htslib-1.9.tar.bz2 && \
    cd htslib-1.9 && \
    make
ENV PATH "$PATH:/usr/local/bin/htslib-1.9"

