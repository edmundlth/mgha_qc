FROM edmundlth/htslib:v1.0

# SAMtools
RUN cd /usr/local/bin && \
    wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
    tar -xvf samtools-1.9.tar.bz2 && \
    rm samtools-1.9.tar.bz2 && \
    cd samtools-1.9 && \
    make
ENV PATH "$PATH:/usr/local/bin/samtools-1.9"
