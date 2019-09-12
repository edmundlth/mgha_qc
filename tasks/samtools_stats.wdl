
# Run `samtools stats --revome-dups --required-flag 1` for paired end sequencing.
task samtools_stats {
    File input_bam
    String outfilename

    parameter_meta {
        bam_file : "stream"
    }

    command {
        samtools stats --remove-dups --required-flag 1 ${input_bam} > ${outfilename}
    }

    output {
        File samtools_stats_file = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/samtools:v1.0"
        cpu : "1"
        memory : "2GB"
    }
}