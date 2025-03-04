#!/bin/bash
# Educational Proof of Concept: Anon Proxy Changer
# WARNING: Use only on networks where you have explicit permission.
# This script restarts the Tor service and sets environment variables
# to route supported application traffic through Tor.
#
# Requirements: Tor must be installed and configured.
echo "Restarting Tor service..."
sudo systemctl restart tor

echo "Setting proxy environment variables..."
export http_proxy="socks5://127.0.0.1:9050"
export https_proxy="socks5://127.0.0.1:9050"

echo "Proxy is now set. Applications that honor these variables will route traffic through Tor."
