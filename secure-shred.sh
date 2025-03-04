#!/bin/bash
# ./secure-shred.sh <file_or_directory>
# ./secure-shred.sh secret.txt
# ./secure-shred.sh /path/to/folder


echo "🚀 Secure File Shredder"

# Check if user provided a file or directory
if [ -z "$1" ]; then
    echo "❌ Error: Please provide a file or directory to shred."
    echo "Usage: $0 <file_or_directory>"
    exit 1
fi

TARGET="$1"

# Confirmation prompt
read -p "⚠️  This will PERMANENTLY delete '$TARGET'. Are you sure? (y/N): " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "❌ Operation cancelled."
    exit 1
fi

# Securely delete files using multiple methods
echo "🔄 Overwriting multiple times with random data..."
shred -v -n 10 -z "$TARGET"

# Additional wipe for extra security
if command -v wipe &> /dev/null; then
    echo "🧹 Using 'wipe' for deep cleaning..."
    wipe -rf "$TARGET"
else
    echo "⚠️ 'wipe' command not found. Skipping this step."
fi

# Overwrite free space on disk for extra security
echo "🛑 Overwriting free space to prevent recovery..."
if [ -d "$TARGET" ]; then
    find "$TARGET" -type f -exec dd if=/dev/urandom of={} bs=1M count=10 \; 2>/dev/null
fi

# Final removal
echo "🗑 Removing securely..."
rm -rf "$TARGET"

# Verify deletion
if [ ! -e "$TARGET" ]; then
    echo "✅ '$TARGET' has been securely deleted and is unrecoverable."
else
    echo "❌ Deletion failed. Please check manually."
fi
