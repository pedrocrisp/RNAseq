function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

mkdir qc

#make sure path is correct
#pete@macpro
findSamples | parallel bash ~/gitrepos/RNAseq/pipe3/01-fastqc.sh {}


#pete@north1ws:
#findSamples | parallel bash ~ws/fastqc.sh {}

#to run got to the folder containing the reads folder:
#cd ~/ps/xgames/exp277_mutants/
#Then:
#bash ~/gitrepos/RNAseq/pipe3/01-runner.sh