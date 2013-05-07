#!/bin/bash

# This allows GNU Parallel to run TG our way. Call it with the sample directory as the first and only argument, i.e.:
#$>01.1-trimgalore.sh path/to/Sample_dir

# go into sample dir
cd $1 

# Run TG
	# min qual of 20
	# run fastqc on trimmed file
	# min length 20
	# Compress the output file with GZIP
	# use pared-end
	# run on the *R1*.fastq.gz and *R2*.fastq.gz files
trim_galore \
	-q 20 \
	--fastqc \
	--length 20 \
	--gzip \
	--paired \
	*.fastq.gz \
	>./trim_galore.log 2>&1;
