###
#user defined variables:
workingdir=~/ps/xgames/exp277_mutants/
script=~/gitrepos/RNAseq/pipe3/03-seqtk.sh
outdir=reads_scythe_seqtk
###

function findSamples () {
find reads_scythe/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
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
#bash ~/path_to/03-seqtk.sh