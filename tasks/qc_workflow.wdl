import "fastqc.wdl" as fastqc
import "multiqc.wdl" as multiqc
import "picard.wdl" as picard
import "bcftools_stats.wdl" as bcftools_stats
import "samtools_stats.wdl" as samtools_stats
import "vcftools.wdl" as vcftools

workflow qc_pipeline_test {
    Array[File] fastqs
    Array[File] bams
    Array[File] vcfs
    File reference_fasta
    File? multiqc_config_file
    Boolean? megaqc_upload = true

    # Run `samtools stats` and picard metrics on all bam files
    scatter (bam in bams) {
        call samtools_stats.samtools_stats as samtools_stats {
            input :
                input_bam = bam,
                outfilename = basename(bam, ".bam") + "_samtools_stats.txt"
        }

        call picard.picard_collect_alignment_summary_metrics as alignment_metrics {
            input :
                input_bam = bam,
                outfilename = basename(bam, ".bam") + "_AlignmentSummaryMetrics.txt",
                reference_fasta = reference_fasta
        }

        call picard.picard_collect_insert_size_metrics as insert_size_metrics {
            input :
                input_bam = bam,
                outfilename = basename(bam, ".bam") + "_InsertSizeMetrics.txt"
        }
    }

    # Run `fastqc` on all fastq files
    scatter (fastq in fastqs) {
        call fastqc.fastqc as fastqc {
            input :
                input_file = fastq
        }
    }

    # Run `bcftools stats` on all vcf files
    scatter (vcf in vcfs) {
        call bcftools_stats.bcftools_stats as bcftools_stats {
            input :
                input_vcf = vcf,
                outfilename = basename(vcf, ".vcf") + "_bcftools_stats.txt"
        }
    }

    call vcftools.relatedness2 as relatedness2 {
        input :
            vcf_files = vcfs,
            output_prefix = "vcftools_relatedness2_output"
    }

    # Run `multiqc` on all stats files
    call multiqc.multiqc as multiqc {
        input :
            fastqc_files = fastqc.fastqc_file,
            alignment_metrics_files = alignment_metrics.alignment_summary_metrics_file,
            insert_size_metrics_files = insert_size_metrics.insert_size_metrics_file,
            samtools_stats_files = samtools_stats.samtools_stats_file,
            bcftools_stats_files = bcftools_stats.bcftools_stats_file,
            vcftools_relatedness2_file = relatedness2.relatedness2_output,
            multiqc_config_file = multiqc_config_file,
            megaqc_upload = megaqc_upload
    }
}
