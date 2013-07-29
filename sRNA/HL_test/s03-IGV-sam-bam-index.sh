#!/bin/bash

# enter directory containing reads
cd /home/pete/workspace/Exp317_RRGS_sRNA/HL_analysis/raw_data/mapping

#To process multiple samples in parallel just open a new terminal and change Raw_317_n to the next 3 samples and paste the code into terminal.
for sample_dir in Raw_317_3_*/
  do 
   pushd $sample_dir || exit
    samtools view -b -S -o $(basename $sample_dir).bam $(basename $sample_dir).sam
    samtools sort -m 60G $(basename $sample_dir).bam $(basename $sample_dir).sorted
    samtools index $(basename $sample_dir).sorted.bam
   popd
  done

