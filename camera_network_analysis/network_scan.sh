#!/usr/bin/env bash
#
# network_scan.sh
# Scans the specified network range for live hosts.
# Usage: ./network_scan.sh 192.168.1.0/24

NETWORK_RANGE="${1:-192.168.1.0/24}"

if [[ $EUID -ne 0 ]]; then
  echo "[ERROR] This script must be run as root or with sudo."
  exit 1
fi

echo "[INFO] Performing a ping scan on $NETWORK_RANGE ..."
nmap -sn "$NETWORK_RANGE"

# Optionally, we can store the results to a file:
OUTPUT_FILE="./logs/nmap_scan_$(date +'%Y%m%d_%H%M%S').txt"
nmap -sn "$NETWORK_RANGE" > "$OUTPUT_FILE"

echo "[INFO] Scan complete. Results saved to $OUTPUT_FILE."