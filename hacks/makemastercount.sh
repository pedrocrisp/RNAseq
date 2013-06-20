#!/bin/bash

# enter directory containing reads
countdir=/home/pete/workspace/Project_SN700819R_0100_PCrisp_RSB_Arabidopsis_mRNA/counts
mkdir -p $countdir
cd /home/pete/workspace/Project_SN700819R_0100_PCrisp_RSB_Arabidopsis_mRNA/mapping

for sampledir in Sample_*
do
	cd $sampledir/tophat_out
	for fle in *gene.counts
	do
		sed -e "s/$/\t$fle/" < "$fle" >"$(basename $fle .counts).3col.counts"
	done

	cat *.3col.counts |grep "^AT" > $countdir/$(basename $sampledir).all.count
	cd ../..
done
