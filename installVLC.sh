#!/bin/bash

rm -rf /Applications/VLC.app

mkdir /Users/Shared/Jamf/VLC
cd /Users/Shared/Jamf/VLC

Installing VLC Player
CurrentVLC=$(curl "https://get.videolan.org/vlc/last/macosx/" | grep .dmg | grep -v webplugin | grep -v md5 | grep -v sha1 | grep -v sha256 | awk '{print $2}' | awk -F ">" '{print $2}' | tr -d "</a")

curl -L -o vlc.dmg https://get.videolan.org/vlc/last/macosx/$CurrentVLC

hdiutil mount -nobrowse vlc.dmg -mountpoint /Volumes/vlc
rsync -vaz /Volumes/vlc/VLC.app/ /Applications/VLC.app
hdiutil unmount "/Volumes/vlc"
rm vlc.dmg
rm -rf /Users/Shared/Jamf/VLC