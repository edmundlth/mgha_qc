
# Run `bcftools stats`
# Single vcf file only.
task bcftools_stats {
    File input_vcf
    String outfilename

    parameter_meta {
        vcf_file : "stream"
    }

    command {
        bcftools stats  --threads 4 ${input_vcf} > ${outfilename}
    }

    output {
        File bcftools_stats_file = "${outfilename}"
    }

    runtime {
        docker : "edmundlth/bcftools:v1.0"
        cpu : "1"
        memory : "2GB"
    }
}
