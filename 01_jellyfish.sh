#!/bin/bash
#SBATCH --job-name=01_spisula_kmer
#SBATCH --output=01_spisula_kmer.out
#SBATCH --error=01_spisula_kmer.err
#SBATCH --partition=common
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --exclusive
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hs325@duke.edu

cd /work/hs325/surfclam
module load Jellyfish

# Paths
SSO="/work/hs325/surfclam/SSo1/SSo1_all_trimmed.fq.gz"
SSI="/work/hs325/surfclam/SSi1/SSi1_7_all_trimmed.fq.gz"


####################### SOLIDISSIMA ##############################


jellyfish count \
  -C \
  -m 21 \
  -s 5G \
  -c 6 \
  -t 16 \
  -o SSo1_k21.jf \
  $SSO

jellyfish dump -c SSo1_k21.jf > SSo1_k21_counts.txt

jellyfish histo \
  -t 16 \
  -l 1 \
  -h 100000 \
  -i 1 \
  -o SSo1_k21.histo \
  SSo1_k21.jf


####################### SIMILIS ##############################


jellyfish count \
  -C \
  -m 21 \
  -s 5G \
  -c 6 \
  -t 16 \
  -o SSi1_k21.jf \
  $SSI

jellyfish dump -c SSi1_k21.jf > SSi1_k21_counts.txt

# Histogram
jellyfish histo \
  -t 16 \
  -l 1 \
  -h 100000 \
  -i 1 \
  -o SSi1_k21.histo \
  SSi1_k21.jf

