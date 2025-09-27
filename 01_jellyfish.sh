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
SSo_GZ="SSoPooledAllTrimmed.fq.gz"
SSI_GZ="SSiPooledAllTrimmed.fq.gz"

SSo="SSoPooledAllTrimmed.fq"
SSi="SSiPooledAllTrimmed.fq"

gunzip -c "$SSo_GZ" > "$SSo"
gunzip -c "$SSI_GZ" > "$SSi"

OUTDIR="ktests_pooled"
# mkdir -p "$OUTDIR"

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
    -o "$OUTDIR/SSo_k${K}.jf" \
    "$SSo"

  jellyfish dump -c "$OUTDIR/SSo_k${K}.jf" > "$OUTDIR/SSo_k${K}_counts.txt"

  jellyfish histo \
    -t 16 \
    -l 1 \
    -h 100000 \
    -i 1 \
    -o "$OUTDIR/SSo_k${K}.histo" \
    "$OUTDIR/SSo_k${K}.jf"

####################### SIMILIS ##############################
  jellyfish count \
    -C \
    -m "$K" \
    -s 5G \
    -c 6 \
    -t 16 \
    -o "$OUTDIR/SSi_k${K}.jf" \
    "$SSi"

  jellyfish dump -c "$OUTDIR/SSi_k${K}.jf" > "$OUTDIR/SSi_k${K}_counts.txt"

  jellyfish histo \
    -t 16 \
    -l 1 \
    -h 100000 \
    -i 1 \
    -o "$OUTDIR/SSi_k${K}.histo" \
    "$OUTDIR/SSi_k${K}.jf"
done

# Cleanup unzipped FASTQs
rm -f "$SSo" "$SSi"

echo "Script finished, unzipped FASTQs removed"
