#!/bin/bash
set -e
set -x
 
if [ $# -ne 1 ]
then
echo "USAGE: fastqc.sh SAMPLENAME"
fi

#user to define
refdir=/Users/u4010132/ps/exp/TAIR10

sample=$1
sample_dir=reads/$sample
 
fastqs="$(ls $sample_dir/*.fastq.gz)"
 
mkdir qcd/$sample

for fq in $fastqs
do
fqname="$(basename $fq)"
outputFile="reads_scythe_seqtk/$sample/${fqname%%.*}.trimmed.fq"
seqtk trimfq \
$fq \
>$outputFile
done

