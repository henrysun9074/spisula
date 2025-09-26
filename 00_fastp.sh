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

## - Run fastp for each sample and fastq file. keep phred=20

##### SOLIDISSIMA ########
echo "Starting SSo1"

fastp \
  -i SSo1/SSo1_CKDN250012365-1A_22V3VWLT4_L6_1.fq.gz \
  -I SSo1/SSo1_CKDN250012365-1A_22V3VWLT4_L6_2.fq.gz \
  -o SSo1/SSo1_trimmed20_run1_R1.fq.gz \
  -O SSo1/SSo1_trimmed20_run1_R2.fq.gz \
  -h SSo1/SSo1_run1_fastp_report.html \
  -j SSo1/SSo1_run1_fastp_report.json \
  -q 20 \
  -w 8

fastp \
  -i SSo1/SSo1_CKDN250012365-1A_22W3KGLT4_L1_1.fq.gz \
  -I SSo1/SSo1_CKDN250012365-1A_22W3KGLT4_L1_2.fq.gz \
  -o SSo1/SSo1_trimmed20_run2_R1.fq.gz \
  -O SSo1/SSo1_trimmed20_run2_R2.fq.gz \
  -h SSo1/SSo1_run2_fastp_report.html \
  -j SSo1/SSo1_run2_fastp_report.json \
  -q 20 \
  -w 8

fastp \
  -i SSo1/SSo1_CKDN250012365-1A_22WVMFLT4_L8_1.fq.gz \
  -I SSo1/SSo1_CKDN250012365-1A_22WVMFLT4_L8_2.fq.gz \
  -o SSo1/SSo1_trimmed20_run3_R1.fq.gz \
  -O SSo1/SSo1_trimmed20_run3_R2.fq.gz \
  -h SSo1/SSo1_run3_fastp_report.html \
  -j SSo1/SSo1_run3_fastp_report.json \
  -q 20 \
  -w 8

cat SSo1/SSo1_trimmed20_run1_R1.fq.gz SSo1/SSo1_trimmed20_run2_R1.fq.gz SSo1/SSo1_trimmed20_run3_R1.fq.gz > SSo1/SSo1_trimmed20_all_R1.fq.gz
cat SSo1/SSo1_trimmed20_run1_R2.fq.gz SSo1/SSo1_trimmed20_run2_R2.fq.gz SSo1/SSo1_trimmed20_run3_R2.fq.gz > SSo1/SSo1_trimmed20_all_R2.fq.gz
cat SSo1/SSo1_trimmed20_all_R1.fq.gz SSo1/SSo1_trimmed20_all_R2.fq.gz > SSo1/SSo1_trimmed20_all.fq.gz


echo "Starting So2"
fastp \
  -i SSo2/SSo2_CKDN250012366-1A_22V3VWLT4_L6_1.fq.gz \
  -I SSo2/SSo2_CKDN250012366-1A_22V3VWLT4_L6_2.fq.gz \
  -o SSo2/SSo2_trimmed_R1.fq.gz \
  -O SSo2/SSo2_trimmed_R2.fq.gz \
  -h SSo2/SSo2_fastp_report.html \
  -j SSo2/SSo2_fastp_report.json \
  -q 20 \
  -w 8

cat SSo2/SSo2_trimmed_R1.fq.gz SSo2/SSo2_trimmed_R2.fq.gz > SSo2/SSo2_trimmed_all.fq.gz

echo "Starting So3"
fastp \
  -i SSo3/SSo3_CKDN250012367-1A_22V3VWLT4_L7_1.fq.gz \
  -I SSo3/SSo3_CKDN250012367-1A_22V3VWLT4_L7_2.fq.gz \
  -o SSo3/SSo3_trimmed_R1.fq.gz \
  -O SSo3/SSo3_trimmed_R2.fq.gz \
  -h SSo3/SSo3_fastp_report.html \
  -j SSo3/SSo3_fastp_report.json \
  -q 20 \
  -w 8

cat SSo3/SSo3_trimmed_R1.fq.gz SSo3/SSo3_trimmed_R2.fq.gz > SSo3/SSo3_trimmed_all.fq.gz


##### SIMILIS ########
echo "Starting Si1"
fastp \
  -i SSi1/SSi1_CKDN250012368-1A_22V3VWLT4_L7_1.fq.gz \
  -I SSi1/SSi1_CKDN250012368-1A_22V3VWLT4_L7_2.fq.gz \
  -o SSi1/SSi1_trimmed20_R1.fq.gz \
  -O SSi1/SSi1_trimmed20_R2.fq.gz \
  -h SSi1/SSi1_fastp_report.html \
  -j SSi1/SSi1_fastp_report.json \
  -q 20 \
  -w 8
cat SSi1/SSi1_trimmed20_R1.fq.gz SSi1/SSi1_trimmed20_R2.fq.gz > SSi1/SSi1_trimmed20_all.fq.gz


echo "Starting Si2"
fastp \
  -i SSi2/SSi2_CKDN250012369-1A_22V3VWLT4_L7_1.fq.gz \
  -I SSi2/SSi2_CKDN250012369-1A_22V3VWLT4_L7_2.fq.gz \
  -o SSi2/SSi2_trimmed_run1_R1.fq.gz \
  -O SSi2/SSi2_trimmed_run1_R2.fq.gz \
  -h SSi2/SSi2_run1_fastp_report.html \
  -j SSi2/SSi2_run1_fastp_report.json \
  -q 20 \
  -w 8

fastp \
  -i SSi2/SSi2_CKDN250012369-1A_22W3KGLT4_L3_1.fq.gz \
  -I SSi2/SSi2_CKDN250012369-1A_22W3KGLT4_L3_2.fq.gz \
  -o SSi2/SSi2_trimmed_run2_R1.fq.gz \
  -O SSi2/SSi2_trimmed_run2_R2.fq.gz \
  -h SSi2/SSi2_run2_fastp_report.html \
  -j SSi2/SSi2_run2_fastp_report.json \
  -q 20 \
  -w 8

fastp \
  -i SSi2/SSi2_CKDN250012369-1A_22WVTJLT4_L1_1.fq.gz \
  -I SSi2/SSi2_CKDN250012369-1A_22WVTJLT4_L1_2.fq.gz \
  -o SSi2/SSi2_trimmed_run3_R1.fq.gz \
  -O SSi2/SSi2_trimmed_run3_R2.fq.gz \
  -h SSi2/SSi2_run3_fastp_report.html \
  -j SSi2/SSi2_run3_fastp_report.json \
  -q 20 \
  -w 8

cat SSi2/SSi2_trimmed_run1_R1.fq.gz SSi2/SSi2_trimmed_run2_R1.fq.gz SSi2/SSi2_trimmed_run3_R1.fq.gz > SSi2/SSi2_trimmed_all_R1.fq.gz
cat SSi2/SSi2_trimmed_run1_R2.fq.gz SSi2/SSi2_trimmed_run2_R2.fq.gz SSi2/SSi2_trimmed_run3_R2.fq.gz > SSi2/SSi2_trimmed_all_R2.fq.gz
cat SSi2/SSi2_trimmed_all_R1.fq.gz SSi2/SSi2_trimmed_all_R2.fq.gz > SSi2/SSi2_trimmed_all.fq.gz

echo "Starting Si3"
fastp \
  -i SSi3/SSi3_CKDN250012370-1A_22V3VWLT4_L7_1.fq.gz \
  -I SSi3/SSi3_CKDN250012370-1A_22V3VWLT4_L7_2.fq.gz \
  -o SSi3/SSi3_trimmed_R1.fq.gz \
  -O SSi3/SSi3_trimmed_R2.fq.gz \
  -h SSi3/SSi3_fastp_report.html \
  -j SSi3/SSi3_fastp_report.json \
  -q 20 \
  -w 8

cat SSi3/SSi3_trimmed_R1.fq.gz SSi3/SSi3_trimmed_R2.fq.gz > SSi3/SSi3_trimmed_all.fq.gz


######################################################################################################

## Combine all fq files (SSo/SSi 1-3) into 1 per subspecies for jellyfish
cat SSo1/SSo1_trimmed20_all.fq.gz SSo2/SSo2_trimmed_all.fq.gz SSo3/SSo3_trimmed_all.fq.gz > SSoPooledAllTrimmed.fq.gz
cat SSi1/SSi1_trimmed20_all.fq.gz SSi2/SSi2_trimmed_all.fq.gz SSi3/SSi3_trimmed_all.fq.gz > SSiPooledAllTrimmed.fq.gz
