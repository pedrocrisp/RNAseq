#/bin/bash

cd "/home/pete/workspace/Exp317_RRGS_sRNA/"
igvDirName="igv_bams_multi"


mkdir $igvDirName

#find mapping/ -type d -name Sample_BJP_317_1_3 | \
find mapping.report.all/ -type d -name Raw_317_\* | \
	parallel \
		mkdir -p $igvDirName/{/}/ \; \
		samtools sort -m 3G {}/{/}.bam $igvDirName/{/}/{/}.sorted \; \
		samtools index $igvDirName/{/}/{/}.sorted.bam
