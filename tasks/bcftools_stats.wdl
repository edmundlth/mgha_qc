
# Run `bcftools stats`
task bcftools_stats {
    File vcf_file
    String outfilename

    parameter_meta {
        vcf_file : "stream"
    }

    command {
        bcftools stats  --threads 4 ${vcf_file} > ${outfilename}
    }

    output {
        File stats_output = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/bcftools:v1.0"
        cpu : 4
        memory : "5GB"
    }
}
