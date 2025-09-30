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

# update paths
cd /work/hs325/surfclam
REPORT_DIR="fq_reports/pooled-phred30"
FILTER_DIR="fq_filtered/pooled-phred30"

mkdir -p ${REPORT_DIR}
mkdir -p ${FILTER_DIR}

#########################################
##### SOLIDISSIMA ########
echo "Starting So1"

fastp -i raw/SSo1/SSo1_CKDN250012365-1A_22V3VWLT4_L6_1.fq.gz \
      -I raw/SSo1/SSo1_CKDN250012365-1A_22V3VWLT4_L6_2.fq.gz \
      -o ${FILTER_DIR}/SSo1_run1_R1.fq.gz \
      -O ${FILTER_DIR}/SSo1_run1_R2.fq.gz \
      -h ${REPORT_DIR}/SSo1_run1_fastp_report.html \
      -j ${REPORT_DIR}/SSo1_run1_fastp_report.json \
      -q 30 -w 8

fastp -i raw/SSo1/SSo1_CKDN250012365-1A_22W3KGLT4_L1_1.fq.gz \
      -I raw/SSo1/SSo1_CKDN250012365-1A_22W3KGLT4_L1_2.fq.gz \
      -o ${FILTER_DIR}/SSo1_run2_R1.fq.gz \
      -O ${FILTER_DIR}/SSo1_run2_R2.fq.gz \
      -h ${REPORT_DIR}/SSo1_run2_fastp_report.html \
      -j ${REPORT_DIR}/SSo1_run2_fastp_report.json \
      -q 30 -w 8

fastp -i raw/SSo1/SSo1_CKDN250012365-1A_22WVMFLT4_L8_1.fq.gz \
      -I raw/SSo1/SSo1_CKDN250012365-1A_22WVMFLT4_L8_2.fq.gz \
      -o ${FILTER_DIR}/SSo1_run3_R1.fq.gz \
      -O ${FILTER_DIR}/SSo1_run3_R2.fq.gz \
      -h ${REPORT_DIR}/SSo1_run3_fastp_report.html \
      -j ${REPORT_DIR}/SSo1_run3_fastp_report.json \
      -q 30 -w 8
cat ${FILTER_DIR}/SSo1_run*_R1.fq.gz > ${FILTER_DIR}/SSo1_all_R1.fq.gz
cat ${FILTER_DIR}/SSo1_run*_R2.fq.gz > ${FILTER_DIR}/SSo1_all_R2.fq.gz
cat ${FILTER_DIR}/SSo1_all_R1.fq.gz ${FILTER_DIR}/SSo1_all_R2.fq.gz > ${FILTER_DIR}/SSo1_all.fq.gz
rm ${FILTER_DIR}/SSo1_run*_R*.fq.gz

#########################################
echo "Starting So2"
fastp -i raw/SSo2/SSo2_CKDN250012366-1A_22V3VWLT4_L6_1.fq.gz \
      -I raw/SSo2/SSo2_CKDN250012366-1A_22V3VWLT4_L6_2.fq.gz \
      -o ${FILTER_DIR}/SSo2_R1.fq.gz \
      -O ${FILTER_DIR}/SSo2_R2.fq.gz \
      -h ${REPORT_DIR}/SSo2_fastp_report.html \
      -j ${REPORT_DIR}/SSo2_fastp_report.json \
      -q 30 -w 8
cat ${FILTER_DIR}/SSo2_R1.fq.gz ${FILTER_DIR}/SSo2_R2.fq.gz > ${FILTER_DIR}/SSo2_all.fq.gz
rm ${FILTER_DIR}/SSo2_R*.fq.gz

#########################################
echo "Starting So3"
fastp -i raw/SSo3/SSo3_CKDN250012367-1A_22V3VWLT4_L7_1.fq.gz \
      -I raw/SSo3/SSo3_CKDN250012367-1A_22V3VWLT4_L7_2.fq.gz \
      -o ${FILTER_DIR}/SSo3_R1.fq.gz \
      -O ${FILTER_DIR}/SSo3_R2.fq.gz \
      -h ${REPORT_DIR}/SSo3_fastp_report.html \
      -j ${REPORT_DIR}/SSo3_fastp_report.json \
      -q 30 -w 8
cat ${FILTER_DIR}/SSo3_R1.fq.gz ${FILTER_DIR}/SSo3_R2.fq.gz > ${FILTER_DIR}/SSo3_all.fq.gz
rm ${FILTER_DIR}/SSo3_R*.fq.gz

#########################################
##### SIMILIS ########
echo "Starting Si1"
fastp -i raw/SSi1/SSi1_CKDN250012368-1A_22V3VWLT4_L7_1.fq.gz \
      -I raw/SSi1/SSi1_CKDN250012368-1A_22V3VWLT4_L7_2.fq.gz \
      -o ${FILTER_DIR}/SSi1_R1.fq.gz \
      -O ${FILTER_DIR}/SSi1_R2.fq.gz \
      -h ${REPORT_DIR}/SSi1_fastp_report.html \
      -j ${REPORT_DIR}/SSi1_fastp_report.json \
      -q 30 -w 8
cat ${FILTER_DIR}/SSi1_R1.fq.gz ${FILTER_DIR}/SSi1_R2.fq.gz > ${FILTER_DIR}/SSi1_all.fq.gz
rm ${FILTER_DIR}/SSi1_R*.fq.gz

#########################################
echo "Starting Si2"
fastp \
  -i raw/SSi2/SSi2_CKDN250012369-1A_22V3VWLT4_L7_1.fq.gz \
  -I raw/SSi2/SSi2_CKDN250012369-1A_22V3VWLT4_L7_2.fq.gz \
  -o ${FILTER_DIR}/SSi2_run1_R1.fq.gz \
  -O ${FILTER_DIR}/SSi2_run1_R2.fq.gz \
  -h ${REPORT_DIR}/SSi2_run1_fastp_report.html \
  -j ${REPORT_DIR}/SSi2_run1_fastp_report.json \
  -q 30 -w 8

fastp \
  -i raw/SSi2/SSi2_CKDN250012369-1A_22W3KGLT4_L3_1.fq.gz \
  -I raw/SSi2/SSi2_CKDN250012369-1A_22W3KGLT4_L3_2.fq.gz \
  -o ${FILTER_DIR}/SSi2_run2_R1.fq.gz \
  -O ${FILTER_DIR}/SSi2_run2_R2.fq.gz \
  -h ${REPORT_DIR}/SSi2_run2_fastp_report.html \
  -j ${REPORT_DIR}/SSi2_run2_fastp_report.json \
  -q 30 -w 8

fastp \
  -i raw/SSi2/SSi2_CKDN250012369-1A_22WVTJLT4_L1_1.fq.gz \
  -I raw/SSi2/SSi2_CKDN250012369-1A_22WVTJLT4_L1_2.fq.gz \
  -o ${FILTER_DIR}/SSi2_run3_R1.fq.gz \
  -O ${FILTER_DIR}/SSi2_run3_R2.fq.gz \
  -h ${REPORT_DIR}/SSi2_run3_fastp_report.html \
  -j ${REPORT_DIR}/SSi2_run3_fastp_report.json \
  -q 30 -w 8
cat ${FILTER_DIR}/SSi2_run*_R1.fq.gz > ${FILTER_DIR}/SSi2_all_R1.fq.gz
cat ${FILTER_DIR}/SSi2_run*_R2.fq.gz > ${FILTER_DIR}/SSi2_all_R2.fq.gz
cat ${FILTER_DIR}/SSi2_all_R1.fq.gz ${FILTER_DIR}/SSi2_all_R2.fq.gz > ${FILTER_DIR}/SSi2_all.fq.gz
rm ${FILTER_DIR}/SSi2_run*_R*.fq.gz ${FILTER_DIR}/SSi2_all_R1.fq.gz ${FILTER_DIR}/SSi2_all_R2.fq.gz

#########################################
echo "Starting Si3"
fastp \
  -i raw/SSi3/SSi3_CKDN250012370-1A_22V3VWLT4_L7_1.fq.gz \
  -I raw/SSi3/SSi3_CKDN250012370-1A_22V3VWLT4_L7_2.fq.gz \
  -o ${FILTER_DIR}/SSi3_R1.fq.gz \
  -O ${FILTER_DIR}/SSi3_R2.fq.gz \
  -h ${REPORT_DIR}/SSi3_fastp_report.html \
  -j ${REPORT_DIR}/SSi3_fastp_report.json \
  -q 30 -w 8

# Merge and clean up
cat FILTER_DIR/SSi3_R1.fq.gz ${FILTER_DIR}/SSi3_R2.fq.gz > ${FILTER_DIR}/SSi3_all.fq.gz
rm ${FILTER_DIR}/SSi3_R*.fq.gz

######################################################################################################

cat ${FILTER_DIR}/SSo1_all.fq.gz ${FILTER_DIR}/SSo2_all.fq.gz ${FILTER_DIR}/SSo3_all.fq.gz > ${FILTER_DIR}/SSoPooledAllTrimmed.fq.gz
cat ${FILTER_DIR}/SSi1_all.fq.gz ${FILTER_DIR}/SSi2_all.fq.gz ${FILTER_DIR}/SSi3_all.fq.gz > ${FILTER_DIR}/SSiPooledAllTrimmed.fq.gz
echo "Finished script"

