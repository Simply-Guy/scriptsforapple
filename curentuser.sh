#!/bin/bash

currentuser=`ls -l /dev/console | cut -d " " -f 4`
echo $currentuser

loggedInUser=$( ls -l /dev/console | awk '{print $3}' )
echo $loggedInUser