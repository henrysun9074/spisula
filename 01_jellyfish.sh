#!/bin/bash
#SBATCH --job-name=01_spisula_kmer
#SBATCH --output=01_spisula_kmer.out
#SBATCH --error=01_spisula_kmer.err
#SBATCH --partition=common
#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --exclusive
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hs325@duke.edu

cd /work/hs325/surfclam
module load Jellyfish

# Paths
SSO_GZ="/work/hs325/surfclam/SSo1/SSo1_all_trimmed.fq.gz"
SSI_GZ="/work/hs325/surfclam/SSi1/SSi1_7_all_trimmed.fq.gz"

SSO="SSo1_all_trimmed.fq"
SSI="SSi1_all_trimmed.fq"

gunzip -c "$SSO_GZ" > "$SSO"
gunzip -c "$SSI_GZ" > "$SSI"

# default to 21 
KMER_SIZES=("$@")
if [ ${#KMER_SIZES[@]} -eq 0 ]; then
  KMER_SIZES=(21)
fi

echo "Running Jellyfish for k-mer sizes: ${KMER_SIZES[*]}"
for K in "${KMER_SIZES[@]}"; do
  echo "=== Processing k=$K ==="

####################### SOLIDISSIMA ##############################
  jellyfish count \
    -C \
    -m "$K" \
    -s 5G \
    -c 6 \
    -t 16 \
    -o "SSo1_k${K}.jf" \
    "$SSO"

  jellyfish dump -c "SSo1_k${K}.jf" > "SSo1_k${K}_counts.txt"

  jellyfish histo \
    -t 16 \
    -l 1 \
    -h 100000 \
    -i 1 \
    -o "SSo1_k${K}.histo" \
    "SSo1_k${K}.jf"

####################### SIMILIS ##############################
  jellyfish count \
    -C \
    -m "$K" \
    -s 5G \
    -c 6 \
    -t 16 \
    -o "SSi1_k${K}.jf" \
    "$SSI"

  jellyfish dump -c "SSi1_k${K}.jf" > "SSi1_k${K}_counts.txt"

  jellyfish histo \
    -t 16 \
    -l 1 \
    -h 100000 \
    -i 1 \
    -o "SSi1_k${K}.histo" \
    "SSi1_k${K}.jf"
done

# Cleanup unzipped FASTQs
rm -f "$SSO" "$SSI"

