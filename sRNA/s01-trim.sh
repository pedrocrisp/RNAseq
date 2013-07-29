#!/bin/bash

# enter directory containing reads - using HL test directory that have 0, 30mins, 60mins and 120mins timepoints to speed up trim and align steps for now, raw_data directory contains a folder for each library with raw read file in it (fastq.gz)


# -a illumina adapter sequence
# -m discard trimmed reads shorter than 18
# -M discard reads longer than 25
# -O only trimm adapter is if 10 nt match (elliminates trimming a few bases due to random matches to adapter eg the first 3)
# --discard-untrimmed read must have 3' adapter (was 50 nt sequence and only keeping 18-25 nt reads, so all should have adapter)
# -o output to new file named same as input but with *.trimmed.fq
# -q trimm ends of reads until quality is 20 or above
# >  redirect the standard output (now the summary info) into a .log txt file
cd /home/pete/workspace/Exp317_RRGS_sRNA/
for sample_dir in Raw_317_1_*/
do
  pushd $sample_dir || exit
  cutadapt \
    -a AGATCGGAAGAGC \
    -m 18 \
    -M 25 \
    -O 10 \
    --discard-untrimmed \
    -o trimmed.$(basename $sample_dir).fq \
    -q 20 \
    Raw_317_*.fastq.gz \
    > trimmed.$(basename $sample_dir).cutadapt.log 2>&1
  popd
done

### DO QC
mkdir QC

# run fastqc

fastqc Raw_*/*.fq -o QC -t 23

# and view the results (remember Ctrl-tab changes tabs)
for qc_res in QC/trimmed.Raw*_fastqc/fastqc_report.html
 do
   chromium "file://$(readlink -f $qc_res)" &
 done
