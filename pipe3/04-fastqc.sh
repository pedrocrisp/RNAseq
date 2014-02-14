#!/bin/bash
set -e
set -x
 
if [ $# -ne 1 ]
then
echo "USAGE: fastqc.sh SAMPLENAME"
fi
 
sample=$1
sample_dir=reads/$sample
 
fastqs="$(ls $sample_dir/*.fq)"
 
mkdir reads_scythe_seqtk_qc/$sample
 
fastqc -o reads_scythe_seqtk_qc/$sample $fastqs