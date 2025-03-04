#!/bin/bash
# Educational Proof of Concept: Domain Recon Script
# WARNING: Only scan domains you are authorized to assess.
#
# This script performs basic reconnaissance by retrieving DNS records and scanning for open ports.
# Usage: ./domain_recon.sh <domain>
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

DOMAIN=$1
echo "Performing DNS lookup for $DOMAIN..."
dig "$DOMAIN" ANY +noall +answer

echo "Scanning $DOMAIN for open ports..."
nmap -Pn "$DOMAIN"
