#!/bin/bash

# usage: /path/to/thisScript.sh /path/to/virtualMachine.vmwarevm/*.vmx
# source: https://www.jamf.com/jamf-nation/discussions/28192/vmware-fusion-vm-can-t-install-mdm-profile

VMXFILE="$1"

echo ""
echo "**********************************************************"
echo "IMPORTANT: To use this script, quit VMware Fusion first!!!"
echo "**********************************************************"
echo ""

echo "Enter your fake Serial Number for example 1234567891213."
read SERIALNUMBER

echo "Enter ModelIdentifier for example MacBookPro11,5 or iMacPro1,1"
read MODELIDENTIFIER

# Remove device specific crud

sed -i '' '/ethernet0.addressType/d' "$VMXFILE"
sed -i '' '/ethernet0.generatedAddress/d' "$VMXFILE"
sed -i '' '/ethernet0.generatedAddressOffset/d' "$VMXFILE"
sed -i '' '/uuid.bios/d' "$VMXFILE"
sed -i '' '/uuid.location/d' "$VMXFILE"
sed -i '' '/hw.model/d' "$VMXFILE"
sed -i '' '/serialNumber/d' "$VMXFILE"

# Add Model Identifier and Serial Number

echo "hw.model = $MODELIDENTIFIER" >> "$VMXFILE"
echo "serialNumber = $SERIALNUMBER" >> "$VMXFILE"

exit 0