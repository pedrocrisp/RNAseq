###
#user defined variables:
workingdir=~/alx_test
scriptfile=~/bec_pipeline/pipe3/00-cat.sh
###

function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

cd $workingdir

findSamples | parallel bash $scriptfile

#To run:
#bash ~/bec_pipeline/pipe3/00-runner.sh