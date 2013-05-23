#!/bin/bash

NTHREADS=1 # Default number of threads, in case we forget to updateNThreads
function updateNThreads {
	# Get the number of cores to use. = num processeors - 1-min load average - 1.
	NTHREADS=$(($(nproc) - $(uptime |grep -oP ": \d+\." |sed -e "s/^\: //" |sed -e "s/\.$//") - 1))
	echo "Can use $NTHREADS threads"
}

#nthreds for number fo core to use
updateNThreads

#open working directory
cd /home/pete/workspace/Project_SN700819R_0100_PCrisp_RSB_Arabidopsis_mRNA

# cuffdiff
cuffdiff \
	-p $NTHREADS \
	-o 03-difexp/cuff/cuffdiff/ \
	-L Contol,HL-30,HL-60 \
	-b /home/pete/workspace/refseqs/TAIR10_gen/TAIR10_allchr.fa \
	-u \
	-T \
	--library-type fr-unstranded \
	/home/pete/workspace/refseqs/TAIR10_gen/TAIR10_GFF3_genes_transposons.gff \
	mapping/Sample_BJP_317_1_1/tophat_out/accepted_hits.bam,mapping/Sample_BJP_317_1_2/tophat_out/accepted_hits.bam,mapping/Sample_BJP_317_1_3/tophat_out/accepted_hits.bam \
	mapping/Sample_BJP_317_2_1/tophat_out/accepted_hits.bam,mapping/Sample_BJP_317_2_2/tophat_out/accepted_hits.bam,mapping/Sample_BJP_317_2_3/tophat_out/accepted_hits.bam \
	mapping/Sample_BJP_317_3_1/tophat_out/accepted_hits.bam,mapping/Sample_BJP_317_3_2/tophat_out/accepted_hits.bam,mapping/Sample_BJP_317_3_3/tophat_out/accepted_hits.bam
	
