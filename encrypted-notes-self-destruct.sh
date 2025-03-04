#!/bin/bash
# Educational Proof of Concept: Encrypted Notes (Self-Destructing)
# WARNING: Use for personal notes only. Do not share encrypted data that
# others are not authorized to see.
#
# This script captures a note, encrypts it using GPG with a symmetric cipher,
# then securely deletes the plaintext file.
NOTE_FILE="secret_note.txt"
ENCRYPTED_FILE="secret_note.txt.gpg"

echo "Enter your secret note. Press Ctrl+D when finished:"
cat > "$NOTE_FILE"

echo "Encrypting the note..."
gpg --symmetric --cipher-algo AES256 "$NOTE_FILE"

if [ $? -eq 0 ]; then
  echo "Encryption successful. Securely deleting the original file..."
  shred -u "$NOTE_FILE"
else
  echo "Encryption failed."
fi
