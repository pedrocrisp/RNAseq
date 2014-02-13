#!/bin/bash

input=$1
output=$2

mkdir -p $output
sample="$(basename $input)"


samtools view ${input}/${sample}.sorted.bam | \
    ~/bin/Prep_bam.pl \
    --prefix ${output}/${sample}.shortstack \
    --genome ~/workspace/refseqs/TAIR10_gen/TAIR10_allchr.fa \
    --sortmem 50000000000

~/bin/ShortStack.pl \
    --outdir ${output}/out \
    --flag_file ~/workspace/refseqs/TAIR10_gen/TAIR10_GFF3_genes_intergenes.flagfile \
    ${output}/${sample}.shortstack.bam \
    /home/pete/workspace/refseqs/TAIR10_gen/TAIR10_allchr.fa

    #--phasesize 'all' #consider running the phasing analysis on all samples \
