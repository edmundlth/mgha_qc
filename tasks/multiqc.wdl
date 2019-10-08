

task multiqc {
    Array[File] fastqc_files
    Array[File] alignment_metrics_files
    Array[File] insert_size_metrics_files
    Array[File] samtools_stats_files
    Array[File] bcftools_stats_files
    File vcftools_relatedness2_file
    File? multiqc_config_file
    Boolean? megaqc_upload = true

    command {
        mkdir stats_dir

        # Fastqc stats hard links
        mkdir stats_dir/fastqc_dir
        for filepath in ${sep=' ' fastqc_files}; do
            ln $filepath stats_dir/fastqc_dir/$(basename $filepath)
        done

        # picard stats hard links
        mkdir stats_dir/picard_dir
        for filepath in ${sep=' ' alignment_metrics_files}; do
            ln $filepath stats_dir/picard_dir/$(basename $filepath)
        done

        for filepath in ${sep=' ' insert_size_metrics_files}; do
            ln $filepath stats_dir/picard_dir/$(basename $filepath)
        done

        # samtools stats hard links
        mkdir stats_dir/samtools_dir
        for filepath in ${sep=' ' samtools_stats_files}; do
            ln $filepath stats_dir/samtools_dir/$(basename $filepath)
        done

        # bcftools stats hard links
        mkdir stats_dir/bcftools_dir
        for filepath in ${sep=' ' bcftools_stats_files}; do
            ln $filepath stats_dir/bcftools_dir/$(basename $filepath)
        done

        # vcftools relatedness2 hard link
        mkdir stats_dir/vcftools_dir
        ln ${vcftools_relatedness2_file} stats_dir/vcftools_dir/$(basename ${vcftools_relatedness2_file})

        # Run multiqc on all stats files
        multiqc stats_dir --module samtools \
                          --module bcftools \
                          --module picard \
                          --module fastqc

        if [ -f ${multiqc_config_file} ]
        then
            cp ${multiqc_config_file} $HOME/.multiqc_config.yaml
        else
            :
        fi

        if [ ${megaqc_upload} ]
        then
            megaqc upload multiqc_data/multiqc_data.json --date $(date "+%Y-%m-%d, %H:%M")
        else
            :
        fi
    }

    output {
        File multiqc_json = "multiqc_data/multiqc_data.json"
        File multiqc_html = "multiqc_report.html"
    }

    runtime {
        docker : "edmundlth/multiqc_megaqc:v1.0"
        cpu : "1"
        memory : "2GB"
    }
}