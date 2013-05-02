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

# get full path to base sample directories on
workingdir=$(pwd)

# Do trim_galore
for sampledir in Sample_*
do
	# go into sample dir
	cd ${workingdir}/${sampledir}

	trim_galore \
		-q 20 \ # min qual of 20
		--fastqc \ # run fastqc on trimmed file
		--length 20 \ # min length 20
		--gzip \ # Compress the output file with GZIP
		--paired \ # f and pared-end
		*.fastq.gz \ # run on the *R1*.fastq.gz and *R2*.fastq.gz files
		>./trim_galore.log 2>&1 &
done
