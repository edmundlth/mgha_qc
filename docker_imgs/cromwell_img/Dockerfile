FROM ubuntu:18.04

RUN apt-get clean && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget \
                       openjdk-11-jre-headless && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Cromwell
RUN mkdir -p /jarfiles && \
    wget https://github.com/broadinstitute/cromwell/releases/download/45.1/cromwell-45.1.jar -P /jarfiles/ && \
    wget https://github.com/broadinstitute/cromwell/releases/download/45.1/womtool-45.1.jar -P /jarfiles/
ENV WOMTOOL "/jarfiles/womtool-45.1.jar"
ENV CROMWELL "/jarfiles/cromwell-45.1.jar"