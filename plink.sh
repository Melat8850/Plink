#!/bin/bash

Define input VCF
# -----------------------------
VCF=/cluster/work/users/melatag/genotyping_pipeline/output/03-variants_filtered/default_filters/variants_default_filters.vcf.gz

Convert VCF to PLINK format
# -----------------------------
plink \
--vcf $VCF \
--double-id \
--allow-extra-chr \
--set-missing-var-ids @:# \
--indep-pairwise 50 10 0.1 \
--out sparrow_ld

