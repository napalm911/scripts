#!/bin/bash
# Educational Proof of Concept: USB Intrusion Detector
# WARNING: Use only on systems you are authorized to monitor.
#
# This script monitors system logs for USB device events.
echo "Monitoring USB events. Press Ctrl+C to exit."
tail -f /var/log/syslog | grep --line-buffered -i "usb"
