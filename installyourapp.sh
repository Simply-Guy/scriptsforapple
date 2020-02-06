#!/bin/sh -x

# beware: YourApp is a fictious name

logfile="/Library/Logs/yourlog.log"
user=`ls -l /dev/console | cut -d " " -f 4`
PRODUCT="YourApp"

#  installation
installyourapp ()
{
	# you could consider cleaning up your tmp space
	/bin/echo "`date`: Installing $PRODUCT for $user"  >> ${logfile}
	dmgfile="yourapp.dmg"
	volname="Your APP dmg Title"
	# adapt URL and cleanup below
	url=`curl https://download.yourapp.com/ | grep "Download YourApp" |  awk -F "\"" '{print $2}'`
	/bin/echo "`date`: Downloading $PRODUCT." >> ${logfile}
	/usr/bin/curl -L -o /tmp/yourapp.dmg $url
	/bin/echo "`date`: Mounting installer disk image." >> ${logfile}
	/usr/bin/hdiutil attach /tmp/yourapp.dmg -nobrowse -quiet
	/bin/sleep 5
	/bin/echo "`date`: Installing" >> ${logfile}
	cp -r /Volumes/YourApp/YourApp.app /Applications/
	/bin/sleep 5
	/bin/echo "`date`: Unmounting installer disk image" >> ${logfile}
	/usr/bin/hdiutil detach $(/bin/df | /usr/bin/grep ${volname} | awk '{print $1}') -quiet
	/bin/sleep 5
	/bin/echo "`date`: Deleting disk image." >> ${logfile}
	/bin/rm -f /tmp/yourapp.dmg
}

# decide to launch or to install
if [ -d /Applications/YourApp.app ]
then
	echo "YourApp installed, launching it now!"
	open -a /Applications/YourApp.app
else
	echo "YourApp is NOT installed, installing it now!"
	installyourapp
	open -a /Applications/YourApp.app
fi

exit 0