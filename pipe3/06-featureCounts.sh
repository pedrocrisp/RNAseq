#!/bin/bash
set -e
set -x

###
#reference sequence directory variable - user should create a link in working dir to the location of the "subread_refdir"
refdir=subread_refdir
#

sample=$1
sample_dir=align/$sample
outdir="featureCounts/${sample}"
mkdir ${outdir}

featureCounts\
    -F SAF\
    -p\
    -C\
    -s 2\
    -a ${refdir}/TAIR10_GFF3_genes.saf\
    -o "$outdir/${sample}.counts"\
    ${sample_dir}/*.bam
