#!/bin/bash
set -e
# Load modules

module load PLINK/1.9b_6.13-x86_64

# Define dataset

FILE=sparrow_nomontanus_nosenegal

# Only domesticus file 
awk '$2 ~ /^PDOM/ {print $1, $2}' ${FILE}.fam > domesticus.keep
#Subset dataset using LD-pruned SNPs

plink \
  --bfile ${FILE} \
  --keep domesticus.keep \
  --extract ${FILE}.prune.in \
  --allow-extra-chr \
  --chr-set 40 \
  --make-bed \
  --out sparrow_domesticus_only_pruned

