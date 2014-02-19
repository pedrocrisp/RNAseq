function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

###
#user defined variables:
workingdir=~/alx_test
scriptdir=~/bec_pipeline/pipe3
###

cd $workingdir

#make sure path is correct
#pete@macpro
findSamples | parallel bash "$scriptdir/00-cat.sh"

#bash ~/bec_pipeline/pipe3/00-runner.sh