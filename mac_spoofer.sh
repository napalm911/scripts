#!/bin/bash
# Educational Proof of Concept: MAC Address Spoofer
# WARNING: Change the MAC address only on devices you own or are authorized to modify.
# This script uses 'macchanger' to randomize the MAC address for a specified network interface.
#
# Usage: ./mac_spoofer.sh <network_interface>
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <network_interface>"
  exit 1
fi

INTERFACE=$1
echo "Bringing down interface $INTERFACE..."
sudo ip link set "$INTERFACE" down

echo "Randomizing MAC address for $INTERFACE..."
sudo macchanger -r "$INTERFACE"

echo "Bringing up interface $INTERFACE..."
sudo ip link set "$INTERFACE" up

echo "New MAC address has been set for $INTERFACE."
