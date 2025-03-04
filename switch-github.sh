#!/bin/bash

echo "🚀 GitHub Account Switcher"

# Ask for GitHub username and Personal Access Token (PAT)
read -p "🔹 Enter your GitHub username: " GITHUB_USER
read -s -p "🔑 Enter your GitHub Personal Access Token (PAT): " GITHUB_PAT
echo ""

# Validate input
if [[ -z "$GITHUB_USER" || -z "$GITHUB_PAT" ]]; then
    echo "❌ Error: Username or PAT cannot be empty!"
    exit 1
fi

# Remove old credentials securely
echo "🧹 Removing old GitHub credentials..."
git credential reject "https://github.com" >/dev/null 2>&1
git credential reject "https://$GITHUB_USER@github.com" >/dev/null 2>&1

# Set new credentials
echo "📝 Configuring new GitHub credentials..."
git config --global user.name "$GITHUB_USER"
git config --global credential.helper store

# Store credentials securely for future Git use
echo "https://$GITHUB_USER:$GITHUB_PAT@github.com" | git credential approve

# Verify authentication
echo "🔍 Verifying GitHub authentication..."
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -u "$GITHUB_USER:$GITHUB_PAT" https://api.github.com/user)

if [[ "$RESPONSE" == "200" ]]; then
    echo "✅ Authentication successful! You are now using GitHub as **$GITHUB_USER**."
else
    echo "❌ Authentication failed! Please check your credentials."
    exit 1
fi
