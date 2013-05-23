#!/usr/bin/env python
from __future__ import print_function
import csv
from docopt import docopt
import os

__doc__ = """
setup RNAseq pipeline
USAGE:
	setup.py -k <keyfile> -b <basedir> -p <project> -r <rawdatadir>
"""

def main():
	arguments = docopt(__doc__)
	print("Setting up workspace")
	print(arguments)
	print("Moving to base dir %s" % arguments["basedir"])
	os.chdir(arguments["basedir"])
	os.mkdir(arguments["project"])
	print("At %s" % os.getcwd())
	
	
