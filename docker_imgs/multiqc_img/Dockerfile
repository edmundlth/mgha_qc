FROM ubuntu:18.04

RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3.7 python3-pip git&&\
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# MultiQC
RUN pip3 install --no-cache-dir --compile multiqc
ENV LC_ALL "C.UTF-8"
ENV LANG "C.UTF-8"
