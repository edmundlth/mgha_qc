
task fastqc {
    File input_file
    String? filename_extension = ".fastq.gz"

    parameter_meta {
        input_file : "stream"
    }

    command {
        fastqc --outdir . --threads 4 --quiet --noextract ${input_file}
    }

    output {
        File fastqc_file = basename(input_file, filename_extension) + "_fastqc.zip"
    }

    runtime {
        docker : "edmundlth/fastqc:v1.0"
        cpu : "4"
        memory : "2GB"
    }
}
