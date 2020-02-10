#!/bin/bash

# variables we use
log="/path/to/log"

#declaring the function
function writelog () {
	DATE=$(date +%Y-%m-%d\ %H:%M:%S)
	/bin/echo "${1}"
	/bin/echo "$DATE" " $1" >> "$log"
}

# here we go

writelog "--== Starting our magic ==--"
writelog "--== First awesome part ==--"
# insert awesome script here
writelog "--== Doing some more fantastic stuff ==--"
# insert fantastic script here
writelog "--== Enough magic for 1 day ==--"
