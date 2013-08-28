#!/bin/bash

# make igv bam dir
outbasedir="igv_bams"
mkdir -p ${outbasedir} 2>/dev/null

#To process multiple samples in parallel just open a new terminal and change Raw_317_n to the next 3 samples and paste the code into terminal.
n=$1
map_dir="mapping/s${n}"
sample="$(basename $map_dir)"

# make out dir
outdir="${outbasedir}/${sample}"
mkdir "$outdir"

samtools sort -m 3G -f "$map_dir/tophat_out/accepted_hits.bam"  "$outdir/$sample.sorted.bam"
samtools index "$outdir/$sample.sorted.bam"


