#/bin/bash

cd "/home/pete/workspace/Project_SN700819R_0100_PCrisp_RSB_Arabidopsis_mRNA"
igvDirName="igv_bams"


mkdir $igvDirName

#find mapping/ -type d -name Sample_BJP_317_1_3 | \
find mapping/ -type d -name Sample\* | \
	parallel \
		mkdir -p $igvDirName/{/}/ \; \
		samtools sort -m 3G {}/tophat_out/accepted_hits.bam $igvDirName/{/}/{/}.sorted \; \
		samtools index $igvDirName/{/}/{/}.sorted.bam
