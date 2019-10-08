
task relatedness2 {
    Array[File] vcf_files
    String? output_prefix = "vcftools_output"

    command {
        bcftools merge -m snps ${sep=' ' vcf_files} -Ou | vcftools --bcf - --relatedness2 --out ${output_prefix}
    }

    output {
        File relatedness2_output = "${output_prefix}.relatedness2"
    }

    runtime {
        docker : "edmundlth/vcftools_bcftools:v1.0"
        cpu : 1
        memory : "2GB"
    }
}


task tstv_by_count {
    Array[File] vcf_files
    String? output_prefix = "vcftools_output"

    command {
        bcftools merge -m snps ${sep=' ' vcf_files} -Ou | vcftools --bcf - --TsTv-by-count --out ${output_prefix}
    }

    output {
        File relatedness2_output = "${output_prefix}.TsTv.count"
    }

    runtime {
        docker : "edmundlth/vcftools_bcftools:v1.0"
        cpu : 1
        memory : "2GB"
    }
}


task tstv_by_qual {
    Array[File] vcf_files
    String? output_prefix = "vcftools_output"

    command {
        bcftools merge -m snps ${sep=' ' vcf_files} -Ou | vcftools --bcf - --TsTv-by-qual --out ${output_prefix}
    }

    output {
        File relatedness2_output = "${output_prefix}.TsTv.qual"
    }

    runtime {
        docker : "edmundlth/vcftools_bcftools:v1.0"
        cpu : 1
        memory : "2GB"
    }
}


task tstv_summary {
    Array[File] vcf_files
    String? output_prefix = "vcftools_output"

    command {
        bcftools merge -m snps ${sep=' ' vcf_files} -Ou | vcftools --bcf - --TsTv-summary --out ${output_prefix}
    }

    output {
        File relatedness2_output = "${output_prefix}.TsTv.summary"
    }

    runtime {
        docker : "edmundlth/vcftools_bcftools:v1.0"
        cpu : 1
        memory : "2GB"
    }
}