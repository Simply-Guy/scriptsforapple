#!/bin/bash

title="This is the Title"
heading="This is the header"
description='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
button1="OK"
defaultButton="1"
button2="Cancel"
cancelButton="2"
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
icon="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/com.apple.macbook-retina-space-gray.icns"

RESULT=`"$jamfHelper" -windowType hud -title "$title" -heading "$heading" -description "$description" -button1 "$button1"  -button2 "$button2" -defaultButton "$defaultButton" -icon "$icon" -lockHUD`
jamfHelperPID=$(/bin/echo $!)
sleep 5
kill "$jamfHelperPID" > /dev/null 2>&1 && wait $! > /dev/null