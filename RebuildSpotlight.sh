#!/bin/bash

# Usage: sudo RebuildSpotlight /Volumes/YourVolume

# Written by Guy Kelecom.
# Feel free to reuse or adapt

# Make sure only root can run our script
# eg: sudo yourscript.sh

if [ "$(id -u)" != "0" ]; then
	echo "You forgot to sudo. Please try again." 1>&2
	exit 1
fi

# Check if argument or path is added
# eg: ./yourscript.sh someargument
 
if [[ "$1" != "" ]]; then
	ARGUMENT1="$1"
else
	echo "You forgot to add the Volume" 1>&2
	exit 1
fi

# Rebuilding the Spotlightindex
echo "First we will turn off indexing"
#mdutil -E -i off $1
echo "Indexing off"
echo "Now we will enable indexing"
#mdutil -i on $1
echo "Indexing enabled"
echo "It can take quite a while to index. Open Spotlight and type: indexing"