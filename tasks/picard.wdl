
task picard_alignment_rate {
    File input_bam
    String outfilename
    File reference_fasta

    parameter_meta {
        input_bam : "stream"
    }

    command {
        java -jar $PICARD CollectAlignmentSummaryMetrics \
            R=${reference_fasta} \
            I=${input_bam} \
            O=${outfilename}
    }

    output {
        File alignment_rate_output = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/picard:v1.0"
    }
}


task picard_collect_insert_size_metrics {
    File input_bam
    String
}

task picard_estimate_library_complexity {
    File input_bam
    String outfilename

    parameter_meta {
        input_bam : "stream"
    }

    command {
        java -jar picard.jar EstimateLibraryComplexity \
            I=${input_bam} \
            O=${outfilename}
    }

    output {
        File library_complexity_output = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/picard:v1.0"
    }
}