#!/bin/bash

Project="Project_SN700819R_0100_PCrisp_RSB_Arabidopsis_mRNA"
WSDir="/home/pete/workspace/"
RefDir="~/workspace/refseqs"

# Make mapping dir
cd "${WSDir}/${Project}"
mkdir "mapping"
cd mapping

# Make the Sample_* dirs in the mapping folder
#for sample in Sample_*
#do
#	mkdir "${WSDir}/${Project}/mapping/${sample}"
#done
#find -maxdepth 1 -name Sample_\* -type d |parallel 

sample=Sample_BJP_317_1_1
SampleDir="${WSDir}/${Project}/${sample}"

WorkingDir="${WSDir}/${Project}/mapping/${sample}"

mkdir "${WorkingDir}"

cd "${WorkingDir}"

pwd

echo tophat2 -G "${RefDir}/TAIR10_gen/TAIR10_GFF3_genes_transposons.gff" --transcriptome-index "${RefDir}/TAIR10_tx_from_tophat/TAIR10_tx" --solexa-quals --library-type fr-unstranded -p 22 -g 2 ${RefDir}/TAIR10_gen/TAIR10 ${SampleDir}/*.fq.gz
