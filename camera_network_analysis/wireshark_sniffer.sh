#!/usr/bin/env bash
#
# wireshark_sniffer.sh
# Demonstrates how to capture traffic using TShark, Wireshark's CLI version.
#
# Usage: ./wireshark_sniffer.sh <interface>

INTERFACE="${1}"

if [[ -z "$INTERFACE" ]]; then
  echo "[USAGE] ./wireshark_sniffer.sh <interface>"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
  echo "[ERROR] This script must be run as root or with sudo."
  exit 1
fi

CAPTURE_FILE="./logs/captured_packets_$(date +'%Y%m%d_%H%M%S').pcap"

echo "[INFO] Starting packet capture on interface $INTERFACE ..."
echo "[INFO] Saving capture to $CAPTURE_FILE"
echo
echo "[LEGAL DISCLAIMER]"
echo "You must have authorization to capture packets on $INTERFACE."
echo

# Start a TShark capture
tshark -i "$INTERFACE" -w "$CAPTURE_FILE" &
TSHARK_PID=$!

echo "[INFO] TShark is running in the background with PID $TSHARK_PID"
echo "Press ENTER to stop capturing."

read
kill "$TSHARK_PID"
echo "[INFO] Capture stopped. File saved to: $CAPTURE_FILE"