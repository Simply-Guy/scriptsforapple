#!/bin/bash

# Make sure only root can run our script
# eg: sudo yourscript.sh

if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# your script here