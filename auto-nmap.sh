#!/bin/bash
# Educational Proof of Concept: Auto Nmap Scanner
# WARNING: Only scan targets you are authorized to scan.
#
# This script runs an Nmap scan and outputs a report.
# Usage: ./auto_nmap.sh <target_ip_or_domain>
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <target_ip_or_domain>"
  exit 1
fi

TARGET=$1
echo "Scanning $TARGET with Nmap..."
nmap -sV -Pn "$TARGET" -oN "nmap_scan_$TARGET.txt"
echo "Scan complete. Report saved as nmap_scan_$TARGET.txt."
