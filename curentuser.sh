#!/bin/bash

currentuser=`ls -l /dev/console | cut -d " " -f 4`
echo $currentuser