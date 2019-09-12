
task picard_collect_alignment_summary_metrics {
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
            O=${outfilename} \
            VALIDATION_STRINGENCY=LENIENT
    }

    output {
        File alignment_summary_metrics_file = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/picard:v1.0"
        cpu : "4"
        memory : "4GB"
    }
}


task picard_collect_insert_size_metrics {
    File input_bam
    String outfilename
    String? histogram_outfilename = outfilename + "_histogram.pdf"

    parameter_meta {
        input_bam : "stream"
    }

    command {
        java -jar $PICARD CollectInsertSizeMetrics \
            I=${input_bam} \
            O=${outfilename} \
            H=${histogram_outfilename} \
            M=0.05 \
            VALIDATION_STRINGENCY=LENIENT
    }

    output {
        File insert_size_metrics_file = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/picard:v1.0"
        cpu : "4"
        memory : "4GB"
    }
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
            O=${outfilename} \
            VALIDATION_STRINGENCY=LENIENT
    }

    output {
        File library_complexity_output = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/picard:v1.0"
        cpu : "4"
        memory : "4GB"
    }
}