#!/bin/bash

echo "🔍 Checking common development-related cache directories..."

# Utility function
check_size() {
  if [ -d "$1" ]; then
    du -sh "$1"
  else
    echo "❌ Not found: $1"
  fi
}

echo -e "\n📦 npm cache:"
check_size "$HOME/.npm"

echo -e "\n📦 pnpm store:"
check_size "$(pnpm store path 2>/dev/null || echo "$HOME/Library/pnpm/store")"

echo -e "\n📦 Gradle cache:"
check_size "$HOME/.gradle/caches"

echo -e "\n📱 Android SDK:"
check_size "$HOME/Library/Android/sdk"

echo -e "\n📁 Android Studio cache:"
check_size "$HOME/Library/Caches/Google/AndroidStudio"
check_size "$HOME/Library/Application Support/Google/AndroidStudio"

echo -e "\n🧪 Xcode DerivedData:"
check_size "$HOME/Library/Developer/Xcode/DerivedData"

echo -e "\n📱 iOS Simulator devices:"
check_size "$HOME/Library/Developer/CoreSimulator/Devices"

echo -e "\n🛢 Docker disk usage:"
docker system df || echo "Docker not installed or not running"

echo -e "\n💾 iOS backup:"
check_size "$HOME/Library/Application Support/MobileSync/Backup"

echo -e "\n🔍 Spotlight index size:"
check_size "/.Spotlight-V100"

echo -e "\n✅ Done."

