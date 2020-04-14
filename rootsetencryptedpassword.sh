#!/bin/sh
# This script will set the root password to a known value via encrypted string, check to see that a password is set, and leave a cookie.

#Decrypt String Function for account passwords
function DecryptString() {
	# Usage: ~$ DecryptString "Encrypted String" "Salt" "Passphrase"
	echo "${1}" | /usr/bin/openssl enc -aes256 -d -a -A -S "${2}" -k "${3}"
}

#Encrypted strings for passwords
rootpwd=$( DecryptString "$4" salthere passphrasehere )

#Enable root user and set password
dscl . -passwd /Users/root '$rootpwd'

#Check if root password is enabled
rootpwdtest=$( dscl . -read /Users/root Password )
if [ "$rootpwdtest" == "Password: ********" ]; then
	echo "Root password set. Proceeding."
else
	echo "Root password not set. Exit 1."
	exit 1
fi

#Check for Management directory and create and place touchfile
managementDir="/Library/Management"
touchFile="/Library/Management/.macOSHighSierraRootPassFix"

if [ -d "${managementDir}" ]; then
					/usr/bin/touch "${touchFile}"
				else
					mkdir -p "${managementDir}"
					/usr/bin/touch "${touchFile}"
fi
exit 0