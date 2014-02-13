function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

findSamples | parallel bash fastqc.sh {}

