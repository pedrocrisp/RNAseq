#!/bin/bash

# source common function script
scriptdir="$(dirname $(readlink -f $0))"
#basedir="$scriptdir/../"
#
#source "$basedir/common.sh"
#

######### Setup ################
keyfile=$1

# kefile format: (tab seperated)
#Ordinal	Sample	<factor1_name> [<factor2_name>]


########## Run #################
# sort keyfile. -n make the header line come at the start, if it starts with a letter
sort -o $keyfile -k1n $keyfile

function getSamples() {
	grep -iv Ordinal < $keyfile | cut -f 2
}

echo "Samples are:"
echo "$(getSamples)"

## enter steps ##

mkdir -p ./log

getSamples |parallel rm -rv ./shortstack/{} \; bash ${scriptdir}/shortstack.sh ./igv_bams_multi/{} ./shortstack/{} \>./log/shortstack/{}.log 2\>\&1
