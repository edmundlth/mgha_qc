FROM edmundlth/htslib:v1.0

# BCFtools
RUN cd /usr/local/bin && \
    wget --continue https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2 && \
    tar -xvf bcftools-1.9.tar.bz2 && \
    rm bcftools-1.9.tar.bz2 && \
    cd bcftools-1.9 && \
    make
ENV PATH "$PATH:/usr/local/bin/bcftools-1.9"
