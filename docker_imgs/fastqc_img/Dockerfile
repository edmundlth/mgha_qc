FROM edmundlth/htslib:v1.0


# Fastqc
RUN cd /usr/local/bin && \
    wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip && \
    unzip fastqc_v0.11.8.zip && \
    rm fastqc_v0.11.8.zip && \
    chmod +x FastQC/fastqc
ENV PATH "$PATH:/usr/local/bin/FastQC"
