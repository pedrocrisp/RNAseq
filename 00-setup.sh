#!/bin/bash

DEFAULTWS="~/workspace"

echo "Setting up workspace"


echo "enter your workspace directory [${DEFAULTWS}]"
read ws
if [ -d "$ws" ]
then
	Workspace="$ws"
else
	Workspace="$DEFAULTWS"
fi
