#!/bin/bash

cd ~/workspace/Exp277_HL_drought_RNAseq

#for loop to index all sorted bam files
#& means run on all files at once on seperate threads - be careful not to exceed memory, here ok because on 12 samples only

for sample_dir in Sample_BJP_277_*/
  do 
   pushd $sample_dir || exit
    samtools index BJP_277_*.bam &
   popd
  done

#to view bam file - convert from binary and make human readable(sam) and pipe to less
#samtools view -q 0 BJP_277_2.bam | less
