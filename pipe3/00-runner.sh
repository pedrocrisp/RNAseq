###
#user defined variables:
workingdir=~/ps/xgames/exp277_mutants/
script=~/gitrepos/RNAseq/pipe3/00-cat.sh
###

function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

cd $workingdir

findSamples | parallel bash $script {}

#To run:
#bash ~/path_to/00-runner.sh