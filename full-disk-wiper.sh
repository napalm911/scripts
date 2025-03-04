#!/bin/bash
# Educational Proof of Concept: Full-Disk Wiper (Extreme Paranoia Mode)
# WARNING: THIS SCRIPT WILL IRREVERSIBLY WIPE A DISK.
# Use ONLY on devices you explicitly intend to erase.
# BACK UP ALL IMPORTANT DATA BEFORE PROCEEDING!
#
# Usage: ./full_disk_wipe.sh <disk_device>
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <disk_device>"
  echo "Example: $0 /dev/sdX"
  exit 1
fi

DISK=$1
echo "WARNING: This will completely wipe $DISK. Type 'YES' to proceed:"
read CONFIRM
if [ "$CONFIRM" != "YES" ]; then
  echo "Operation cancelled."
  exit 1
fi

echo "Wiping $DISK with random data..."
sudo dd if=/dev/urandom of="$DISK" bs=1M status=progress
echo "Disk wipe complete."
