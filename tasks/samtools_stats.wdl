
# Run `samtools stats --revome-dups --required-flag 1` for paired end sequencing.
task samtools_stats {
    File bam_file
    String outfilename

    parameter_meta {
        bam_file : "stream"
    }

    command {
        samtools stats --remove-dups --required-flag 1 ${bam_file} > ${outfilename}
    }

    output {
        File stats_output = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/samtools:v1.0"
    }
}