#!/bin/bash
#Set -x is an option, it tells the script to echo back each command once it has been completed. 
set -x

#Sample $1 looks for the first ____ in the reads directory
sample=$1

#Names the directory that the sample will be opened from
sample_dir="reads/$sample"

#If the 
if [ ! -d "$sample_dir" ]
then
echo "my bad"
exit
fi

pushd "$sample_dir"
 rev_reads=*R2*.fastq.gz
 fwd_reads=*R1*.fastq.gz
 zcat $rev_reads>${sample}.R2.fastq
 zcat $fwd_reads>${sample}.R1.fastq
 
rm *.fastq.gz
 
gzip *.fastq
 
popd 

