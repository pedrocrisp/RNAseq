#pipe3 README

pipeline to process RNAseq data

Reads must be in a folder called reads and the scripts must be called from the parent directory of the reads folder

Each step has to be called in order and run in bash eg bash ~/path_to_01.runner.sh

Steps 02-scythe.sh requires the file "truseq_adapters.fasta" to be in the working directory or a symbolic link to it

Steps 05-subread.sh and 06-featureCounts.sh require a symbolic link to the folder containing the index files, those files must have the prefix "TAIR10_gen_chrc"

