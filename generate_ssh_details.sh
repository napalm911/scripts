#!/bin/bash

# Default values
USERNAME=${1:-$USER}
SSH_PORT=${2:-22}
KEY_PATH="$HOME/.ssh/id_rsa"

# Generate SSH key pair if it doesn't exist
if [ ! -f "$KEY_PATH" ]; then
    echo "Generating SSH key pair..."
    ssh-keygen -t rsa -b 4096 -f "$KEY_PATH" -N ""
fi

# Get public IP address
HOSTNAME=$(curl -s ifconfig.me)

# Get SSH key details
PRIVATE_KEY=$(cat "$KEY_PATH")
PUBLIC_KEY=$(cat "$KEY_PATH.pub")

# Display output
echo "========================================="
echo "       SSH ACCESS DETAILS"
echo "========================================="
echo "🔹 Username:    $USERNAME"
echo "🔹 Hostname/IP: $HOSTNAME"
echo "🔹 SSH Port:    $SSH_PORT"
echo ""
echo "🔑 Public Key:"
echo "$PUBLIC_KEY"
echo ""
echo "🔐 Private Key:"
echo "$PRIVATE_KEY"
echo "========================================="
echo "📋 Quick Copy SSH Command:"
echo "ssh -i ~/.ssh/id_rsa -p $SSH_PORT $USERNAME@$HOSTNAME"
echo "========================================="

# Save details to a file (optional)
DETAILS_FILE="ssh_details.txt"
cat <<EOF > $DETAILS_FILE
Username:    $USERNAME
Hostname/IP: $HOSTNAME
SSH Port:    $SSH_PORT

Public Key:
$PUBLIC_KEY

Private Key:
$PRIVATE_KEY

Quick SSH Command:
ssh -i ~/.ssh/id_rsa -p $SSH_PORT $USERNAME@$HOSTNAME
EOF

echo "🔹 Details saved to: $DETAILS_FILE"
