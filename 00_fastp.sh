#!/bin/bash
#SBATCH --job-name=00_spisula_filter
#SBATCH --output=00_spisula_filter.out
#SBATCH --error=00_spisula_filter.err
#SBATCH --partition=common
#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --exclusive
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hs325@duke.edu

## 1 - Unzip .fq files with gunzip

## 2 - Run fastp for each sample and fastq file. keep phred=20

fastp \
  -i SSi1_CKDN250012368-1A_22V3VWLT4_L7_1.fq.gz \
  -I SSi1_CKDN250012368-1A_22V3VWLT4_L7_2.fq.gz \
  -o SSi1_trimmed_R1.fq.gz \
  -O SSi1_trimmed_R2.fq.gz \
  -h SSi1_fastp_report.html \
  -j SSi1_fastp_report.json \
  -q 20 \
  -w 8

cat SSi1_trimmed_R1.fq.gz SSi1_trimmed_R2.fq.gz > SSi1_trimmed_all.fq.gz


## Combine all fq files (SSo/SSi 1-3) into 1 per subspecies for jellyfish