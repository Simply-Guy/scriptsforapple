#!/bin/bash

# version 2020-02-05
# this script will download the 3 latest macOS installers
# tested on macOS 10.15.3

softwareupdate --fetch-full-installer --full-installer-version 10.15.3 && say "Catalina OK"
softwareupdate --fetch-full-installer --full-installer-version 10.14.6 && say "Mojave OK"
softwareupdate --fetch-full-installer --full-installer-version 10.13.6 && say "High Sierra OK"