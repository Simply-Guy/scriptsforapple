#!/bin/bash

# Check if argument or path is added
# eg: ./yourscript.sh
 
if [[ "$1" != "" ]]; then
	DIR="$1"
else
	echo "NO PATH SET, THE SCRIPT EXITS NOW..." 1>&2
	exit 1
fi