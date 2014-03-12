#!/bin/bash
set -e
set -x


###
#code to make it work on osx and linux
if
[[ $OSTYPE == darwin* ]]
then
readlink=$(which greadlink)
scriptdir="$(dirname $($readlink -f $0))"
else
scriptdir="$(dirname $(readlink -f $0))"
fi
#

###
#reference sequence directory variable - user should create a link called subread_refdir in script dir to the location of the directory containing the subread indexfiles which must have the prefix "TAIR10_gen_chrc" (chrc means we included all 7 chromosomes)
chrc.sizes=$scriptdir/TAIR10_gen_chrc.genome.sizes

#

sample=$1
sample_dir=align/$sample
outdir="tdf_for_igv/${sample}"
mkdir ${outdir}

echo "bam to bedgraph"
genomeCoverageBed -bg -strand -ibam $sample_dir/*.bam -g $chrc.sizes > $oudir/$sample.bedgraph

echo "bedgraph to binary tiled data (.tdf) file"
igvtools $sample_dir/${sample}.bedgraph $oudir/$sample.tdf chrc.sizes
