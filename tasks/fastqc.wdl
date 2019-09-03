
task fastqc {
    File input_file

    parameter_meta {
        input_file : "stream"
    }

    command {
        fastqc --outdir . --threads 4 ${input_file}
    }

    runtime {
        docker : "edmundlth/fastqc:v1.0"
    }
}
