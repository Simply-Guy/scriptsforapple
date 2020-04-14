#!/bin/sh

user=`ls -l /dev/console | cut -d " " -f 4`
fullkey=`sudo fdesetup list | grep $user | awk -F "," '{print$2}'`
echo $fullkey

echo '<?xml version="1.0" encoding="UTF-8"?>' > /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml

echo '<plist version="1.0">' >> /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml
echo '<dict>' >> /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml

echo ' <key>RecoveryKey</key>' >> /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml

STRING1="<string>"
STRING2=$fullkey
STRING3="</string>"
JOIN=$STRING1$STRING2$STRING3

echo $JOIN >> /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml

echo '</dict>' >> /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml
echo '</plist>' >> /Library/Application\ Support/JAMF/file_vault_2_recovery_key.xml