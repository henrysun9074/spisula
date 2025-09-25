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


### add in fastp code here. Change to use Phred score of 20