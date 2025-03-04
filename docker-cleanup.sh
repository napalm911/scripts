#!/bin/bash

echo "🚀 Starting Full Docker Cleanup..."

# Confirmation prompt
read -p "⚠️  This will REMOVE ALL Docker containers, images, volumes, and networks. Are you sure? (y/N): " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "❌ Cleanup aborted."
    exit 1
fi

echo "🛑 Stopping all running containers..."
docker stop $(docker ps -q) 2>/dev/null || echo "✅ No running containers."

echo "🗑 Removing all containers..."
docker rm $(docker ps -aq) 2>/dev/null || echo "✅ No containers to remove."

echo "🖼 Removing all images..."
docker rmi -f $(docker images -q) 2>/dev/null || echo "✅ No images to remove."

echo "📦 Removing all volumes..."
docker volume rm $(docker volume ls -q) 2>/dev/null || echo "✅ No volumes to remove."

echo "🌐 Removing all networks (except default ones)..."
docker network rm $(docker network ls | grep "bridge\|host\|none" -v | awk '{print $1}') 2>/dev/null || echo "✅ No networks to remove."

echo "🧹 Running full system prune..."
docker system prune -a --volumes -f

echo "✅ Docker environment fully cleaned!"
