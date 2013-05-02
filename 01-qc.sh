#!/bin/bash
# Get the number of cores to use. = num processeors - 1-min load average - 1
nthreads=$(($(nproc) - $(uptime |grep -oP ": \d+\." |sed -e "s/^\: //" |sed -e "s/\.$//") - 1))

# enter directory containing reads
cd /media/work/pete/Project_SN700819R_0100_PCrisp_RSB_Arabidopsis_mRNA/

### DO QC
mkdir QC

# run fastqc
fastqc Sample_*/*.fastq.gz -o QC -t $nthreads


# and view the results (remember Ctrl-tab changes tabs)
for qc_res in QC/BJP_*_fastqc/fastqc_report.html
do
	firefox "file://$(readlink -f $qc_res)" &
done

