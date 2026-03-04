#!/bin/bash
set -e

#Module load 
module load PLINK/1.9b_6.13-x86_64

#Define input VCF

VCF=/cluster/work/users/melatag/genotyping_pipeline/output/03-variants_filtered/default_filters/variants_default_filters.vcf.gz

# File with samples to remove
REMOVE=remove_all.txt

#Convert VCF to PLINK format
plink \
  --vcf $VCF \
  --double-id \
  --allow-extra-chr \
  --chr-set 40 \
  --set-missing-var-ids @:# \
  --remove $REMOVE \
  --indep-pairwise 50 10 0.1 \
  --out sparrow_Iransamples_balanced

#PCA using only pruned SNPs
plink \
  --vcf $VCF \
  --double-id \
  --allow-extra-chr \
  --chr-set 40 \
  --set-missing-var-ids @:# \
  --remove $REMOVE \
  --extract sparrow_nomontanus_nosenegal.prune.in \
  --make-bed \
  --pca \
  --out sparrow_Iransamples_balanced
