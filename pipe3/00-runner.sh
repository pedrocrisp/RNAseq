###
#user defined variables:
workingdir=~/ps/xgames/exp277_mutants/
scriptfile=~/gitrepos/RNAseq/pipe3/00-cat.sh
###

function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

cd $workingdir

findSamples | parallel bash $scriptfile

#To run:
#bash ~/path_to/00-runner.sh
#bash ~/path_to/00-runner.sh