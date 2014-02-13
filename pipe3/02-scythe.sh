#!/bin/bash
set -e
set -x
 
if [ $# -ne 1 ]
then
echo "USAGE: fastqc.sh SAMPLENAME"
fi

#user to define
refdir=~/ps/exp/TAIR10

sample=$1
sample_dir=reads/$sample
 
fastqs="$(ls $sample_dir/*.fastq.gz)"
 
mkdir qc/$sample
 
scythe \
-p 0.1 \ # set prior to 0.1 (default 0.3)
-a {$refdir}/truseq_adapters.fasta \ #adapter file
-o qcd/$sample \ #
$fastqs #input