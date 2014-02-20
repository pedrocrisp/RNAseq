###
#user defined variables:
workingdir=~/ps/xgames/exp277_mutants/
script=~/gitrepos/RNAseq/pipe3/02-scythe.sh
outdir=reads_scythe
###

function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

cd $workingdir
mkdir $outdir
timestamp=$(date +%Y%m%d-%H%M%S)

logdir="./logs/${outdir}.${timestamp}"
mkdir $logdir

cat $script > "$logdir/script.log"
cat $script

findSamples | parallel bash $script {} \>logs/${outdir}.${timestamp}/{}.log 2\>\&1

#To run:
#bash ~/path_to/02-scythe.sh