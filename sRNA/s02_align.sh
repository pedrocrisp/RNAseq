#!/bin/bash

Project="Exp317_RRGS_sRNA"
WSDir="/home/pete/workspace/"
RefDir="/home/pete/workspace/refseqs"

ProjectDir="${WSDir}/${Project}"

# Make mapping dir
cd "${WSDir}/${Project}"
mkdir "mapping"
cd mapping

NTHREADS=1 # Default number of threads, in case we forget to updateNThreads
function updateNThreads {
	# Get the number of cores to use. = num processeors - 1-min load average - 1.
	NTHREADS=$(($(nproc) - $(uptime |grep -oP ": \d+\." |sed -e "s/^\: //" |sed -e "s/\.$//") - 1))
	echo "Can use $NTHREADS threads"
}

##-p updateNThreads has a bug? - the load average doesnt update quick enough so bowtie2 is only using 2 threads every second time in the loop
## bug 2, not writing to the log file

# Make the Sample_* dirs in the mapping folder
for sample in ${ProjectDir}/Raw_317*
do
	sample="$(basename "$sample")"
	WorkingDir="${WSDir}/${Project}/mapping/${sample}"
	mkdir ${WorkingDir} 
	pushd ${WorkingDir}

	SampleDir="${WSDir}/${Project}/${sample}"

	updateNThreads
	bowtie2 \
		-x "${RefDir}/TAIR10_gen/TAIR10_allchr" \
		--phred33 \
		--end-to-end \
		--mm \
		-D 20 \
		-R 3 \
		-N 0 \
		-L 10 \
		-i S,1,0.50 \
		-p 22 \
		--score-min L,0,0 \
		-U ${SampleDir}/*.fq \
		-S ${WorkingDir}/$sample.sam 2>&1 | tee "./bowtie${sample}.log"
	popd
done

#-x bowtie index
#--phred33
#--end-to-end dont trim reads to enable alignment
#--mm memory-mapped I/O to load index allow multiple processes to use index
#-p number of threds to use
#-U fastq file path, and specifies reads are not paired
#-S file to write SAM alignemnts too (although default is stdout anyhow)
#-D and -R tell bowtie to try a little harder than normal to find alignments
#-L reduce substring length to 10 (default 22) as these are short reads
#-i reduce substring interval? more sensitive?
# --score-min C,0,0 would tell bowtie2 to report only exact matches in --end-to-end mode (alignment score of 0 required which is max possible in end mode)


